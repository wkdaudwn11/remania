package com.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.board.FreeBoardDAO;
import com.entity.board.FreeBoardDTO;
import com.entity.board.FreeBoardPage;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDAO dao;
	
	public void setDao(FreeBoardDAO dao) {
		this.dao = dao;
	}

	public void freeBoardWrite(FreeBoardDTO board){
		dao.freeBoardWrite(board);
	}
	
	public FreeBoardPage freeBoardList(FreeBoardPage boardPage){
		return dao.freeBoardList(boardPage);
	}
}//end Service
