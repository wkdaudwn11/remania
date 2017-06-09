package com.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.service.admin.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService service; 
	
}
