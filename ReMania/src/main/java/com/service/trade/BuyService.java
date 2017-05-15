package com.service.trade;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.trade.BuyDAO;
import com.entity.trade.BuyPageDTO;

@Service
public class BuyService {

	@Autowired
	private BuyDAO dao;
	
	public void setDao(BuyDAO dao) {
		this.dao = dao;
	}

	public BuyPageDTO buyList(int curPage, String category, HashMap<String, String> map) {
		return dao.buyList(curPage, category, map);
	}

	
	
}//end Service
