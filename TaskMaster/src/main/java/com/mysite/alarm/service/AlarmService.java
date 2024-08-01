package com.mysite.alarm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mysite.alarm.vo.AlarmVO;

@Service
public interface AlarmService {
    
    String createAlarm(AlarmVO vo) throws Exception;

    List<AlarmVO> getAlarm(String userId);
    
    int updateReadYn(int alarmSeq) throws Exception;
}
