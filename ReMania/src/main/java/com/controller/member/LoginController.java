package com.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.member.MemberDTO;
import com.service.member.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	/** 로그인 됐나 확인*/
	@RequestMapping("/loginConfirm")
	public String loginConfirm(HttpServletRequest request,RedirectAttributes redirectAttributes){
		redirectAttributes.addFlashAttribute("requiredLogin", "로그인이 필요한 서비스 입니다.");
		return "redirect:login";
	}
	
	/** 로그인 폼에서 로그인을 하면 이 메소드로 온다. */
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	public String loginCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model){
		
		String target = "redirect:login";
		
		MemberDTO login = service.loginCheck(dto);
		if(login != null){
			if(login.getEmail().equals("-1")){
				model.addAttribute("loginFail", "존재하지 않는 아이디 입니다.");
			}else{
				String loginDate = service.loginUpdate(login.getMembernum());
				login = service.loginCheck(dto);
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
	public String logout(HttpSession session){
		session.invalidate();
		return "index";
	}//login(HttpSession session)
	
}
