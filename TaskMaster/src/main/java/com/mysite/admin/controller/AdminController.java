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
	AdminService adminService;
	
	@RequestMapping("/admin")
	public String admin() throws Exception{
		return "/admin";
	}
	
	// 사용자 조회
	@RequestMapping("/admin/getUserInfo")
	@ResponseBody
	public List<UserInfoVO> getUserInfo(@ModelAttribute UserInfoVO vo, HttpServletRequest request)throws Exception{
		HttpSession session  = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("TaskMaster");
	    vo.setUserId(uservo.getUserId());
		
		List<UserInfoVO> list = adminService.getUserInfo(vo);
		
		return list;
	}
	
	// 사용자 승인
	@RequestMapping("/admin/allowUser")
	@ResponseBody
	public int allowUser(@ModelAttribute("UserInfoVO")UserInfoVO vo)throws Exception{
		
		int cnt = adminService.allowUser(vo);
		
		return cnt;
	}
	
	// 사용자 삭제
	@RequestMapping("/admin/deleteUser")
	@ResponseBody
	public int deleteUser(@ModelAttribute("UserInfoVO")UserInfoVO vo)throws Exception{
		
		int cnt = adminService.deleteUser(vo);
		
		return cnt;
	}
}
