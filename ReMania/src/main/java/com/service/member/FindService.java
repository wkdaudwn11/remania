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
	
	/** 존재하지 않는 tel이면 -1을 리턴하고
	 *  존재하는 이메일이면 일단 dto를 리턴한다.
	 *  dto에는 비밀번호가 맞으면 제대로 된 값이 들어가있을 것이고
	 *  비밀번호가 틀리면 null이 들어가있다. */
	public MemberDTO findIdCheck(MemberDTO dto) {
		
		
		MemberDTO dto2 = finddao.findIdCheck(dto);
			
			if(dto2.getTel().equals("-1")){
				return dto2;
			}else{
				return dto2;
			}
		
		
	}//findIdCheck(MemberDTO dto)
	
}
