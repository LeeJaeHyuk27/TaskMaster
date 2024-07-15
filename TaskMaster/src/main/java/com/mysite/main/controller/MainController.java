package com.mysite.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysite.main.service.MainService;
import com.mysite.main.vo.MainVO;

@Controller
public class MainController {

	@Autowired
	MainService service;
	
	@RequestMapping("/main")
	public String main() throws Exception {
		return "main";
	}
	
	@RequestMapping("/selectProject")
	@ResponseBody
	public List<MainVO> selectProject(@ModelAttribute("MainVO")MainVO vo) throws Exception {
		vo.setUserId("user1");
		List<MainVO> list = service.selectProject(vo);
		return list;
	}
	@RequestMapping("/updateFavoritesYn")
	@ResponseBody
	public int updateFavoritesYn(@ModelAttribute("MainVO")MainVO vo) throws Exception {
		vo.setUserId("user1");
		int cnt = service.updateFavoritesYn(vo);
		return cnt;
	}
	@RequestMapping("/insertNewProject")
	@ResponseBody
	public int insertNewProject(@ModelAttribute("MainVO")MainVO vo) throws Exception {
		vo.setUserId("user1");
		int cnt = service.insertNewProject(vo);
		int mem = service.insertProjectMember(vo);
		return cnt;
	}
}
 