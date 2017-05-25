package com.dao.trade;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.member.MemberDTO;
import com.entity.trade.BuyDTO;
import com.entity.trade.TradeDTO;

@Repository
public class TradeDAO {

	private String namespace = "com.remania.TradeMapper.";

	@Autowired
	private SqlSessionTemplate template;
	
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}

	/** 삽니다 게시판에서 해당 번호에 대한 게시글 정보를 리턴 */
	public BuyDTO buyDetail(int categorynum) {
		return template.selectOne(namespace+"buyDetail", categorynum);
	}

	/** 넘겨받은 email로  회원상세정보를 리턴*/
	public MemberDTO getMemberInfo(String email) {
		return template.selectOne(namespace+"getMemberInfo", email);
	}
	
}
