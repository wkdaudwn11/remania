package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.member.JoinDAO;
import com.entity.member.MemberDTO;

public class JoinService {

	@Autowired
	private JoinDAO dao;

	public void setDao(JoinDAO dao) {
		this.dao = dao;
	}

	
	public MemberDTO joinCheck(MemberDTO dto) {

		//MemberDTO dto2 = dao.joinCheck(dto);
		
		return dao.joinCheck(dto);
		
	}//joinCheck(MemberDTO dto)


	public MemberDTO emailCheck(String email) {
		return dao.emailCheck(email);
	}
	
}
