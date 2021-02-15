package com.MemberBoard.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MembersDTO {

	private String mid;       //아이디
	private String mpassword; //비번
	private String mname;     //이름
	private String mphone;    //폰번
	
	private String memail;   //전체이메일주소
	private String memailid; //메일앞쪽
	private String mdomain;  //도메인뒷쪽
	
	private Date mbirth;     //생년월일
	
	private String madd;    //전체주소
	private String mpost;   //우편번호
	private String maddr;   //주소
	private String mexadd;  //참고항목
	private String mdetail; //상세주소
	
	private MultipartFile mfile; //파일을 받을수있는
	private String mfilename;
}
