package com.MemberBoard.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {

	private int bno;
	private String bwriter;
	private String bpassword;
	private String btitle;
	private String bcontent;
	private Date bdate;
	private int bhit;

	private MultipartFile bfile;
	private String bfilename;
	
	private int commentCnt;
}
