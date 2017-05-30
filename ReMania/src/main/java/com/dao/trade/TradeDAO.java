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

	/** 판매신청 혹은 구매신청을 하면 trade 테이블에 정보를 insert한다.*/
	public void tradeInsert(TradeDTO tradeDTO) {
		template.insert(namespace+"tradeInsert", tradeDTO);
	}

	/** trade에 정보를 insert를 하면, buy 테이블의 state 상태를 "진행중"으로 바꾼다.
	 * 그러면 삽니다 게시판에서는 진행중인 거래는 리스트에 안보여줌. (진행중인 거래는 list에서 빼야한다.)
	 * state가 null인 것들만 뿌려주기 때문. */
	public void buyStateUpdate(int categorynum) {
		template.update(namespace+"buyStateUpdate", categorynum);
	}

	public TradeDTO getTradeInfo(int tradenum) {
		return template.selectOne(namespace+"getTradeInfo", tradenum);
	}
	
}
