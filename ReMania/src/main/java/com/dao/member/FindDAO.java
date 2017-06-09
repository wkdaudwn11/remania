package com.dao.member;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.member.MemberDTO;

@Repository
public class FindDAO {

	private String namespace = "com.remania.MemberMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	/** 입력한  name, tel를 DB에 조회해보는 메소드 */
	public MemberDTO findIdCheck(MemberDTO dto) {
		
		MemberDTO dto2= template.selectOne(namespace+"findIdCheck", dto);
		
		return dto2;
	}

	
	/** 입력한 email를 DB에 조회해보는 메소드 */
	public MemberDTO findPwdCheck(MemberDTO dto) {
		return template.selectOne(namespace+"findPwdCheck", dto);
	}
	
	/** 입력한 tel를 DB에 조회해보는 메소드 */
	public MemberDTO findPwdCheck2(MemberDTO dto) {
		return template.selectOne(namespace+"findPwdCheck2", dto);
	}

	/** 비밀번호 변경 */
	public void updatePwd(String email, String pwd) {
		HashMap map = new HashMap();
		map.put("email", email);
		map.put("pwd", pwd);
		template.update(namespace+"updatePwd", map);
	}//updatePwd(String email, String pwd)


	public MemberDTO emailExistCheck(MemberDTO dto) {
		return template.selectOne(namespace+"emailExistCheck", dto);
	}
}
