package com.mysite.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.mysite.main.dao.MainDao;
import com.mysite.main.vo.MainVO;

@Service
public class MainService {

	@Autowired
	MainDao dao;
	public List<MainVO> selectProject(MainVO vo) throws Exception {
		return dao.selectProject(vo);
	}
	public int updateFavoritesYn(MainVO vo) throws Exception {
		return dao.updateFavoritesYn(vo);
	}
	public int insertNewProject(MainVO vo) throws Exception {
		return dao.insertNewProject(vo);
	}
	public int insertProjectMember(MainVO vo) throws Exception {
		return dao.insertProjectMember(vo);
	}
	
}
