package com.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.entity.member.MemberDTO;

public class MemberDAO {

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
	
}
