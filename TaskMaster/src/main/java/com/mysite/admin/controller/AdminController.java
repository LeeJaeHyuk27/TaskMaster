package com.mysite.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysite.admin.service.AdminService;
import com.mysite.login.vo.UserInfoVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@RequestMapping("/admin")
	public String admin() throws Exception{
		return "/admin";
	}
	
	// 사용자 승인
	@RequestMapping("/admin/getAllowUser")
	@ResponseBody
	public List<UserInfoVO> getAllowUser(@ModelAttribute UserInfoVO vo, HttpServletRequest request) throws Exception{
		
		HttpSession session  = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("TaskMaster");
	    System.out.println(uservo);
		
		List<UserInfoVO> list = service.getAllowUser(vo);
		
		return list;
	}
}
