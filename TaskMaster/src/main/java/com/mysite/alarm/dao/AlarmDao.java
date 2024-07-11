package com.mysite.alarm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mysite.alarm.vo.AlarmVO;

@Repository
@Mapper
public interface AlarmDao {

	/**
     * 알람 생성
     * @param vo 알람 정보를 담고 있는 객체
     * @throws Exception 알람 생성 중 예외가 발생할 경우
     */
	public void createAlarm(AlarmVO vo) throws Exception;
	
	/**
	 * 프로젝트명 조회
	 * @param projectSeq
	 * @return 프로젝트명
	 */
	public String getProjectName(int projectSeq);

	/**
	 * 업무명 조회
	 * @param taskSeq
	 * @return 업무명
	 */
    public String getTaskName(int taskSeq);

	/**
	 * 알람 리스트 조회
	 * @param userId
	 * @return 알람 리스트
	 */
	public List<AlarmVO> getAlarm(String userId);
	
}