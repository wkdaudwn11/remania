package com.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.entity.member.MemberDTO;

@Repository
public class LoginDAO {

	private String namespace = "com.remania.MemberMapper.";
	private SqlSessionTemplate template;

	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	/** 입력한 email를 DB에 조회해보는 메소드 */
	public MemberDTO loginCheck1(MemberDTO dto) {
		
		MemberDTO dto2 = template.selectOne(namespace+"loginCheck1", dto.getEmail());
		
		if(dto2 == null){
			dto.setEmail("-1");
		}
		
		return dto;
	}

	/** 입력한 email, pwd로 DB에 조회해보는 메소드 */
	public MemberDTO loginCheck2(MemberDTO dto) {
		return template.selectOne(namespace+"loginCheck2", dto);
	}

	/** sns로그인을 하는 메소드 */
	public void snsLogin(MemberDTO dto) {
		
		// sns로 처음 로그인하는 것인지 알기위한 select
		int n = template.selectOne(namespace+"existSns", dto.getEmail());
		
		// 0이라는 것은 처음 로그인하는 경우다. 이럴 경우엔 일단 회원가입을 시켜주자.
		if(n == 0) {
			System.out.println("처음 로그인");
			template.insert(namespace+"snsJoin", dto);
		}
		
	}//snsLogin(MemberDTO dto)
	
}
