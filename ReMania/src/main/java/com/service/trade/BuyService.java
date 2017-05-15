package com.service.trade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.member.LoginDAO;
import com.dao.trade.BuyDAO;

@Service
public class BuyService {

	@Autowired
	private BuyDAO dao;

	public void setDao(BuyDAO dao) {
		this.dao = dao;
	}
	
}//end Service
