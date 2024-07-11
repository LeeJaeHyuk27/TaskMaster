package com.mysite.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mysite.login.vo.UserInfoVO;

@Repository
@Mapper
public interface AdminDao {
	
	// 사용자 승인
	public List<UserInfoVO> getAllowUser(UserInfoVO uservo) throws Exception;

}
