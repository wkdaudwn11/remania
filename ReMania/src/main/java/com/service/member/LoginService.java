package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.dao.member.LoginDAO;
import com.entity.member.MemberDTO;

public class LoginService {

	@Autowired
	private LoginDAO loginDao;

	public void setLoginDao(LoginDAO loginDao) {
		this.loginDao = loginDao;
	}

	/** 존재하지 않는 이메일이면 -1을 리턴하고
	 *  존재하는 이메일이면 일단 dto를 리턴한다.
	 *  dto에는 비밀번호가 맞으면 제대로 된 값이 들어가있을 것이고
	 *  비밀번호가 틀리면 null이 들어가있다. */
	public MemberDTO loginCheck(MemberDTO dto) {
		
		MemberDTO dto2 = loginDao.loginCheck1(dto);
		
		if(dto2.getEmail().equals("-1")){
			return dto2;
		}else{
			return loginDao.loginCheck2(dto);
		}
		
		
		
	}//loginCheck(MemberDTO dto)
	
}
