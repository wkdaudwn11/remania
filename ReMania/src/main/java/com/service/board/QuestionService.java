package com.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.board.QuestionDAO;
import com.entity.board.InquiryPage;
import com.entity.board.QuestionDTO;

@Service
public class QuestionService {

	@Autowired
	QuestionDAO dao;
	
	public InquiryPage inquiryList(InquiryPage inquiryPage){
		return dao.inquiryList(inquiryPage);
	}
	
	public void inquiryRegister(QuestionDTO question){
		dao.inquiryRegister(question);
	}
	
	public QuestionDTO questionDetail(QuestionDTO question){
		return dao.questionDetail(question);
	}
	
	@Transactional
	public void answer(QuestionDTO question){
		dao.stateUpdate(question);
		dao.answer(question);
	}
}// end class
