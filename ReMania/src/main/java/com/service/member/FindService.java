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
	private FindDAO finddao;
	
	/**  */
	public MemberDTO findIdCheck(MemberDTO dto) {
		
		return finddao.findIdCheck(dto);
			
	}//findIdCheck(MemberDTO dto)

	public MemberDTO findPwdForTelCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return finddao.findPwdForTelCheck(dto);
	}

	public MemberDTO findPwdForEmailCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return finddao.findPwdForEmailCheck(dto);
	}
	
}
