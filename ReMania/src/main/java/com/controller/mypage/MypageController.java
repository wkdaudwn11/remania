package com.controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.member.MemberDTO;
import com.entity.mypage.MypageDTO;
import com.entity.trade.BuyDTO;
import com.entity.trade.TradeDTO;
import com.service.mypage.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService service; 
	
	/** Mypage 메인화면으로 이동하는 메소드 (Session에 있는 값으로 작성한 게시글, 진행중인 주문수 등을 가져옴) */
	@RequestMapping(value="myPageIndex", method=RequestMethod.GET)
	public String myPageIndex(HttpSession session, Model m){
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		MypageDTO mypageDTO = service.getMypageDTO(login.getEmail());
		m.addAttribute("mypageDTO", mypageDTO);
		
		return "member/myPage/myPageIndex";
	}//myPageIndex(HttpSession session)
	
	/** 진행중인 거래, 완료된 거래 리스트를 뿌려주는 메소드 */
	@RequestMapping(value={"trading", "endHistory"})
	public String process(String trade, String process, HttpSession session, Model m){
		
		String target = "";
		TradeDTO tradeDTO = null;
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		try{
			if(process.equals("trading")){
				tradeDTO = service.getTradeInfo(trade, login.getEmail(), "trading");
			}else{
				tradeDTO = service.getTradeInfo(trade, login.getEmail(), "end");
			}
			
			String sellerName = service.getSellerName(tradeDTO.getSeller());
			
			m.addAttribute("sellerName", sellerName);
			m.addAttribute("tradeDTO", tradeDTO);
			
			MypageDTO mypageDTO = service.getMypageDTO(login.getEmail());
			
			if(tradeDTO.getCategory().equals("buy")){
				BuyDTO buyDTO = service.getBuyInfo(tradeDTO.getCategorynum());
				m.addAttribute("dto", buyDTO);
				if(trade.equals("buyer")){
					if(process.equals("trading")){
						m.addAttribute("count", mypageDTO.getBuytrading());
					}else{
						m.addAttribute("count", mypageDTO.getBuyend());
					}
					target = "member/myPage/buyTrading";
				}else{
					if(process.equals("trading")){
						m.addAttribute("count", mypageDTO.getSelltrading());
					}else{
						m.addAttribute("count", mypageDTO.getSellend());
					}
					target = "member/myPage/sellTrading";
				}
			}else{
				//팝니다는 미구현
			}
		}catch(NullPointerException e){ // 판매중인 상품이 없으면 NullPointerException이 발생하므로 그냥 마이페이지로 넘겨줌.
			target = "redirect:myPageIndex";
		}
		
		return target;
	}//process(String trade, String process, HttpSession session, Model m)
	
}
