package com.service.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.board.FreeBoardDAO;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDAO dao;
	
	
	
}//end Service
