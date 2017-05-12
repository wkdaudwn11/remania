package com.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.board.FreeBoardDAO;
import com.entity.board.FreeBoardDTO;

public class FreeBoardService {

	@Autowired
	private FreeBoardDAO freeBoardDao;

	public void setFreeBoardDao(FreeBoardDAO freeBoardDao) {
		this.freeBoardDao = freeBoardDao;
	}
	
	public List<FreeBoardDTO> listAll(){
		return freeBoardDao.listAll();
	}
	
}
