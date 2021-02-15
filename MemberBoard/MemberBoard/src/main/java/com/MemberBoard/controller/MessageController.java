package com.MemberBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.MemberBoard.dto.MembersMsgDTO;
import com.MemberBoard.service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService msgsvc;

	
	
	//메세지 보내기
	@RequestMapping(value = "/sendMsg")
	public @ResponseBody String sendMsg(MembersMsgDTO msgdto) {
	System.out.println("/sendMsg_msgdto::" + msgdto);
	String sendResult = msgsvc.sendMsg(msgdto);
	return sendResult;
	}
	
	
	//메세지 리스트 출력
	@RequestMapping(value = "/receiveMsg")
	public @ResponseBody ArrayList<MembersMsgDTO> receiveMsg(String msg_receiveid){//받는 아이디
		System.out.println("/receiveMsg");
		ArrayList<MembersMsgDTO> msgList = msgsvc.receiveMsg(msg_receiveid);
		
		return msgList;
	}
	
	
	//읽음표시로 변경
	@RequestMapping (value = "/checkUpdate")
	public @ResponseBody String checkUpdate(MembersMsgDTO msgdto) {
		System.out.println("/checkUpdate");
		System.out.println(msgdto);
		
		String update = msgsvc.checkUpdate(msgdto);
		return update;
	}
}
