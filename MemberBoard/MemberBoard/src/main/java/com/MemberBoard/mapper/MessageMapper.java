package com.MemberBoard.mapper;

import java.util.ArrayList;

import com.MemberBoard.dto.MembersMsgDTO;

public interface MessageMapper {

	
	public int sendMsg(MembersMsgDTO msgdto);

	public ArrayList<MembersMsgDTO> receiveMsg(String msg_receiveid);

	public int checkUpdate(MembersMsgDTO msgdto);

}
