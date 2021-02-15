package com.MemberBoard.service;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.MemberBoard.dto.MembersDTO;
import com.MemberBoard.dto.PageDTO;
import com.MemberBoard.mapper.MembersMapper;

@Service
public class MembercService {

	@Autowired
	private MembersMapper memmapper;
	
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	
	//회원가입시 아이디 중복확인
	public String idCheck(String inputMid) {
		String idCheck = memmapper.idCheck(inputMid);
		
		String checkResult = null;
		if(idCheck==null) {
			checkResult = "OK";
		} else {
			checkResult = "NO";
		}
		return checkResult;
	}


	//회원가입
	public ModelAndView memberJoin(MembersDTO memdto, RedirectAttributes ra) {
		mav = new ModelAndView();
		System.out.println("service :: memberJoin");
		//전체이메일에 메일앞+도메인을 넣을꺼야
		memdto.setMemail(memdto.getMemailid() 
								+ "@" 
								+ memdto.getMdomain());
		
		//전체주소에 다 넣을꺼야
		memdto.setMadd("(" + memdto.getMpost() + ")" 
								+ memdto.getMaddr()
								+ memdto.getMexadd()
								+ memdto.getMdetail());
		
		int memJoin = memmapper.memberJoin(memdto);
		if(memJoin > 0) {
			ra.addFlashAttribute("msg",memdto.getMid()+ " 님 가입을 축하드림.");
		}
		System.out.println("memJoin : " + memJoin);
		
		//mav.setViewName("member/memberLoginForm");
		mav.setViewName("redirect:/memberLoginForm");
		return mav;
	}


	//로그인
	public ModelAndView memberLogin(MembersDTO memdto) {
		mav = new ModelAndView();
		
		String loginId = memmapper.memberLogin(memdto);
		System.out.println("loginId::" + loginId);
		session.setAttribute("loginId", loginId);
		
		//현재 로그인중인 아이디의 프로필이미지이름 출력
		String profileImg = memmapper.getProfile(memdto.getMid());
		System.out.println("profileImg:" + profileImg);
		session.setAttribute("profileImg", profileImg);
		
		mav.setViewName("redirect:/");//아예 맨첨 페이지로 이동
		return mav;
	}


	//내정보
	public ModelAndView memberView(String mid) {
		mav = new ModelAndView();
		
		MembersDTO memdto = memmapper.memberView(mid);
		
		mav.addObject("memdto", memdto);
		mav.setViewName("member/memberView");
		
		return mav;
	}


	//정보수정 - 전화번호
	public String updateMphone(MembersDTO memdto) {
		int result = memmapper.updateMphone(memdto);
		
		String updateResult = null;
		if(result>0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}


	//정보수정 - 이메일
	public String updateMemail(MembersDTO memdto) {
		int result = memmapper.updateMemail(memdto);
		
		String updateResult = null;
		if(result>0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}


	//프로필 이미지 파일업로드
	public ModelAndView fileUpdate(MembersDTO memdto) throws IllegalStateException, IOException {
														//예외처리해주고
		mav = new ModelAndView();
		
		//UUID
		UUID uuid = UUID.randomUUID();//파일이름들을 랜덤으로 주어지게 해줌 중복안돼게
		
		MultipartFile mfile = memdto.getMfile();//mfile만 같은 타입의 객체로 끄집어 낸거임
		
		//저장 경로 설정
		String mfilename = "";
		String savePath = "C:\\Users\\user\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\MemberBoard\\src\\main\\webapp\\resources\\profileUpload\\";
		
		//기존에 있던 프로필이미지 삭제
		savePath = "C:\\Users\\user\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\MemberBoard\\src\\main\\webapp\\resources\\profileUpload\\";
		mfilename = memmapper.getProfile(memdto.getMid());
		File file = new File(savePath+mfilename);
		file.delete();
		
		//새로운 프로필이미지 파일 저장
		if(!mfile.isEmpty()) {
			mfilename = uuid.toString()+"_"+mfile.getOriginalFilename();
			mfile.transferTo(new File(savePath+mfilename));
			//transferTo:저장된 파일을 여기에 넣겠다
			
			//기존 세션은 사라지고, 새로운 세션으로 변경
			session.removeAttribute("profileImg");
			session.setAttribute("profileImg", mfilename);
		}
		memdto.setMfilename(mfilename);
		
		//MEMBERS 테이블 UPDATE
		int profile = memmapper.fileUpdate(memdto);
		System.out.println("profile : " + profile);
		
		//setView = memberView
		mav.setViewName("redirect:/memberView?mid="+memdto.getMid());//로그인사태이기때문에 그 아이디로데이터를 찾아서 가져오는
						//redirect는 데이터가 있는 상태에서 넘어가줘
		return mav;
	}


	//아이디옆 프로필이미지 변경
	public String getProfile(String mid) {
		
		String profile = memmapper.getProfile(mid);
		
		return profile;
	}


	//회원목록 출력
	public ModelAndView memberList(int page) {
		mav = new ModelAndView();
		
		//1페이지에 보여지는 회원수, 페이지번호수
		int pageLimit = 3;
		int pageNumLimit = 2;
		
		//1페이지에 보여지는 첫페, 끝페
		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		
		//페이지 필드선언 - 회원목록에서 1번회원, 마지막등록회원
		PageDTO pagedto = new PageDTO();
		pagedto.setStartrow(startRow);
		pagedto.setEndrow(endRow);
		
		//전체회원array
		ArrayList<MembersDTO> memdto = memmapper.memberList(pagedto);
		System.out.println(memdto);
		
		//전체 회원수
		int memberListCnt = memmapper.getMemberListCnt();
		
		//최대 page수
		int maxPage = (int)(Math.ceil( (double)memberListCnt/pageLimit) );
		
		//첫페, 끝페
		int startPage = ((int)(Math.ceil((double)page/pageNumLimit)) -1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		pagedto.setPage(page);
		pagedto.setStartpage(startPage);
		pagedto.setEndpage(endPage);
		pagedto.setMaxpage(maxPage);
		
		mav.addObject("pagedto", pagedto);
		mav.addObject("memdto", memdto);
		mav.setViewName("member/memberList");
		
		return mav;
	}


	//회원삭제
	public ModelAndView memberDelete(String mid) {
		mav = new ModelAndView();
		
		//mid에 해당하는 프로필이미지 삭제
		String savePath = "C:\\Users\\user\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\MemberBoard\\src\\main\\webapp\\resources\\profileUpload\\";
		String mfilename = memmapper.getProfile(mid);//프로필 변경에서 선언했던 get으로
		File file = new File(savePath+mfilename);
		file.delete();
		
		//MEMBERS테이블에서 mid삭제
		int memDelete = memmapper.memberDelete(mid);
		System.out.println("memDelete::" + memDelete);
		
		//회원목록 페이지로 이동
		mav.setViewName("redirect:/memberList");
		return mav;
	}


	


	
	
	
	
	
	

}
