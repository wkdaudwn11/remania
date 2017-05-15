package com.dao.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	
}// end Repository

