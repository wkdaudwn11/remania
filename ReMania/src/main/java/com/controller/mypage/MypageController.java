package com.controller.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.board.InquiryPage;
import com.entity.board.QuestionDTO;
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
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		MypageDTO mypageDTO = service.getMypageDTO(login.getEmail());
		
		List<TradeDTO> tradeList = null;
		
		try{
			
			tradeList = service.getTradeInfo(trade, login.getEmail(), process);
			
			String[] sellerName = new String[tradeList.size()];
			int[] tradenum = new int[tradeList.size()];
			List<BuyDTO> buyList = new ArrayList<>();
			for(int i=0; i<tradeList.size(); i++){
				sellerName[i] = service.getSellerName(tradeList.get(i).getSeller());
				tradenum[i] = tradeList.get(i).getTradenum();
				buyList.add(service.getBuyInfo(tradeList.get(i).getCategorynum()));
			}
			
			m.addAttribute("sellerName", sellerName);
			m.addAttribute("tradenum", tradenum);
			m.addAttribute("buyList", buyList);
			
			if(trade.equals("buyer")){ // 구매 관련 리스트 일 경우
				if(process.equals("trading")){
					target = "member/myPage/buyTrading";
				}else{
					target = "member/myPage/buyEndHistory";
				}
			}else{
				if(process.equals("trading")){
					target = "member/myPage/sellTrading";
				}else{
					target = "member/myPage/sellEndHistory";
				}
			}
			
		}catch(NullPointerException e){ // 판매중인 상품이 없으면 NullPointerException이 발생하므로 그냥 마이페이지로 넘겨줌.
			e.printStackTrace();
			target = "redirect:myPageIndex";
		}
		
		return target;
	}//process(String trade, String process, HttpSession session, Model m)
	
	@RequestMapping(value="writeHistory")
	public String writeHistory(String trade, HttpSession session, Model m){
		
		String target = "";
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		
		if(trade.equals("buyer")){
			List<BuyDTO> list = service.getWriteHistory(memberDTO.getEmail(), trade);
			m.addAttribute("buyList", list);
			target = "member/myPage/buyWriteHistory";
		}else{
			target = "member/myPage/sellWriteHistory";
		}
		
		return target;
	}
	
	/** 자신의 문의글 내역 가져오는 메서드*/
	@RequestMapping("/myInquiryList")
	public String myInquiryList(HttpSession session,@ModelAttribute("InquiryPage")InquiryPage inquiryPage){
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		if(inquiryPage.getCurPage() == 0){
			inquiryPage.setCurPage(1);
		}
		inquiryPage = service.myInquiryList(member.getEmail(),inquiryPage);
		return "member/myPage/myInquiryList";
	}
	
	/** 자신의 문의내역 보기*/
	@RequestMapping("/myInquiryDetail")
	public String myInquiryDetail(QuestionDTO question,String curPage,Model m){
		m.addAttribute("Question", service.questionDetail(question) );
		return "member/myPage/myInquiryDetail";
	}
	
}
