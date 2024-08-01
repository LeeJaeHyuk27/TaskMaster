package com.mysite.alarm.service;

import com.mysite.alarm.vo.AlarmVO;
import static com.mysite.alarm.vo.AlarmTypeEnum.*;

import java.util.List;

import com.mysite.alarm.dao.AlarmDao;
import com.mysite.login.service.LoginService;
import com.mysite.login.vo.UserInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlarmServiceImpl implements AlarmService {

    @Autowired
	LoginService UserService;

    @Autowired
	AlarmDao alarmDao;

    @Override
    public String createAlarm(AlarmVO vo) throws Exception {
        String alarm_type = vo.getAlarmType();

        /* 생성한 유저 정보 조회 */
        UserInfoVO user_vo = new UserInfoVO();
        user_vo.setUserId(vo.getCreateUserId());
        user_vo = UserService.selectUserInfo(user_vo);
        /* 생성한 유저 정보 조회 */

        String create_alarm_text = "";

        try {
            if (alarm_type.equals(COM_APPROVAL.getVal())) { 
                // 회사 승인
                create_alarm_text = user_vo.getUserName() + "님이 회사 승인을 요청하였습니다.";
                vo.setAlarmContents(create_alarm_text);

                // 회사 관리자 유저 리스트 조회
                List<UserInfoVO> company_user_vo_list = alarmDao.getCompanyAdminList(vo.getCompanyCd());
                
                for(UserInfoVO adminUser : company_user_vo_list){
                    vo.setUserId(adminUser.getUserId());
                    alarmDao.createAlarm(vo);
                }

            } else if (alarm_type.equals(PROJ_INVITATION.getVal())) { 
                // 프로젝트 초대
                int projectSeq = vo.getProjectSeq();
                String project_name = alarmDao.getProjectName(projectSeq);
                create_alarm_text = user_vo.getUserName() + "님이 '" + project_name + "' 프로젝트에 초대하였습니다.";
                vo.setAlarmContents(create_alarm_text);

                alarmDao.createAlarm(vo);

            } else if (alarm_type.equals(TASK_ALLOCATOIN.getVal())) { 
                // 업무 할당
                int taskSeq = vo.getTaskSeq();
                String task_name = alarmDao.getTaskName(taskSeq);
                create_alarm_text = user_vo.getUserName() + "님이 '" + task_name + "' 업무를 할당하였습니다.";
                vo.setAlarmContents(create_alarm_text);

                alarmDao.createAlarm(vo);

            } else if (alarm_type.equals(REPLY.getVal())) { 
                // 댓글
                int taskSeq = vo.getTaskSeq();
                String task_name = alarmDao.getTaskName(taskSeq);
                create_alarm_text = "'" + task_name + "' 업무에 " + user_vo.getUserName() + "님이 댓글을 작성하였습니다.";
                vo.setAlarmContents(create_alarm_text);

                // 댓글이 작성된 업무에 할당된 유저 리스트 조회
                List<UserInfoVO> task_allocation_user_vo_list = alarmDao.getTaskAllocationUserList(vo.getTaskSeq());

                for(UserInfoVO task_user : task_allocation_user_vo_list){
                    vo.setUserId(task_user.getUserId());
                    alarmDao.createAlarm(vo);
                }

            } else if (alarm_type.equals(RE_REPLY.getVal())) { 
                // 대댓글
                int taskSeq = vo.getTaskSeq();
                String task_name = alarmDao.getTaskName(taskSeq);
                create_alarm_text = "'" + task_name + "'업무에 " + user_vo.getUserName() + "님이 대댓글을 작성하였습니다.";
                vo.setAlarmContents(create_alarm_text);

                // 대댓글이 작성된 댓글의 작성자 유저 조회
                UserInfoVO reply_user_vo = alarmDao.getReplyUser(vo.getReplySeq());
                vo.setUserId(reply_user_vo.getUserId());
                alarmDao.createAlarm(vo);

            } else {
                throw new Exception("This is an unregistered alarm type.");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return e.getMessage();
        }

        String return_msg = "알람이 생성되었습니다. 알람 내용 : '" + create_alarm_text + "'";
        return return_msg;
    }

    @Override
    public List<AlarmVO> getAlarm(String userId) {
        return alarmDao.getAlarm(userId);
    }

	@Override
	public int updateReadYn(int alarmSeq) throws Exception {
		return alarmDao.updateReadYn(alarmSeq);
	}



}
