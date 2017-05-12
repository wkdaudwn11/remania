package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class PrevPageSupportInterceptor extends HandlerInterceptorAdapter {

	/*@Autowired
	private RedirectAttributes redirectAttributes;
	
	private String prevPage;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		prevPage = (String)redirectAttributes.getFlashAttributes().get("prevPage");
		System.out.println(handler+ "  preSupInter"); ///////////////////////////////
		redirectAttributes.addFlashAttribute("prevPage",prevPage);
	}// end postHandle
*/	
}// end Class
