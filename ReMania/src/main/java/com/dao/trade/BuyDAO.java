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
	
	/** 글 리스트 */
	public BuyPageDTO buyList(int curPage, HashMap<String, String> map) {
		
		BuyPageDTO buyPageDTO = new BuyPageDTO();
		
		int skip = (curPage-1) * buyPageDTO.getPerPage();
		
		int count = template.selectOne(namespace+"totalRecord", map);
		List<BuyDTO> buyList = template.selectList(namespace+"buyList", map, new RowBounds(skip,buyPageDTO.getPerPage()));
		
		buyPageDTO.setBuyList(buyList);
		buyPageDTO.setCurPage(curPage);
		buyPageDTO.setTotalRecord(count);
		
		return buyPageDTO;
	}
	
	/** 현재 buy테이블의 가장 최신 글의 글 번호를 가져오는 메소드 */
	public int getCurval() {
		return template.selectOne(namespace+"getCurval");
	}

	/** 글작성 */
	public void buyInsert(BuyDTO dto) {
		template.insert(namespace+"buyInsert", dto);
	}

	/**넘겨받은 buynum에 대한 상세 정보를 반환하는 메소드 (buyDetail)*/
	public BuyDTO buyDetail(int buynum) {
		return template.selectOne(namespace+"buyDetail", buynum);
	}
	
	/** 게시글 삭제 */
	public void buyDelete(int buynum) {
		template.delete(namespace+"buyDelete", buynum);
	}
	
}// end Repository

