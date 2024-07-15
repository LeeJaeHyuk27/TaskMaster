package com.mysite.alarm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mysite.alarm.vo.AlarmVO;
import com.mysite.login.vo.UserInfoVO;

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
	 * @return String 프로젝트명
	 */
	public String getProjectName(int projectSeq);

	/**
	 * 업무명 조회
	 * @param taskSeq
	 * @return String 업무명
	 */
    public String getTaskName(int taskSeq);

	/**
	 * 알람 리스트 조회
	 * @param userId
	 * @return List<AlarmVO> 알람 리스트
	 */
	public List<AlarmVO> getAlarm(String userId);

	/**
	 * 회사 관리자 리스트 조회
	 * @param companyCd
	 * @return List<UserInfoVO> 회사 관리자 리스트
	 */
	public List<UserInfoVO> getCompanyAdminList(String companyCd);

	/**
	 * 업무에 할당된 유저 리스트 조회
	 * @param taskSeq
	 * @return List<UserInfoVO> 업무에 할당된 유저 리스트
	 */
	public List<UserInfoVO> getTaskAllocationUserList(int taskSeq);

	/**
	 * 대댓글이 작성된 댓글의 작성자 유저 조회
	 * @param replySeq
	 * @return UserInfoVO 대댓글이 작성된 댓글의 작성자 유저
	 */
    public UserInfoVO getReplyUser(Integer replySeq);
	
}