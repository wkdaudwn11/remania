package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.member.JoinDAO;
import com.entity.member.MemberDTO;

public class JoinService {

	@Autowired
	private JoinDAO joinDao;

	public void setJoinDao(JoinDAO joinDao) {
		this.joinDao = joinDao;
	}

	
	public MemberDTO joinCheck(MemberDTO dto) {

		//MemberDTO dto2 = joinDao.joinCheck(dto);
		
		return joinDao.joinCheck(dto);
		
	}//joinCheck(MemberDTO dto)


	public MemberDTO emailCheck(String email) {
		return joinDao.emailCheck(email);
	}
	
}
