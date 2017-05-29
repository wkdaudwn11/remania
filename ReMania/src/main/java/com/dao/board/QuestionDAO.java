package com.dao.board;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.board.FreeBoardPage;
import com.entity.board.InquiryPage;
import com.entity.board.QuestionDTO;

@Repository
public class QuestionDAO {

	@Autowired
	SqlSessionTemplate template;

	private final String namespace = "com.remania.QuestionMapper.";
	
	/** 문의 글 리스트 가져오기*/
	public InquiryPage inquiryList(InquiryPage inquiryPage){
		int skip = (inquiryPage.getCurPage()-1)*inquiryPage.getPERPAGE();
		List<QuestionDTO> inquiryList = template.selectList(namespace+"inquiryList",null,new RowBounds(skip,inquiryPage.getPERPAGE()));
		inquiryPage.setInquiryList(inquiryList);
		inquiryPage.setTotalRecord(totalRecord(inquiryPage));
		return inquiryPage;
	}
	
	/** totalRecord 전체 레코드 수*/
	private int totalRecord(InquiryPage inquiryPage){
		return template.selectOne(namespace+"totalRecord",inquiryPage);
	}// end private int totalRecord()
	
	/** 문의 글 등록 */
	public void inquiryRegister(QuestionDTO question){
		template.insert(namespace+"inquiryRegister",question);
	}
	
	/** 문의글 상세보기 */
	public QuestionDTO questionDetail(QuestionDTO question){
		return template.selectOne(namespace+"questionDetail",question);
	}
	
	/** 답변 등록*/
	public void answer(QuestionDTO question){
		template.insert(namespace+"answer",question);
	}
	
	public void stateUpdate(QuestionDTO question){
		template.update(namespace+"stateUpdate",question);
	}
	
}// end Class
