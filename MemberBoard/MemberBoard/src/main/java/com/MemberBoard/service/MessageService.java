package com.MemberBoard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MemberBoard.dto.MembersMsgDTO;
import com.MemberBoard.mapper.MessageMapper;

@Service
public class MessageService {

	@Autowired
	private MessageMapper msgmapper;

	
	
	//메세지 보내기
	public String sendMsg(MembersMsgDTO msgdto) {
		int insert = msgmapper.sendMsg(msgdto);
		
		String send = "NO";
		
		if(insert>0) {
			send = "OK";
		}
		return send;
	}


	//메세지 리스트 출력
	public ArrayList<MembersMsgDTO> receiveMsg(String msg_receiveid) {//받는 아이디
		ArrayList<MembersMsgDTO> msgList = msgmapper.receiveMsg(msg_receiveid);
		System.out.println("msgList::"+msgList);
		return msgList;
	}


	//읽음표시로 변경
	public String checkUpdate(MembersMsgDTO msgdto) {
		int update = msgmapper.checkUpdate(msgdto);
		
		String updateResult = "NO";
		if(update>0) {
			updateResult = "OK";
		}
		return updateResult;
	}


	
	
}
