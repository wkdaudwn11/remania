package com.util;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PrevPageInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		
		if(modelAndView.getModel().get("loginFail") == null){
			String prevPage = (String)session.getAttribute("prevPage");
			session.removeAttribute("prevPage");
			if(prevPage != null){
				modelAndView.setViewName("redirect:"+prevPage);
			}
		}
		
	}// end postHandle
}// end Class
