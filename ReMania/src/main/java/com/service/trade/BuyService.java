package com.service.trade;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.trade.BuyDAO;
import com.entity.trade.BuyDTO;
import com.entity.trade.BuyPageDTO;

@Service
public class BuyService {

	@Autowired
	private BuyDAO dao;
	
	public void setDao(BuyDAO dao) {
		this.dao = dao;
	}

	public BuyPageDTO buyList(int curPage, String category, String sort, String searchType, String searchValue) {
		
		if(sort.equals("최신순")){
			sort = "buynum desc";
		}else if(sort.equals("높은 가격순")){
			sort = "price1 desc";
		}else if(sort.equals("낮은 가격순")){
			sort = "price1 asc";
		}
		
		HashMap<String,String> map = new HashMap<>();
		if(category != null){
			if(category.equals("전체")){
				map.put("category", null);
			}else{
				map.put("category", category);
			}
		}else{
			map.put("category", category);
		}
		
		map.put("sort", sort);
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		
		return dao.buyList(curPage, map);
	}//buyList(int curPage, String category, String sort, String searchType, String searchValue)
	
	public int getCurval() {
		return dao.getCurval();
	}

	public void buyInsert(BuyDTO dto) {
		dao.buyInsert(dto);
	}

	public BuyDTO buyDetail(int buynum) {
		return dao.buyDetail(buynum);
	}

	public void buyDelete(HashMap<String, String> map) {
		int buynum = Integer.parseInt(map.get("buynum"));
		String email = map.get("email");
		dao.buyDelete(buynum, email);
	}

	public void buyUpdate(BuyDTO buyDTO) {
		dao.buyUpdate(buyDTO);
		
	}

	public void buyReadcntUpdate(int buynum) {
		dao.buyReadcntUpdate(buynum);
	}
	
}//end Service
