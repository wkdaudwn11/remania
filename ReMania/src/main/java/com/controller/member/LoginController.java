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
	
	/** 모바일로 접속하면 일로오게 됨 */
	@RequestMapping(value="mobileIndex", method=RequestMethod.GET)
	public String mobileIndex(HttpSession session){
		session.setAttribute("mobile", "o"); // 모든 컨트롤러가 이 세션값으로 모바일로 갈 건지 웹으로 갈 건지 정함.
		return "mobile/mobileIndex";
	}//mobileIndex(HttpSession session)
	
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
				
				String mobile = (String)session.getAttribute("mobile");
				if(mobile.equals("o")) target = "mobile/mobileIndex";
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
		String mobile = (String)session.getAttribute("mobile");
		session.invalidate();
		if(mobile.equals("o")){
			return "redirect:mobileIndex";
		}else{
			return "index";
		}
	}//logout(HttpSession session)
	
}
