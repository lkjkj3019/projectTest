package com.MemberBoard.controller;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.MemberBoard.dto.MembersDTO;
import com.MemberBoard.service.MembercService;

import lombok.val;

@Controller
public class MembersController {

	@Autowired
	private MembercService memsvc;
	
	private ModelAndView mav;
	
	@Autowired
	HttpSession session;
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/memberJoinForm")
	public String memberJoinForm() {
		return "member/memberJoinForm";
	}
	
	
	//회원가입시 아이디 중복확인
	@RequestMapping(value = "/idCheck")
	public @ResponseBody String idCheck(String inputMid) {
		String idCheck = memsvc.idCheck(inputMid);
		return idCheck;
	}
	
	
	//회원가입
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(MembersDTO memdto, RedirectAttributes ra) {
		System.out.println("/memberJoin");
		System.out.println(memdto);
		
		mav = memsvc.memberJoin(memdto, ra);
		return mav;
	}
		
	
	//로그인 페이지 이동
	@RequestMapping(value = "/memberLoginForm")
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}
	
	
	//로그인
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(MembersDTO memdto) {
		System.out.println("/memberLogin");
		
		mav = memsvc.memberLogin(memdto);
		return mav;
	}
	
	
	//로그아웃
	@RequestMapping(value = "/memberLogout")
	public String memberLogout() {
		session.invalidate();
		
		return "/home"; 
	}
	
	
	//내정보
	@RequestMapping(value = "/memberView")
	public ModelAndView memberView(String mid) {
		System.out.println("/memberView");
		
		System.out.println("mid::" + mid);
		
		mav = memsvc.memberView(mid);
		return mav;
	}
	
	
	//정보수정 - 전화번호
	@RequestMapping(value = "/updateMphone")
	public @ResponseBody String updateMphone(MembersDTO memdto) {
		System.out.println("/updateMphone");
		
		String updateResult = memsvc.updateMphone(memdto);
		return updateResult;
	}
	
	
	//정보수정 - 이메일
	@RequestMapping(value = "/updateMemail")
	public @ResponseBody String updateMemail(MembersDTO memdto) {
		System.out.println("/updateMemail");
		System.out.println(memdto);
		String updateResult = memsvc.updateMemail(memdto);
		return updateResult;
	}
	
	
	//프로필 이미지 파일업로드
	@RequestMapping (value = "/fileUpdate")
	public ModelAndView fileUpdate(MembersDTO memdto) throws IllegalStateException, IOException {
		System.out.println("/fileUpdate");
		System.out.println(memdto);
		
		mav = memsvc.fileUpdate(memdto);
		return mav;
	}
	
	
	//아이디옆 프로필이미지 변경
	@RequestMapping (value = "/getProfile")
	public @ResponseBody String getProfile(String mid) {
		System.out.println("/getProfile::"+mid);
		
		String profile = memsvc.getProfile(mid);
		
		return profile;
	}
	
	
	//회원목록 출력
	@RequestMapping (value = "/memberList")
	public ModelAndView memberList(@RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/memberList::page" + page);
		
		mav = memsvc.memberList(page);
		
		return mav;
	}
	
	
	//회원삭제
	@RequestMapping (value = "/memberDelete")
	public ModelAndView memberDelete(String mid) {
		System.out.println("/memberDelete::" + mid);
		
		mav = memsvc.memberDelete(mid);
		return mav;
	}
	
	
	
	
	
	
	
}
