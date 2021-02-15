package com.MemberBoard.dto;

import lombok.Data;

@Data
public class PageDTO {//paging처리에만 사용되는 dto 테이블 필요없음

	//몇번페이지를 보고있는지 확인하는 필드
	private int page; 
	
	//가장끝 페이지번호 필드
	private int maxpage;
	
	//페이지 넘기는 메뉴에서 시작하는 페이지번호 필드
	private int startpage;
	//페이지 넘기는 메뉴에서 끝나는 페이지번호 필드
	private int endpage;
	
	//리스트중에 화면에 처음 노출되는 글(행)번호 
	private int startrow;
	//리스트중에 화면에 끝 노출되는 글(행)번호 
	private int endrow;
	
}
