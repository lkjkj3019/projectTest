package com.MemberBoard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MemberBoard.dto.CommentsDTO;
import com.MemberBoard.mapper.CommentsMapper;

@Service
public class CommentsService {

	@Autowired
	private CommentsMapper commentsMapper;
	
	public ArrayList<CommentsDTO> commentWrite(CommentsDTO mentdto) {
		//댓글번호
		int nextCno = commentsMapper.getMaxCno()+1;
		mentdto.setCno(nextCno);
		
		//댓글 insert
		int commentWrite = commentsMapper.commentWrite(mentdto);
		System.out.println("commentWrite : "+commentWrite);//댓글이 입력이되면 얘가 출력됨
		
		//cbno글번호와 일치하는 댓글 select
		ArrayList<CommentsDTO> commentList = commentsMapper.commentList(mentdto.getCbno());//번호를 넘겨줘야되니깐
		
		return commentList;
	}

	public ArrayList<CommentsDTO> commentList(int cbno) {
		ArrayList<CommentsDTO> commentList = commentsMapper.commentList(cbno);//view페이지에서 result에 담긴데
		
		return commentList;
	}

	public ArrayList<CommentsDTO> commentDelete(CommentsDTO mentdto) {
		//댓글삭제처리
		int delete = commentsMapper.commentDelete(mentdto.getCno());
		System.out.println("delete : " + delete);
		
		//댓글목록검색
		ArrayList<CommentsDTO> commentList = commentsMapper.commentList(mentdto.getCbno());//번호를 넘겨줘야되니깐
		
		return commentList;
	}
	
	
}
