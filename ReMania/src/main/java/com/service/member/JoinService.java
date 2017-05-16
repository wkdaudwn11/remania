package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.member.JoinDAO;
import com.entity.member.MemberDTO;

@Service
public class JoinService {

	@Autowired
	private JoinDAO joinDao;
	
	public MemberDTO joinCheck(MemberDTO dto) {
		return joinDao.joinCheck(dto);
	}//joinCheck(MemberDTO dto)


	public MemberDTO emailCheck(String email) {
		return joinDao.emailCheck(email);
	}
	
}
