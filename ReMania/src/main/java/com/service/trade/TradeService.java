package com.service.trade;

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
	
}
