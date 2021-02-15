package com.MemberBoard.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MembersMsgDTO {

	private String msg_sendid;       //보내는 아이디
	private String msg_receiveid;    //받는 아이디
	private String msg_content;      //메시지 내용
	
	private String msg_date;           //보낸날짜
	private int msg_check;           //미확인(0)/확인(1)
}
