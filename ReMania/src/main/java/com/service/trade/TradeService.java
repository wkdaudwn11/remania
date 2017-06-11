package com.service.trade;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.trade.TradeDAO;
import com.entity.member.MemberDTO;
import com.entity.trade.BuyDTO;
import com.entity.trade.TradeDTO;

@Service
public class TradeService {

	@Autowired
	private TradeDAO dao;
	
	public void setDao(TradeDAO dao) {
		this.dao = dao;
	}

	public BuyDTO buyDetail(int categorynum) {
		return dao.buyDetail(categorynum);
	}

	public MemberDTO getMemberInfo(String email) {
		return dao.getMemberInfo(email);
	}

	public void tradeInsert(TradeDTO tradeDTO) {
		dao.tradeInsert(tradeDTO);
	}

	public void buyStateUpdate(int buynum, String trade) {
		dao.buyStateUpdate(buynum, trade);
	}

	public TradeDTO getTradeInfo(String tradenum) {
		return dao.getTradeInfo(Integer.parseInt(tradenum));
	}

	public void deleteTrade(int tradenum) {
		dao.deleteTrade(tradenum);
	}

	public void updateTrade(HashMap map) {
		dao.updateTrade(map);
	}

	public boolean result(int tradenum) {
		return dao.result(tradenum);
	}

	public void endState(int tradenum) {
		dao.endState(tradenum);
	}

	public boolean tradeCancel(TradeDTO tradeDTO, String cancel) {
		return dao.tradeCancel(tradeDTO, cancel);
	}
	
}
