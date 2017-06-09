package com.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO.AdminDAO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;
	
}
