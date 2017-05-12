package com.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class PrevPageInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		RedirectAttributes redirectAttributes = null;
		
		Map<String, ?> flash =  redirectAttributes.getFlashAttributes();
		String prevPage = (String)flash.get("prevPage");
		if(prevPage != null){
			System.out.println(prevPage+"/////////////");
		}
	}// end postHandle
	
}// end Class
