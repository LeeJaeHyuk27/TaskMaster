package com.mysite.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysite.company.dao.CompDao;
import com.mysite.company.vo.CompVO;

@Service
public class CompService {

	@Autowired
	CompDao dao;
	
	// 회사 이름 가져오기
	public List<CompVO> selectCompName(CompVO vo)throws Exception{
		return dao.selectCompName(vo);
	}
}
