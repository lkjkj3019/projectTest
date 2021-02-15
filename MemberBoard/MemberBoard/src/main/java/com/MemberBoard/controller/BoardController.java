package com.MemberBoard.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.MemberBoard.dto.BoardDTO;
import com.MemberBoard.service.BoardService;

@Controller
public class BoardController {
	
	//데이터를 전송시킬 수 있는 리턴 타입
	private ModelAndView mav;
	
	@Autowired
	private BoardService boardsvc;

	
	//게시판 목록출력
	@RequestMapping(value = "/boardList")
	public ModelAndView boardList() {
		System.out.println("/boardList");
		//mav = new ModelAndView(); 이걸 따로 만들지 않아도 할수있음
		mav = boardsvc.boardList();
		
		return mav;
	}
	
	
	//게시판 페이징 목록출력
	@RequestMapping(value = "/boardListPaging")
	public ModelAndView boardListPaging(@RequestParam(value = "page", defaultValue = "1") int page) {
																//defaultValue : Param값이 없으면 기본적으로 "이거"를 사용해라
		System.out.println("/boardListPaging");
		
		System.out.println("page : " + page);
		mav = boardsvc.boardListPaging(page);
		//페이징이란..? ex)1번 페이지에서는 글이 10개가 출력이 된다고 치면 2번 페이지에서 나머지 남은 글이 출력되는데 (주소창에도 나타남ㅇㅇ)
		//page번호를 가지고 1번페이지에 해당하는 목록만 출력(콘솔)을 할려고 데이터를 출력하는걸 최소화를 해서 느림방지도됨
		
		return mav;
	}
	
	
	//게시판 작성 페이지
	@RequestMapping(value = "/boardWriteForm")
	public String boardWriteForm() {
		
		return "board/boardWriteForm";
	}
	
	
	//게시판 작성
	@RequestMapping(value = "/boardWrite")
	public ModelAndView boardWrite(BoardDTO dto, RedirectAttributes ra) {
		//RedirectAttributes가 제공하는 메소드 addFlashAttribute()
		//addFlashAttribute()는 리다이렉트 직전 플래시에 저장하는 메소드다. 
		//리다이렉트 이후에는 소멸한다.
		//이 클래스는 Model의 기능을 그대로 확장(extends)했으며, 몇개의 도움 메소드가 추가됐다.
		System.out.println("/boardWrite");
		System.out.println(dto);
		mav = boardsvc.boardWrite(dto,ra);
		return mav;
	}
	
	
	//게시판 상세보기
	@RequestMapping(value = "/boardView")
	public ModelAndView boardView(@RequestParam("bno") int bno) { //@RequestParam는 하나의 파라매터로 받아라
		System.out.println("/boardView");
		System.out.println("bno : " + bno);
		mav = boardsvc.boardView(bno);
		return mav;
	}
	
	
	//게시판 수정페이지
	@RequestMapping(value = "/boardModify")
	public ModelAndView boardModify(@RequestParam("bno") int bno) { //@RequestParam는 하나의 파라매터로 받아라
		System.out.println("/boardModify");
		System.out.println("bno : " + bno);
		mav = boardsvc.boardModify(bno);
		return mav;
	}
	
	
	//게시판 수정
	@RequestMapping(value = "/boardModifyProcess")
	public ModelAndView boardModifyProcess(BoardDTO dto) {
		//RedirectAttributes가 제공하는 메소드 addFlashAttribute()
		//addFlashAttribute()는 리다이렉트 직전 플래시에 저장하는 메소드다. 
		//리다이렉트 이후에는 소멸한다.
		//이 클래스는 Model의 기능을 그대로 확장(extends)했으며, 몇개의 도움 메소드가 추가됐다.
		System.out.println("/boardModifyProcess");
		System.out.println(dto);
		mav = boardsvc.boardModifyProcess(dto);
		return mav;
	} 
	
	
	//게시판 삭제
	@RequestMapping(value = "/boardDelete")
	public ModelAndView boardDelete(@RequestParam("bno") int bno, RedirectAttributes ra) {
		System.out.println("/boardDelete");
		
		System.out.println("bno : " + bno);
		mav = boardsvc.boardDelete(bno, ra);
		
		return mav;
	}
	
	
	//게시판 부분검색
	@RequestMapping(value = "/boardSearch")
	public ModelAndView boardSearch(@RequestParam("searchType") String searchType, @RequestParam("keyWord") String keyWord) {
		//searchType는 검색방식의 대한 파라매터  -  keyWord는 검색 방식방법에 대한 파라매터
		System.out.println("/boardSearch");
		
		System.out.println(searchType+"::"+keyWord);
		mav = boardsvc.boardSearch(searchType,keyWord);
		
		return mav;
	}
	
	
	//파일 업로드 가능 한 페이지
	@RequestMapping(value = "/boardWriteFileForm")
	public String boardWriteFileForm() {
		return "/board/boardWriteFileForm";
	}
	
	
	//파일 업로드
	@RequestMapping(value = "/boardWriteFile")
	public ModelAndView boardWriteFile(BoardDTO dto, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("/boardWriteFile");
		System.out.println(dto);
		mav = boardsvc.boardWriteFile(dto,ra);
		return mav;
	}


	//작성자 선택후 게시글 검색
	@RequestMapping(value = "/boardListMember")
	public ModelAndView boardListMember(String bwriter) {
		System.out.println("/boardListMember");
		mav = boardsvc.boardListMember(bwriter);
		return mav;
	}
	
	
	
}
