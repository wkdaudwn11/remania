package com.controller.trade;

import java.util.ArrayList;
import java.util.StringTokenizer;

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
			
			if(buyDTO.getImage2() != null){
				ArrayList<String> image2List = new ArrayList<>();
				StringTokenizer image2 = new StringTokenizer(buyDTO.getImage2(), ",");
				
				while(image2.hasMoreElements()){
					image2List.add(image2.nextToken());
				}
				m.addAttribute("image2List", image2List);
			}
			
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
	
	/** 마이페이지를 통해서 거래화면으로 이동할 경우 이 메소드로 오게 됨. */
	@RequestMapping(value="trade", method=RequestMethod.GET)
	public String trade2(String tradenum, Model m){
		
		TradeDTO tradeDTO = service.getTradeInfo(tradenum);
		
		m.addAttribute("tradeDTO", tradeDTO);
		
		if(tradeDTO.getCategory().equals("buy")){
			service.buyStateUpdate(tradeDTO.getCategorynum()); // 삽니다 게시판의 해당 게시물의 state를 '진행중'으로 변경
			BuyDTO buyDTO = service.buyDetail(tradeDTO.getCategorynum()); // 해당 게시물의 대한 상세정보를 반환
			if(buyDTO.getImage2() != null){
				ArrayList<String> image2List = new ArrayList<>();
				StringTokenizer image2 = new StringTokenizer(buyDTO.getImage2(), ",");
				
				while(image2.hasMoreElements()){
					image2List.add(image2.nextToken());
				}
				m.addAttribute("image2List", image2List);
			}
			
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
