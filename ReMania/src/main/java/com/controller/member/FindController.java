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
	
	@Autowired
	RandomNumberAjax util;
	
	/** 아이디 찾기 메소드 */
	@RequestMapping(value="findIdCheck", method=RequestMethod.POST)
	public String findIdCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model){
		
		MemberDTO find = service.findIdCheck(dto);
		
		if(find != null){
			System.out.println("이메일은"+find.getEmail()+"입니다.");
			session.setAttribute("find", find);
			return "member/find/findIdUI2";
		}else{
			System.out.println("가입되지 않은 회원입니다.");
			return "member/login/loginUI";
		}

	}
	/** 휴대폰 번호로 비밀번호 찾기 메소드 */
	@RequestMapping(value="findPwdForTelCheck", method=RequestMethod.POST)
	public String findPwdForTelCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model){
		
		MemberDTO find = service.findPwdForTelCheck(dto);
		
		if(find != null){
			System.out.println("비밀번호는"+find.getPwd()+"입니다.");
			session.setAttribute("find", find);
			return "member/find/findPwdUI2";
		}else{
			System.out.println("가입되지 않은 회원입니다.");
			return "member/login/loginUI";
		}

	}	/** 휴대폰 번호로 비밀번호 찾기 메소드 */
	@RequestMapping(value="findPwdForEmailCheck", method=RequestMethod.POST)
	public String findPwdForEmailCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model){
		
		MemberDTO find = service.findPwdForEmailCheck(dto);
		
		if(find != null){
			System.out.println("비밀번호는"+find.getPwd()+"입니다.");
			session.setAttribute("find", find);
			return "member/find/findPwdUI2";
		}else{
			System.out.println("가입되지 않은 회원입니다.");
			return "member/login/loginUI";
		}

	}
	
}