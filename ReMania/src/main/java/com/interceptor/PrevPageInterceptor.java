package com.interceptor;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class PrevPageInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	RedirectAttributes redirectAttributes;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		Map<String, ?> flash =  redirectAttributes.getFlashAttributes();
		
		System.out.println("444444444444444444444444"); //////////////////////////////
		System.out.println(request.getAttribute("prevPage"));
		
		String prevPage = (String)flash.get("prevPage");
		if(prevPage != null){
			System.out.println("555555555555555555555"); /////////////////////////// 
			prevPage = prevPage.substring(prevPage.lastIndexOf("/"));
			System.out.println(modelAndView.getViewName());
			modelAndView.setViewName("redirect:"+prevPage);
		}
	}// end postHandle

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("--------------------------------------");
		Enumeration tt = request.getHeaderNames();
		while(tt.hasMoreElements()){
			System.out.println(tt.nextElement());
		}
		System.out.println(request.getAttribute("prevPage"));
		return super.preHandle(request, response, handler);
	}
	
}// end Class
