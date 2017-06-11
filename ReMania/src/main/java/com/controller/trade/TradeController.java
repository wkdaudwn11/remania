package com.controller.trade;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.util.BlueHouseLab;

@Controller
public class TradeController {
	
	@Autowired
	private TradeService service;
	
	/** 판매, 구매신청을 했을 경우 이 메소드로 오게됨. */
	@RequestMapping(value="trade", method=RequestMethod.POST)
	public String trade(TradeDTO tradeDTO, Model m){
		
		m.addAttribute("tradeDTO", tradeDTO);
		
		service.tradeInsert(tradeDTO); // trade 테이블에 정보 입력
		String title = "";		// 게시글 제목
		String trade = "";		// 판매, 구매 (신청)
		String receiver = "";	// 받는사람번호
		String someone = "";	// 상대방
		
		if(tradeDTO.getCategory().equals("buy")){
			service.buyStateUpdate(tradeDTO.getCategorynum(), "trading"); // 삽니다 게시판의 해당 게시물의 state를 '진행중'으로 변경
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
			
			title = buyDTO.getTitle();
			trade = "판매";
			receiver = buyDTO.getTitle();
			
		}else{
			//sell쪽은 아직 구현 안됌.
			trade = "구매";
		}
		
		MemberDTO buyer = service.getMemberInfo(tradeDTO.getBuyer());
		
		MemberDTO seller = service.getMemberInfo(tradeDTO.getSeller());
		
		m.addAttribute("buyer", buyer);
		m.addAttribute("seller", seller);
		
		someone = seller.getTel();
		
		BlueHouseLab bhl = new BlueHouseLab();
		String content = "[중고매니아]\n\'"+title+"\' 게시글에 "+trade+"신청이 왔습니다.\n상대방 번호: "+someone;
		bhl.sendLetter(receiver, content);
		
		return "trade/trade";
	}//trade(TradeDTO tradeDTO, Model m)
	
	/** 마이페이지를 통해서 거래화면으로 이동할 경우 이 메소드로 오게 됨. */
	@RequestMapping(value="trade", method=RequestMethod.GET)
	public String trade2(String tradenum, Model m){
		
		TradeDTO tradeDTO = service.getTradeInfo(tradenum);
		
		m.addAttribute("tradeDTO", tradeDTO);
		
		if(tradeDTO.getCategory().equals("buy")){
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
	
	/** 판매 취소 */
	@RequestMapping("cancel")
	public String sellCancel(TradeDTO tradeDTO, String title, String buyerTel,String sellerTel, String cancel){
		
		String content = "";
		BlueHouseLab bhl = new BlueHouseLab();
		
		boolean result = service.tradeCancel(tradeDTO, cancel);
		
		if(result == true){
			service.deleteTrade(tradeDTO.getTradenum());
			if(tradeDTO.getCategory().equals("buy")){
				service.buyStateUpdate(tradeDTO.getCategorynum(), "cancel");
			}else{
				//판매 미구현
			}
			content = "[중고매니아]\n\'"+title+"\' 게시글이 판매 취소되었습니다.";
			bhl.sendLetter(buyerTel, content);
			bhl.sendLetter(sellerTel, content);
		}else{
			if(cancel.equals("sellcancel")){ // 판매자가 취소요청을 했을 경우
				content = "[중고매니아]\n\'"+title+"\' 게시글에 판매자가 취소요청을 하였습니다.";
				bhl.sendLetter(buyerTel, content);
			}else{ // 구매자가 취소요청 했을 경우
				content = "[중고매니아]\n\'"+title+"\' 게시글에 구매자가 취소요청을 하였습니다.";
				bhl.sendLetter(sellerTel, content);
			}
		}// if(result == true)
		
		return "redirect:myPageIndex";
	}//sellCancel(String tradenum, String title, String receiver)
	
	// 인수, 인계 버튼을 누르면 일로옴.
	@RequestMapping(value={"takeover", "transfer"})
	public String tradeEnd(String trade, int tradenum){
		
		HashMap map = new HashMap();
		map.put("trade", trade);
		map.put("tradenum", tradenum);
		
		service.updateTrade(map);
		
		boolean result = service.result(tradenum);
		
		if(result == true){
			//result가 true라는 것은 둘 다 ok를 눌렀다는 것이므로 거래를 종료시킨다.
			service.endState(tradenum);
		}
		
		return "redirect:myPageIndex";
	}//tradeEnd(String trade, int tradenum)
	
}
