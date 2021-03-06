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
	
	public void boardUpdate(FreeBoardDTO board){
		dao.boardUpdate(board);
	}
	
	public void deleteBoard(int freeboardnum){
		dao.deleteBoard(freeboardnum);
	}
	
	public FreeBoardPage freeBoardList(FreeBoardPage boardPage){
		return dao.freeBoardList(boardPage);
	}// end public FreeBoardPage freeBoardList
	
	@Transactional
	public FreeBoardDTO freeBoardDetail(FreeBoardDTO board){
		return dao.freeBoardDetail(board);
	}// end public FreeBoardDTO freeBoardDetail
	
	public List<Comment> commentList(int num,Integer skip,String category){
		return dao.commentList(num, skip,category);
	}
	
	public void comment(Comment comment){
		dao.comment(comment);
	}// end public void comment
	
	public void deleteComment(Comment comment){
		dao.deleteComment(comment);
	}
	
	public void updateComment(Comment comment){
		dao.updateComment(comment);
	}
	
	@Transactional
	public void recomment(Comment recomment){
		dao.recomment(recomment);
	}// end public void recomment
}//end Service
