package com.mysite.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysite.login.dao.LoginDao;
import com.mysite.login.vo.UserInfoVO;

@Service
public class LoginService {

	@Autowired
	LoginDao loginDao;
	
	// 로그인
	public UserInfoVO selectUserInfo(UserInfoVO vo) throws Exception{
		return loginDao.selectUserInfo(vo);
	}
	
	// 회원가입
	public int insertUserInfo(UserInfoVO vo) throws Exception{
		return loginDao.insertUserInfo(vo);
	}
}
