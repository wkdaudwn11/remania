package com.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.member.MemberDTO;

@Repository
public class JoinDAO {

	private String namespace = "com.remania.MemberMapper.";
	
	@Autowired
	private SqlSessionTemplate template;

	
	/**  DB에 회원정보를 삭제하는 메소드   */
	public int deleteCheck(int membernum) {
		return template.delete(namespace+"deleteMember", membernum);
		
	
	}
	
	
	/**  DB에 회원정보를 업데이트하는 메소드 */
	public MemberDTO updateMember(MemberDTO dto) {
		
		int n = template.update(namespace+"updateMember", dto);
		return dto;
	}
	
	public MemberDTO updateCheck(MemberDTO dto) {
		int n = template.update(namespace+"updateMember", dto);
		return dto;
	}
	
	/**  DB에 회원정보를 추가하는 메소드 */
	public void AddMember(MemberDTO dto) {
		
		int n = template.insert(namespace+"AddMember", dto);
		
	}
	/**   회원정보 유효성검사 메소드 */
	public MemberDTO joinCheck(MemberDTO dto) {
		int n = template.insert(namespace+"AddMember", dto);
		return dto;
	}//joinCheck(MemberDTO dto)
	
	/** 이메일 중복검사 */
	public MemberDTO emailCheck(String email) {
		return template.selectOne(namespace+"emailCheck", email);
	}
	

	
	
	
}
