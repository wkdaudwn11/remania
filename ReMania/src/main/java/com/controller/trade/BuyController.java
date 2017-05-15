package com.controller.trade;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.trade.BuyPageDTO;
import com.service.trade.BuyService;

@Controller
public class BuyController {
	
	@Autowired
	private BuyService service;
	
	@RequestMapping(value="buyList")
	public ModelAndView buyList(String curPage, String category, String sortName, String sortValue){
		
		System.out.println("curPage: "+curPage);
		System.out.println("category: "+category);
		System.out.println("sortName: "+sortName);
		System.out.println("sortValue: "+sortValue);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("trade/buy/buyList");
		
		if(curPage == null) curPage="1";
		HashMap<String,String> map = new HashMap<>();
		map.put("sortName", sortName);
		map.put("sortValue", sortValue);
		
		BuyPageDTO BuyPageDTO = service.buyList(Integer.parseInt(curPage), category, map);
		mav.addObject("buyPageDTO", BuyPageDTO);
		mav.addObject("category", category);
		mav.addObject("sortName", sortName);
		mav.addObject("sortValue", sortValue);
		
		return mav;
		
		//return null;
	}

}
