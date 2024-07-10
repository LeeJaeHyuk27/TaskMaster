package com.mysite.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysite.company.service.CompService;
import com.mysite.company.vo.CompVO;

@Controller
public class CompController {

	@Autowired
	CompService service;
	
	// 회사 이름 가져오기
	@RequestMapping("/comp/getCompName")
	@ResponseBody
	public List<CompVO> getCompName(@ModelAttribute CompVO vo)throws Exception{
		
		List<CompVO> list = service.selectCompName(vo);
		
		return list;
	}
	

}
