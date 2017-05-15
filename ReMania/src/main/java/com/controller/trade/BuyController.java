package com.controller.trade;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.trade.BuyPageDTO;

@Controller
public class BuyController {
	
	@RequestMapping(value="buyList")
	public BuyPageDTO buyList(){
		
	}

}
