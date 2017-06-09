package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.member.FindDAO;
import com.dao.member.LoginDAO;
import com.entity.member.MemberDTO;

@Service
public class FindService {

	@Autowired
	private FindDAO dao;
	
	/** 회원정보 반환 */
	public MemberDTO findIdCheck(MemberDTO dto) {
		MemberDTO dto2 = dao.findIdCheck(dto);
		return dto2;
	}//findIdCheck(MemberDTO dto)

	public void updatePwd(String email, String pwd) {
		dao.updatePwd(email, pwd);
	}//updatePwd(String email, String pwd)

	public MemberDTO emailExistCheck(MemberDTO dto) {
		return dao.emailExistCheck(dto);
	}
	
}
