package com.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.member.FindDAO;
import com.entity.member.MemberDTO;
import com.service.member.FindService;
import com.service.member.JoinService;
import com.util.RandomNumberAjax;

@Controller
public class FindController {
	
	@Autowired
	private FindDAO findDao;
	
	@Autowired
	private FindService service;
	
	private RandomNumberAjax util;
	
	/** 아이디 찾기 메소드 */
	@RequestMapping(value="findIdCheck", method=RequestMethod.POST)
	public String findIdCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model){
		
		String target = "redirect:login";
		
		MemberDTO find = service.findIdCheck(dto);
		
		if(find != null){	
				session.setAttribute("find", find);
				System.out.println("1");
				target = "redirect:login";
			
		}else{
			System.out.println("2");
		}
		System.out.println(find.getTel());
		System.out.println(find.getEmail());
		
		return "member/login/loginUI";
		
		/*return "redirect:login";*/
	}//updateCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model)
	
	
}