package com.dao.board;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.entity.board.FreeBoardDTO;

public class FreeBoardDAO {

	private String namespace = "com.remania.FreeBoardMapper.";
	private SqlSessionTemplate template;

	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	public List<FreeBoardDTO> listAll(){
		return template.selectList(namespace+"listAll");
	}
	
}
