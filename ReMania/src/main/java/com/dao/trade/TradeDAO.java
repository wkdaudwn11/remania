package com.dao.trade;

import java.util.HashMap;

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
	public void buyStateUpdate(int buynum, String trade) {
		HashMap map = new HashMap();
		map.put("buynum", buynum);
		map.put("trade", trade);
		template.update(namespace+"buyStateUpdate", map);
	}

	public TradeDTO getTradeInfo(int tradenum) {
		return template.selectOne(namespace+"getTradeInfo", tradenum);
	}

	public void deleteTrade(int tradenum) {
		template.delete(namespace+"deleteTrade", tradenum);
	}

	public void updateTrade(HashMap map) {
		template.update(namespace+"updateTrade", map);
	}
	
	/** transfer, takeover를 체크하여 둘 다 ok면 true를 반환, 하나라도 null이면 false를 반환 */
	public boolean result(int tradenum) {
		
		boolean result = false;
		
		String transfer = template.selectOne(namespace+"getTransfer", tradenum);
		String takeover = template.selectOne(namespace+"getTakeover", tradenum);
		
		System.out.println("transfer: "+transfer);
		System.out.println("takeover: "+takeover);
		
		try{
			if(transfer.equals("ok") && takeover.equals("ok")){
				result = true;
			}
		}catch(NullPointerException e){
			result = false;
		}
		
		return result;
	}//result(int tradenum)

	/** 넘겨받은 tradenum의 state를 '완료'로 수정 */
	public void endState(int tradenum) {
		template.update(namespace+"endState", tradenum);
	}//endState(int tradenum)

	/** 거래 취소 관련 메소드 */
	public boolean tradeCancel(TradeDTO tradeDTO, String cancel) {
		
		boolean result;
		
		HashMap map = new HashMap();
		map.put("tradenum", tradeDTO.getTradenum());
		map.put("cancel", cancel);
		
		template.update(namespace+"requestCancel",map);
		String sellcancel = template.selectOne(namespace+"selectSellCancel", tradeDTO.getTradenum());
		String buycancel = template.selectOne(namespace+"selectBuyCancel", tradeDTO.getTradenum());
		
		if(sellcancel != null && buycancel != null){
			result = true;
		}else{
			result = false;
		}
		
		return result;
		
	}//tradeCancel(TradeDTO tradeDTO, String cancel)
	
}
