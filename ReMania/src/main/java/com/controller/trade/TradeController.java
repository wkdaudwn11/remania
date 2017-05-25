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

	@RequestMapping(value="trade", method=RequestMethod.POST)
	public String trade(TradeDTO tradeDTO, Model m){
		
		/* 2017-05-24
		 * method방식이 post일 경우랑 get일 경우랑은 틀림. post일 경우는 판매신청 혹은 구매신청 버튼을 눌러서 넘어온 경우고
		 * get방식일 경우에는 mypage를 통해서 들어온 것임. 나중에 get방식일 경우도 만들어야함.*/
		
		if(tradeDTO.getCategory().equals("buy")){
			BuyDTO buyDTO = service.buyDetail(tradeDTO.getCategorynum());
			m.addAttribute("buyDTO", buyDTO);
		}else{
			//sell쪽은 아직 구현 안됌.
		}
		
		MemberDTO buyer = service.getMemberInfo(tradeDTO.getBuyer());
		MemberDTO seller = service.getMemberInfo(tradeDTO.getSeller());
		
		m.addAttribute("buyer", buyer);
		m.addAttribute("seller", seller);
		
		return "trade/trade";
	}
	
}
