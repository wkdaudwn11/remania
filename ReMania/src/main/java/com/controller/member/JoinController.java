package com.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.member.MemberDTO;
import com.service.member.JoinService;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService service;
	
	/** 회원가입 메소드 */
	@RequestMapping(value="joinCheck", method=RequestMethod.POST)
	public String JoinCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model){
		
		MemberDTO Join = service.joinCheck(dto);
		String target = "member/jogin/JoinUI";
		
		
		if(true){
			target = "index";
		}
		
		return target;
	}//JoinCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model)
	
	/** 이메일 중복검사 */
	@RequestMapping(value="emailCheck")
	public @ResponseBody MemberDTO emailCheck(@ModelAttribute("email") String email){
		MemberDTO dto = service.emailCheck(email);
		return dto;
	}//emailCheck(@ModelAttribute("email") String email)
	
	@RequestMapping(value="randomNumberAjax")
	public @ResponseBody void randomNumberAjax(){
		//RandomNumberAjax random = new RandomNumberAjax();
		//random.play();
	}//randomNumberAjax()
	
}