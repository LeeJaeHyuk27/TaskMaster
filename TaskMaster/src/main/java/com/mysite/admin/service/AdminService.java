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
	
	// 사용자 조회
	public List<UserInfoVO> getUserInfo(UserInfoVO vo) throws Exception{
		return dao.getUserInfo(vo);
	}
	
	// 사용자 승인
	public int allowUser(UserInfoVO vo)throws Exception{
		return dao.allowUser(vo);
	}
	
	// 사용자 삭제
	public int deleteUser(UserInfoVO vo)throws Exception{
		return dao.deleteUser(vo);
	}
}
