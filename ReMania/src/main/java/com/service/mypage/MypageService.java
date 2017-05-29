package com.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.mypage.MypageDAO;
import com.entity.member.MemberDTO;
import com.entity.mypage.MypageDTO;
import com.entity.trade.BuyDTO;
import com.entity.trade.TradeDTO;

@Service
public class MypageService {

	@Autowired
	private MypageDAO dao;

	public MypageDTO getMypageDTO(String email) {
		return dao.getMypageDTO(email);
	}

	public TradeDTO getTradeInfo(String trade, String email, String history) {
		return dao.getTradeInfo(trade, email, history);
	}

	public BuyDTO getBuyInfo(int categorynum) {
		return dao.getBuyInfo(categorynum);
	}

	public String getSellerName(String seller) {
		return dao.getSellerName(seller);
	}
	
}
