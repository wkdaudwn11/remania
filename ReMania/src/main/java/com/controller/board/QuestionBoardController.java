package com.controller.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.board.InquiryPage;
import com.entity.board.QuestionDTO;
import com.entity.member.MemberDTO;
import com.service.board.QuestionService;

@Controller
public class QuestionBoardController {

	@Autowired
	QuestionService service;
	
	@RequestMapping("/questionList")
	public String questionList(HttpSession session,@ModelAttribute("InquiryPage")InquiryPage inquiryPage){
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		String viewName = null ;
		if(member != null && member.getEmail().equals("admin")){
			if(inquiryPage.getCurPage() == 0){
				inquiryPage.setCurPage(1);
			}
			inquiryPage = service.inquiryList(inquiryPage);
			viewName = "board/question/inquiryList";
		}else{
			viewName = "board/question/questionList";
		}
		return viewName;
	}// end @RequestMapping("/questionList")
	
	@RequestMapping("/inquiryRegister")
	public String inquiryRegister(QuestionDTO question){
		service.inquiryRegister(question);
		return "redirect:questionList";
	}
	
	@RequestMapping("/questionDetail")
	public String questionDetail(QuestionDTO question,String curPage,Model m){
		m.addAttribute("Question", service.questionDetail(question) );
		return "board/question/questionDetail";
	}
	
	@RequestMapping("/answer")
	public String answer(HttpSession session,QuestionDTO question,String curPage,RedirectAttributes redirectAttributes){
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		question.setEmail(question.getEmail());
		question.setAuthor(member.getName());
		question.setComment_level(1);
		question.setState("답변 완료");
		service.answer(question);
		redirectAttributes.addAttribute("curPage", curPage);
		return "redirect:questionList";
	}
}// end class
