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
	

	public void freeBoardWrite(FreeBoardDTO board){
		dao.freeBoardWrite(board);
	}// end public void freeBoardWrite
	
	public FreeBoardPage freeBoardList(FreeBoardPage boardPage){
		return dao.freeBoardList(boardPage);
	}// end public FreeBoardPage freeBoardList
	
	public FreeBoardDTO freeBoardDetail(FreeBoardDTO board){
		return dao.freeBoardDetail(board);
	}// end public FreeBoardDTO freeBoardDetail
}//end Service
