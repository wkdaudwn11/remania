package com.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.member.JoinDAO;
import com.entity.member.MemberDTO;

@Service
public class JoinService {

	@Autowired
	private JoinDAO joinDao;
	
	

	public MemberDTO emailCheck(String email) {
		return joinDao.emailCheck(email);
	}


	public MemberDTO updateCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return joinDao.updateCheck(dto);
	}


	public MemberDTO joinCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return joinDao.joinCheck(dto);
	}


		public int deleteCheck(int membernum) {
		// TODO Auto-generated method stub
			return joinDao.deleteCheck(membernum);
			
	}


}
