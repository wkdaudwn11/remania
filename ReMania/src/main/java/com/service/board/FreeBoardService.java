package com.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.dao.board.FreeBoardDAO;
import com.entity.board.Comment;
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
	
	@Transactional
	public ModelAndView freeBoardDetail(FreeBoardDTO board){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("board",dao.freeBoardDetail(board));
		modelAndView.addObject("commentList",dao.commentList(board.getFreeboardnum(), null));
		return modelAndView;
	}// end public FreeBoardDTO freeBoardDetail
	
	public List<Comment> commetList(int num,int skip){
		return dao.commentList(num, skip);
	}
	
	public void comment(Comment comment){
		dao.comment(comment);
	}// end public void comment
	
	@Transactional
	public void recomment(Comment recomment){
		dao.recomment(recomment);
	}// end public void recomment
}//end Service
