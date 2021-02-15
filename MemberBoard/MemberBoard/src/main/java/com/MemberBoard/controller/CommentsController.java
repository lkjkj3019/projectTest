package com.MemberBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.MemberBoard.dto.CommentsDTO;
import com.MemberBoard.service.CommentsService;

@Controller
	public class CommentsController {

		@Autowired
		private CommentsService commentsvc;
		
		//댓글쓰기
		@RequestMapping(value = "/commentWrite")//boardView에 있는 url : "commentWrite"
		public @ResponseBody ArrayList<CommentsDTO> commentsList(CommentsDTO mentdto){
			//@ResponseBody : 데이터 자체를 넘겨주는 아이
			ArrayList<CommentsDTO> commentsList = commentsvc.commentWrite(mentdto);
			
			System.out.println(commentsList);
			
			return commentsList;
		}
		
		//댓글목록
		@RequestMapping(value = "/commentList")
		public @ResponseBody ArrayList<CommentsDTO> commentList(int cbno){
			//@ResponseBody는 페이지에 데이터들을 리턴할때 쓰임
			System.out.println("/commentList");
			ArrayList<CommentsDTO> commentList = commentsvc.commentList(cbno);
			return commentList;//페이지리턴이 아니라 뷰페이지에 데이터를 리턴해주는거임
		}
		
		//댓글삭제
		@RequestMapping(value = "/commentDelete")
		public @ResponseBody ArrayList<CommentsDTO> commentDelete(CommentsDTO mentdto){
			System.out.println("/commentDelete");
			System.out.println(mentdto);
			ArrayList<CommentsDTO> commentList = commentsvc.commentDelete(mentdto);
			return commentList;//페이지리턴이 아니라 뷰페이지에 데이터를 리턴해주는거임
			//그러니깐 댓글목록을 다시한번 select해서 출력해주는거임 새로고침?
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}

