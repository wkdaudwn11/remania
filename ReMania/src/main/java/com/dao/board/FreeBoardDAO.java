package com.dao.board;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.board.FreeBoardDTO;
import com.entity.board.FreeBoardPage;

@Repository
public class FreeBoardDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	private final String namespace = "com.remania.BoardMapper.";
	
	public void freeBoardWrite(FreeBoardDTO board){
		template.insert(namespace+"freeBoardWrite",board);
	}// end public void freeBoardWrite
	
	public FreeBoardPage freeBoardList(FreeBoardPage boardPage){
		int skip = (boardPage.getCurPage() -1)*boardPage.getPERPAGE();
		System.out.println(boardPage); //////////////////////////////
		System.out.println(skip); ////////////////////////////
		List<FreeBoardDTO> boardList = 
				template.selectList(namespace+"freeBoardList", null,new RowBounds(skip, boardPage.getPERPAGE()));
		boardPage.setBoardList(boardList);
		boardPage.setTotalRecord(totalRecord());
		return boardPage;
	}// end public void freeBoardList
	
	private int totalRecord(){
		return template.selectOne(namespace+"totalRecord",null);
	}
}// end Repository

