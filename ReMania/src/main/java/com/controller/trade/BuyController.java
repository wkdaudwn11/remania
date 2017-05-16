package com.controller.trade;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.member.MemberDTO;
import com.entity.trade.BuyPageDTO;
import com.service.trade.BuyService;

@Controller
public class BuyController {
	
	@Autowired
	private BuyService service;
	
	/** 삽니다 리스트를 뿌려주는 메소드 */
	@RequestMapping(value="buyList")
	public ModelAndView buyList(String curPage, String category, String sortName, String sortValue){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("trade/buy/buyList");
		
		if(curPage == null) curPage="1";
		
		HashMap<String,String> map = new HashMap<>();
		map.put("sortName", sortName);
		map.put("sortValue", sortValue);
		
		BuyPageDTO buyPageDTO = service.buyList(Integer.parseInt(curPage), category, map);
		mav.addObject("buyPageDTO", buyPageDTO);
		mav.addObject("category", category);
		mav.addObject("sortName", sortName);
		mav.addObject("sortValue", sortValue);
		
		return mav;
		
	}//buyList(String curPage, String category, String sortName, String sortValue)
	
}
