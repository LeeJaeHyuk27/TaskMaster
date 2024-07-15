package com.mysite.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mysite.login.vo.UserInfoVO;

@Repository
@Mapper
public interface AdminDao {
	
	// 사용자 조회
	public List<UserInfoVO> getUserInfo(UserInfoVO vo) throws Exception;
	
	// 사용자 승인
	public int allowUser(UserInfoVO vo)throws Exception;
	
	// 사용자 삭제
	public int deleteUser(UserInfoVO vo)throws Exception;
}
