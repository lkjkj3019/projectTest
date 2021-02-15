package com.MemberBoard.mapper;

import java.util.ArrayList;

import com.MemberBoard.dto.CommentsDTO;

public interface CommentsMapper {

	public int getMaxCno();

	public int commentWrite(CommentsDTO mentdto);

	public ArrayList<CommentsDTO> commentList(int cbno);

	public int commentDelete(int cno);

	public int allCommentDelete(int bno);

	public int commentCnt(int cbno);

}
