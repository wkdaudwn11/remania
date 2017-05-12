package com.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.member.MemberDTO;
import com.service.member.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	/*
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(@ModelAttribute("login") MemberDTO dto){
		return "member/login/loginUI";
	}
	
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	public String loginCheck(@Valid @ModelAttribute("login") MemberDTO dto, BindingResult error){
		
		if(error.hasErrors()){
			return "member/login/loginUI";
		}
		
		return "index";
	}*/
	
	/** 로그인 폼에서 로그인을 하면 이 메소드로 온다.*/
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	public String loginCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model){
		
		MemberDTO login = service.loginCheck(dto);
		String target = "member/login/loginUI";
		
		if(login != null){
			if(login.getEmail().equals("-1")){
				model.addAttribute("loginFail", "존재하지 않는 아이디 입니다.");
			}else{
				session.setAttribute("login", login);
				target = "index";
			}
		}else{
			model.addAttribute("email", dto.getEmail());
			model.addAttribute("loginFail", "비밀번호가 틀립니다.");
		}
		
		return target;
	}//loginCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model)
	
	/** 로그아웃 메소드 */
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String login(HttpSession session){
		session.invalidate();
		return "index";
	}//login(HttpSession session)
	
}
