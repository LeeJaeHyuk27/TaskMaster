package com.mysite.admin.dao;

import java.util.List;

import com.mysite.login.vo.UserInfoVO;

public class AdminDaoImpl implements AdminDao{

	// 사용자 조회
	@Override
	public List<UserInfoVO> getUserInfo(UserInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 사용자 승인
	@Override
	public int allowUser(UserInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	// 사용자 삭제
	@Override
	public int deleteUser(UserInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
