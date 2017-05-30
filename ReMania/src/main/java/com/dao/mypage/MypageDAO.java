package com.dao.mypage;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.mypage.MypageDTO;
import com.entity.trade.BuyDTO;
import com.entity.trade.TradeDTO;

@Repository
public class MypageDAO {

private String namespace = "com.remania.MypageMapper.";
	
	@Autowired
	private SqlSessionTemplate template;

	/** Mypage의 값들을 DB에서 가져온 후, set하여 DTO를 반환 */
	public MypageDTO getMypageDTO(String email) {
		
		MypageDTO dto = new MypageDTO();
		
		//삽니다
		dto.setBuywrite(template.selectOne(namespace+"getBuywrite", email)); 
		dto.setBuytrading(template.selectOne(namespace+"getBuytrading", email));
		dto.setBuyend(template.selectOne(namespace+"getBuyend", email));
		
		//팝니다
		dto.setSelltrading(template.selectOne(namespace+"getSelltrading", email));
		dto.setSellend(template.selectOne(namespace+"getSellend", email));
		
		return dto;
	}//getMypageDTO(MemberDTO login)

	/** trade 테이블에서 정보를 가져온다. */
	public TradeDTO getTradeInfo(String trade, String email, String history) {
		HashMap map = new HashMap();
		map.put("trade", trade);
		map.put("email", email);
		map.put("history", history);
		return template.selectOne(namespace+"getTradeInfo", map);
	}//getTradeInfo(String trade, String email, String history)

	/** buy테이블에서 정보를 가져온다. */
	public BuyDTO getBuyInfo(int categorynum) {
		return template.selectOne(namespace+"getBuyInfo", categorynum);
	}

	/** 판매자의 이름을 반환한다. */
	public String getSellerName(String seller) {
		return template.selectOne(namespace+"getSellerName", seller);
	}
	
}
