package com.dao.mypage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.board.InquiryPage;
import com.entity.board.QuestionDTO;
import com.entity.mypage.MypageDTO;
import com.entity.trade.BuyDTO;
import com.entity.trade.TradeDTO;

@Repository
public class MypageDAO {

private String namespace = "com.remania.MypageMapper.";
	
	@Autowired
	private SqlSessionTemplate template;

	/** Mypage의 값들을 DB에서 가져온 후, set하여 DTO를 반환 */
	public MypageDTO getMypageDTO(String email) {
		
		MypageDTO dto = new MypageDTO();
		//문의
		dto.setInquiryRegister(template.selectOne(namespace+"getInquiryRegister",email));
		
		//삽니다
		dto.setBuywrite(template.selectOne(namespace+"getBuywrite", email));
		dto.setBuytrading(template.selectOne(namespace+"getBuytrading", email));
		dto.setBuyend(template.selectOne(namespace+"getBuyend", email));
		
		//팝니다
		dto.setSelltrading(template.selectOne(namespace+"getSelltrading", email));
		dto.setSellend(template.selectOne(namespace+"getSellend", email));
		
		return dto;
	}//getMypageDTO(MemberDTO login)

	/** trade 테이블에서 정보를 가져온다. */
	public List<TradeDTO> getTradeInfo(String trade, String email, String process) {
		HashMap map = new HashMap();
		map.put("trade", trade);
		map.put("email", email);
		map.put("process", process);
		return template.selectList(namespace+"getTradeInfo", map);
	}//getTradeInfo(String trade, String email, String history)

	/** buy테이블에서 정보를 가져온다. */
	public BuyDTO getBuyInfo(int categorynum) {
		return template.selectOne(namespace+"getBuyInfo", categorynum);
	}

	/** 판매자의 이름을 반환한다. */
	public String getSellerName(String seller) {
		return template.selectOne(namespace+"getSellerName", seller);
	}

	/** 삽니다 혹은 팝니다 게시판에 해당 이메일이 작성한 게시글 수를 가져오는 메소드 (state가 null인 것만) */
	public List<BuyDTO> getWriteHistory(String email, String trade) {
		if(trade.equals("buyer")){
			return template.selectList(namespace+"getBuyWriteHistory", email);
		}else{
			return null;
		}
	}//getWriteHistory(String email, String trade)
	
	public InquiryPage myInquiryList(String email,InquiryPage inquiryPage){
		int skip = (inquiryPage.getCurPage() - 1)*inquiryPage.getPERPAGE();
		List<QuestionDTO> inquiryList = template.selectList(namespace+"myInquiryList",email,new RowBounds(skip,inquiryPage.getPERPAGE()));
		inquiryPage.setInquiryList(inquiryList);
		inquiryPage.setTotalRecord(template.selectOne(namespace+"myInquiryTotalRecord",email));
		return inquiryPage;
	}
	
	/** 문의글 상세보기 */
	public QuestionDTO questionDetail(QuestionDTO question){
		return template.selectOne(namespace+"questionDetail",question);
	}
}
