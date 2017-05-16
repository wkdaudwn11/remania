package com.controller.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.board.FreeBoardDTO;
import com.entity.board.FreeBoardPage;
import com.entity.member.MemberDTO;
import com.service.board.FreeBoardService;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService service;
	
	@RequestMapping("/freeBoardWrite")
	public String freeBoardWrite(HttpSession session,FreeBoardDTO board){
		board.setEmail(((MemberDTO)session.getAttribute("login")).getEmail());
		service.freeBoardWrite(board);
		return "redirect:freeBoardList";
	}// end freeBoardWrite()
	
	@RequestMapping("/freeBoardList")
	public String freeBoardList(@ModelAttribute("FreeBoardPage")FreeBoardPage boardPage){
		System.out.println(boardPage.getCurPage()); ////////////////////////////////
		if(boardPage.getCurPage() == 0){
			boardPage.setCurPage(1);
		}
		System.out.println(boardPage.getCurPage()); ////////////////////////////////
		boardPage = service.freeBoardList(boardPage);
		
		return "board/free/freeBoardList";
	}// end public String freeBoardList
	
}//end Controller
