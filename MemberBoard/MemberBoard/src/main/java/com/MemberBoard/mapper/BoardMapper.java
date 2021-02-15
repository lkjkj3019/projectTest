package com.MemberBoard.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.MemberBoard.dto.BoardDTO;
import com.MemberBoard.dto.PageDTO;


public interface BoardMapper {

	@Select("SELECT * FROM BOARD")
	public ArrayList<BoardDTO> boardList();
	
	public ArrayList<BoardDTO> boardList2();//퀴리문이 아님(내용이 없는거임ㅇㅇ)

	public int getMaxBno();

	public int boardWrite(BoardDTO dto);

	public BoardDTO boardView(int bno);

	public int boardModifyProcess(BoardDTO dto);

	public int boardDelete(int bno);

	/*
	@Select("SELECT * FROM BOARD WHERE BTILTE LIKE #{keyWord}")
	public ArrayList<BoardDTO> search1(String keyWord);
	
	@Select("SELECT * FROM BOARD WHERE BWRITER LIKE '%'||#{keyWord}||'%'")// ||이연산자는 문자를 결합시키는 아이
	public ArrayList<BoardDTO> search2(String keyWord);
	*/
	
	//또는?
	public ArrayList<BoardDTO> boardSearch(HashMap<String, String> map);

	@Update("UPDATE BOARD SET BHIT=BHIT+1 WHERE BNO=#{bno}")
	public void updateBhit(int bno);

	public int boardFile(BoardDTO dto);

	public String getBfileName(int bno);

	public ArrayList<BoardDTO> boardListPaging(PageDTO pagedto);

	public int getBoardListCnt();

	public ArrayList<BoardDTO> boardListMember(String bwriter);
	
	
	
	
	
	
}
