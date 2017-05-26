package com.dao.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.board.FreeBoardDTO;
import com.entity.member.MemberDTO;


@Repository
public class FindDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	private String namespace = "com.remania.MemberMapper.";
	
	/** 입력한  name, tel를 DB에 조회해보는 메소드 */
	public MemberDTO findIdCheck(MemberDTO dto) {
		
		return template.selectOne(namespace+"findIdCheck", dto);
			
	}

	
	/** 입력한 email를 DB에 조회해보는 메소드 */
	public MemberDTO findPwdCheck(MemberDTO dto) {
		return template.selectOne(namespace+"findPwdCheck", dto);
	}
	
	/** 입력한 tel를 DB에 조회해보는 메소드 */
	public MemberDTO findPwdCheck2(MemberDTO dto) {
		return template.selectOne(namespace+"findPwdCheck2", dto);
	}


	public MemberDTO findPwdForTelCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return template.selectOne(namespace+"findPwdForTelCheck", dto);
	}


	public MemberDTO findPwdForEmailCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return template.selectOne(namespace+"findPwdForEmailCheck", dto);
	}
}
