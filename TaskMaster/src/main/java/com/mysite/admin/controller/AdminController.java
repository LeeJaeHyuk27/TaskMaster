package com.mysite.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysite.admin.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@RequestMapping("/admin")
	public String admin() throws Exception{
		return "/admin";
	}
}
