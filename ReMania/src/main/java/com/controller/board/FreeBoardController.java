package com.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.board.FreeBoardDTO;
import com.service.board.FreeBoardService;

@Controller
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService service;
	
	@RequestMapping("freeBoardList")
	public List<FreeBoardDTO> freeBoardList(@ModelAttribute("freeBoardList") FreeBoardDTO dto){
		List<FreeBoardDTO> list = service.listAll();
		return list;
	}

}
