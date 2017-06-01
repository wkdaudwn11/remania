package com.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.board.Comment;
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
	
	@RequestMapping("/boardUpdate")
	public String boardUpdate(FreeBoardDTO board,String curPage,String type,String value,RedirectAttributes redirectAttributes){
		service.boardUpdate(board);
		redirectAttributes.addAttribute("freeboardnum",board.getFreeboardnum());
		redirectAttributes.addAttribute("curPage",curPage);
		redirectAttributes.addAttribute("type", type);
		redirectAttributes.addAttribute("value", value);
		redirectAttributes.addFlashAttribute("update", "수정 완료");
		return "redirect:freeBoardDetail";
	}// end public void boardUpdate
	
	@RequestMapping("/deleteBoard")
	public String deleteBoard(int freeboardnum,FreeBoardPage boardPage,RedirectAttributes redirectAttributes){
		service.deleteBoard(freeboardnum);
		redirectAttributes.addAttribute("curPage", boardPage.getCurPage());
		redirectAttributes.addAttribute("type",boardPage.getType());
		redirectAttributes.addAttribute("value", boardPage.getValue());
		return "redirect:freeBoardList";
	}
	
	@RequestMapping("/freeBoardList")
	public String freeBoardList(@ModelAttribute("FreeBoardPage")FreeBoardPage boardPage){
		if(boardPage.getValue() != null && boardPage.getValue().equals("")){
			boardPage.setValue(null);
		}
		if(boardPage.getCurPage() == 0){
			boardPage.setCurPage(1);
		}
		boardPage = service.freeBoardList(boardPage);
		return "board/free/freeBoardList";
	}// end public String freeBoardList
	
	@RequestMapping("/freeBoardDetail")
	public ModelAndView freeBoardDetail(HttpServletRequest request,FreeBoardDTO board,FreeBoardPage boardPage){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("board",service.freeBoardDetail(board));
		modelAndView.addObject("commentList",service.commentList(board.getFreeboardnum(), null, "board"));
		modelAndView.addObject("FreeBoardPage", service.freeBoardList(boardPage));
		modelAndView.setViewName("board/free/freeBoardDetail");
		return modelAndView;
 	}// end public String freeBoardDetail()
	
	
	@RequestMapping("/comment")
	public String comment(@SessionAttribute("login")MemberDTO member,Comment comment,String call,String curPage,String type,String value,RedirectAttributes redirectAttributes){
		comment.setEmail(member.getEmail());
		comment.setAuthor(member.getName());
		if(call.equals("comment")){
			service.comment(comment);
		}else if(call.equals("recomment")){
			service.recomment(comment);
		}
		
		String viewName = null;
		if(comment.getCategory().equals("board")){
			redirectAttributes.addAttribute("freeboardnum",comment.getBoardnum());
			redirectAttributes.addAttribute("type",type);
			redirectAttributes.addAttribute("value",value);
			viewName = "redirect:freeBoardDetail";
		}else if(comment.getCategory().equals("buy")){
			redirectAttributes.addAttribute("buynum",comment.getBoardnum());
			redirectAttributes.addAttribute("searchType",type);
			redirectAttributes.addAttribute("searchValue",value);
			viewName = "redirect:buyDetail";
		}
		redirectAttributes.addAttribute("curPage",curPage);
		redirectAttributes.addAttribute("commentWrite", "작성 완료");
		return viewName;
	}// end public String comment()
	
	@RequestMapping("/deleteComment")
	public String deleteComment(Comment comment,String curPage,String type,String value,RedirectAttributes redirectAttributes){
		service.deleteComment(comment);
		redirectAttributes.addAttribute("freeboardnum",comment.getBoardnum());
		redirectAttributes.addAttribute("curPage",curPage);
		redirectAttributes.addAttribute("type", type);
		redirectAttributes.addAttribute("value", value);
		redirectAttributes.addFlashAttribute("deleteComment","삭제 완료");
		return "redirect:freeBoardDetail";
	}
	
	@RequestMapping("/updateComment")
	public String updateComment(Comment comment,String curPage,String type,String value,RedirectAttributes redirectAttributes){
		service.updateComment(comment);
		redirectAttributes.addAttribute("freeboardnum", comment.getBoardnum());
		redirectAttributes.addAttribute("curPage", curPage);
		redirectAttributes.addAttribute("type", type);
		redirectAttributes.addAttribute("value", value);
		redirectAttributes.addFlashAttribute("update", "수정 완료");
		return "redirect:freeBoardDetail";
	}
	
	@RequestMapping("/commentList")
	@ResponseBody
	public List<Comment> commentList(int num,int skip,String category){
		return service.commentList(num,skip,category);
	}
}//end Controller