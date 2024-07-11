package com.mysite.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysite.admin.dao.AdminDao;
import com.mysite.login.vo.UserInfoVO;

@Service
public class AdminService {

	@Autowired
	AdminDao dao;
	
	// 사용자 승인
	public List<UserInfoVO> getAllowUser(UserInfoVO uservo) throws Exception{
		return dao.getAllowUser(uservo);
	}
}
