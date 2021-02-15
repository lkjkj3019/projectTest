package com.MemberBoard.mapper;

import java.util.ArrayList;

import com.MemberBoard.dto.MembersDTO;
import com.MemberBoard.dto.PageDTO;

public interface MembersMapper {

	public String idCheck(String inputMid);

	public int memberJoin(MembersDTO memdto);

	public String memberLogin(MembersDTO memdto);

	public MembersDTO memberView(String mid);

	public int updateMphone(MembersDTO memdto);

	public int updateMemail(MembersDTO memdto);

	public int fileUpdate(MembersDTO memdto);

	public String getProfile(String mid);

	public ArrayList<MembersDTO> memberList(PageDTO pagedto);

	public int getMemberListCnt();


	public int memberDelete(String mid);


	

}
