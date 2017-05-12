package com.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.ParameterizableViewController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.ViewResolverComposite;

import com.entity.member.MemberDTO;

public class LoginValidInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private RedirectAttributes redirectAttributes;
	@Autowired
	private ViewResolverComposite viewResolver;
	private final String LOGINVIEW = "member/login/loginUI";
	
	boolean result = true;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberDTO login = (MemberDTO)session.getAttribute("login");

		
		if(login == null){ 
			result = false;
			redirectAttributes.addFlashAttribute("prevPage", request.getHeader("Referer"));
			System.out.println(handler + "  LoVaInter"); //////////////////////////////
			/*ParameterizableViewController viewController = (ParameterizableViewController)handler;
			viewController.setViewName("/member/login/loginUI");*/
			//response.sendRedirect(request.getContextPath()+"/login");
		}
		return true;
	}// end preHandle

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(!result){
			ParameterizableViewController viewController = (ParameterizableViewController)handler;
			modelAndView.setViewName("redirect:/"+LOGINVIEW);
		}
	}
	
}// end RemaniaInterceptor
