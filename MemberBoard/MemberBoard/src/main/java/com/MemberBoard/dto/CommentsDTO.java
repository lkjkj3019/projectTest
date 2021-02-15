package com.MemberBoard.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentsDTO {

	private int cno;
	private int cbno;
	private String cwriter;
	private String ccontent;
	private Date cdate;
	
}
