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
	
	/** write 레코드 추가*/
	public void freeBoardWrite(FreeBoardDTO board){
		template.insert(namespace+"freeBoardWrite",board);
	}// end public void freeBoardWrite

	/** list 전체 레코드 가져오기*/
	public FreeBoardPage freeBoardList(FreeBoardPage boardPage){
		
		int skip = (boardPage.getCurPage()-1)*boardPage.getPERPAGE();
		
		List<FreeBoardDTO> boardList = template.selectList(namespace+"freeBoardList", null,new RowBounds(skip, boardPage.getPERPAGE()));
		
		boardPage.setBoardList(boardList);
		boardPage.setTotalRecord(totalRecord());
		
		return boardPage;
	}// end public void freeBoardList
	
	/** totalRecord 전체 레코드 수*/
	private int totalRecord(){
		return template.selectOne(namespace+"totalRecord",null);
	}// end private int totalRecord()
	
	/** Detail 레코드 하나 가져오기*/
	public FreeBoardDTO freeBoardDetail(FreeBoardDTO board){
		return template.selectOne(namespace+"freeBoardDetail",board);
	}// end public FreeBoardDTO freeBoardDetail
}// end Repository

