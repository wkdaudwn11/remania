package com.controller.trade;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.member.MemberDTO;
import com.entity.trade.BuyDTO;
import com.entity.trade.TradeDTO;
import com.service.trade.TradeService;

@Controller
public class TradeController {
	
	@Autowired
	private TradeService service;
	
	/** 판매, 구매신청을 했을 경우 이 메소드로 오게됨. */
	@RequestMapping(value="trade", method=RequestMethod.POST)
	public String trade(TradeDTO tradeDTO, Model m){
		
		service.tradeInsert(tradeDTO); // trade 테이블에 정보 입력
		
		if(tradeDTO.getCategory().equals("buy")){
			service.buyStateUpdate(tradeDTO.getCategorynum()); // 삽니다 게시판의 해당 게시물의 state를 '진행중'으로 변경
			BuyDTO buyDTO = service.buyDetail(tradeDTO.getCategorynum()); // 해당 게시물의 대한 상세정보를 반환
			m.addAttribute("buyDTO", buyDTO);
		}else{
			//sell쪽은 아직 구현 안됌.
		}
		
		MemberDTO buyer = service.getMemberInfo(tradeDTO.getBuyer());
		
		MemberDTO seller = service.getMemberInfo(tradeDTO.getSeller());
		
		m.addAttribute("buyer", buyer);
		m.addAttribute("seller", seller);
		
		return "trade/trade";
	}//trade(TradeDTO tradeDTO, Model m)
	
	@RequestMapping(value="trade", method=RequestMethod.GET)
	public String trade2(String tradenum, Model m){
		
		TradeDTO tradeDTO = service.getTradeInfo(tradenum);
		
		m.addAttribute("tradeDTO", tradeDTO);
		
		if(tradeDTO.getCategory().equals("buy")){
			service.buyStateUpdate(tradeDTO.getCategorynum()); // 삽니다 게시판의 해당 게시물의 state를 '진행중'으로 변경
			BuyDTO buyDTO = service.buyDetail(tradeDTO.getCategorynum()); // 해당 게시물의 대한 상세정보를 반환
			m.addAttribute("buyDTO", buyDTO);
		}else{
			//sell쪽은 아직 구현 안됌.
		}
		
		MemberDTO buyer = service.getMemberInfo(tradeDTO.getBuyer());
		
		MemberDTO seller = service.getMemberInfo(tradeDTO.getSeller());
		
		m.addAttribute("buyer", buyer);
		m.addAttribute("seller", seller);
		
		return "trade/trade";
	}//trade2(String tradenum, Model m)
	
}
