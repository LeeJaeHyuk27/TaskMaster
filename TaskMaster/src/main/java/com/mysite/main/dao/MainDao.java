package com.mysite.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mysite.main.vo.MainVO;

@Repository
@Mapper
public interface MainDao {

	public List<MainVO> selectProject(MainVO vo) throws Exception ;
	public int updateFavoritesYn(MainVO vo) throws Exception;
	public int insertNewProject(MainVO vo) throws Exception;
	public int insertProjectMember(MainVO vo) throws Exception;
	
	
	
	}
