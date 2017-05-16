package com.dao.trade;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.trade.BuyDTO;
import com.entity.trade.BuyPageDTO;

@Repository
public class BuyDAO {
	
	private String namespace = "com.remania.BuyMapper.";

	@Autowired
	private SqlSessionTemplate template;
	
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	public BuyPageDTO buyList(int curPage, String category, HashMap<String, String> map) {
		
		BuyPageDTO buyPageDTO = new BuyPageDTO();
		
		int skip = (curPage-1) * buyPageDTO.getPerPage();
		List<BuyDTO> buyList = null;
		
		int count = -1;
		
		//category가 null이거나 ""라는 것은 전체 검색이라는 것이니까 전체 갯수를 가져옴.
		if(category == null || category.equals("")){
			count = template.selectOne(namespace+"totalRecordAll");
		}
		
		buyList = template.selectList(namespace+"buyList", map, new RowBounds(skip,buyPageDTO.getPerPage()));
		
		buyPageDTO.setBuyList(buyList);
		buyPageDTO.setCurPage(curPage);
		buyPageDTO.setTotalRecord(count);
		
		
		return buyPageDTO;
		
	}
	
}// end Repository

