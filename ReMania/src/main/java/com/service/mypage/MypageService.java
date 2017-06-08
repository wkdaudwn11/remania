package com.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.mypage.MypageDAO;
import com.entity.board.InquiryPage;
import com.entity.board.QuestionDTO;
import com.entity.mypage.MypageDTO;
import com.entity.trade.BuyDTO;
import com.entity.trade.TradeDTO;

@Service
public class MypageService {

	@Autowired
	private MypageDAO dao;

	@Transactional
	public MypageDTO getMypageDTO(String email) {
		return dao.getMypageDTO(email);
	}

	public List<TradeDTO> getTradeInfo(String trade, String email, String process) {
		return dao.getTradeInfo(trade, email, process);
	}

	public BuyDTO getBuyInfo(int categorynum) {
		return dao.getBuyInfo(categorynum);
	}

	public String getSellerName(String seller) {
		return dao.getSellerName(seller);
	}

	public List<BuyDTO> getWriteHistory(String email, String trade) {
		return dao.getWriteHistory(email, trade);
	}
	
	public InquiryPage myInquiryList(String email,InquiryPage inquiryPage){
		return dao.myInquiryList(email,inquiryPage);
	}
	
	public QuestionDTO questionDetail(QuestionDTO question){
		return dao.questionDetail(question);
	}
}
