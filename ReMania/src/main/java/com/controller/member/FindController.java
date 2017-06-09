package com.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.member.FindDAO;
import com.entity.member.MemberDTO;
import com.service.member.FindService;
import com.util.RandomNumberAjax;
import com.util.SendMail;

@Controller
public class FindController {
	
	@Autowired
	private FindDAO findDao;
	
	@Autowired
	private FindService service;
	
	private RandomNumberAjax util;
	
	/** 이메일 찾기 메소드 */
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findId(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session,RedirectAttributes redirectAttributes){
		
		String target = "";
		MemberDTO find = service.findIdCheck(dto);
		
		if(find != null){
			redirectAttributes.addFlashAttribute("find", find);
		}else{
			redirectAttributes.addFlashAttribute("notFound", "일치하는 정보가 없습니다.");
		}
		
		try{
			String mobile = (String)session.getAttribute("mobile");
			if(mobile.equals("o")) target = "redirect:mobileLogin";
		}catch(NullPointerException e){
			target = "redirect:login";
		}
		
		return target;
	}//updateCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, Model model)
	
	/** 연락처로 비밀번호 찾기 */
	@RequestMapping(value="findPwdForTel")
	public String findPwdForTel(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, RedirectAttributes redirectAttributes){
		String target = "";
		MemberDTO find = service.findIdCheck(dto);
		
		if(find != null){
			redirectAttributes.addFlashAttribute("email", find.getEmail());
			try{
				String mobile = (String)session.getAttribute("mobile");
				if(mobile.equals("o")) target = "redirect:mobileUpdatePwdUI";
			}catch(NullPointerException e){
				target = "redirect:updatePwdUI";
			}
		}else{
			redirectAttributes.addFlashAttribute("notFound", "일치하는 정보가 없습니다.");
			try{
				String mobile = (String)session.getAttribute("mobile");
				if(mobile.equals("o")) target = "redirect:mobileLogin";
			}catch(NullPointerException e){
				target = "redirect:login";
			}
		}
		
		return target;
	}//findPwdForTel(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, RedirectAttributes redirectAttributes)
	
	/** 존재하는 email인지 체크 */
	@RequestMapping(value="findPwdForEmail")
	public String emailCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, RedirectAttributes redirectAttributes){
		
		String target = "";
		MemberDTO find = service.emailExistCheck(dto);
		
		if(find != null){
			
			redirectAttributes.addFlashAttribute("find", find);
			session.setAttribute("email", find.getEmail());
			
			SendMail mail = new SendMail();
			
			try{
				String mobile = (String)session.getAttribute("mobile");
				if(mobile.equals("o")) {
					target = "redirect:mobileEmailConfirmUI";
					mail.sendMail(dto, "o");
				}
			}catch(NullPointerException e){
				target = "redirect:emailConfirmUI";
				mail.sendMail(dto, "x");
			}
		}else{
			redirectAttributes.addFlashAttribute("notFound", "일치하는 정보가 없습니다.");
			try{
				String mobile = (String)session.getAttribute("mobile");
				if(mobile.equals("o")) target = "redirect:mobileLogin";
			}catch(NullPointerException e){
				target = "redirect:login";
			}
		}
		
		return target;
	}//emailCheck(@ModelAttribute("MemberDTO") MemberDTO dto, HttpSession session, RedirectAttributes redirectAttributes)
	
	/** 비밀번호 변경 메소드 */
	@RequestMapping(value="updatePwd")
	public String updatePwd(String email, String pwd, HttpSession session){
		
		String target = "";
		
		service.updatePwd(email, pwd);
		
		try{
			String mobile = (String)session.getAttribute("mobile");
			if(mobile.equals("o")) target = "redirect:mobileLogin";
		}catch(NullPointerException e){
			target = "redirect:login";
		}
		return target;
	}//updatePwd(String email, String pwd)
}