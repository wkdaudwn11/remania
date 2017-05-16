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
import com.service.member.LoginService;
import com.util.RandomNumberAjax;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService service;
	
	@Autowired
	RandomNumberAjax util;
	
	/** 회원가입 메소드 */
	@RequestMapping(value="joinCheck", method=RequestMethod.POST)
	public String JoinCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model){
		service.joinCheck(dto);
		return "redirect:login";
	}//JoinCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model)
	
	/** 이메일 중복검사 */
	@RequestMapping(value="emailCheck")
	public @ResponseBody MemberDTO emailCheck(@ModelAttribute("email") String email){
		MemberDTO dto = service.emailCheck(email);
		return dto;
	}//emailCheck(@ModelAttribute("email") String email)
	
	/** 인증번호를 생성하고, 문자로 발송해주는 메소드. (인증번호는 세션에 저장)*/
	@RequestMapping(value="randomNumberAjax")
	public @ResponseBody String randomNumberAjax(String usertel, HttpSession session){
		String confirmNumber = util.getConfirmNum(usertel);
		return confirmNumber;
	}//randomNumberAjax(String usertel, HttpSession session)
	
}