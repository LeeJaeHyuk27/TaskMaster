package com.mysite.login.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mysite.login.vo.UserInfoVO;

@Repository
@Mapper
public interface LoginDao {

	// 로그인
	public UserInfoVO selectUserInfo(UserInfoVO vo) throws Exception;
	
}
