package com.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.mvc.ParameterizableViewController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.ViewResolverComposite;

import com.entity.member.MemberDTO;

public class LoginValidInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberDTO login = (MemberDTO)session.getAttribute("login");

		boolean result = true;
		if(login == null){ 
			result = false;
			System.out.println("111111111111111111"); ///////////////////////////////
			RequestDispatcher dis = request.getRequestDispatcher("/loginAuthentication");
			dis.forward(request, response);
		}
		return result;
	}// end preHandle

	
}// end RemaniaInterceptor
