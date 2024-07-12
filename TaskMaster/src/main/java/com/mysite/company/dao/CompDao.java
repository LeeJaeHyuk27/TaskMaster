package com.mysite.company.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mysite.company.vo.CompVO;

@Repository
@Mapper
public interface CompDao {

	// 회사 이름 가져오기
	public List<CompVO> selectCompName(CompVO vo)throws Exception;
}
