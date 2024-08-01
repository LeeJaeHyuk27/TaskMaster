package com.mysite.alarm.contoller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysite.alarm.vo.AlarmVO;
import com.mysite.alarm.service.AlarmService;

@Controller
public class AlarmController {

    @Autowired
    AlarmService alarmService;

    @RequestMapping("/alarmTest")
    public String alarm() throws Exception {
        return "/alarmTest";
    }

    @RequestMapping(value = "/alarm_test", method = RequestMethod.POST)
    @ResponseBody
	public String alarm_test(AlarmVO vo) throws Exception {
        return alarmService.createAlarm(vo);
	}

    @RequestMapping(value = "/getAlarm_test", method = RequestMethod.POST)
    @ResponseBody
	public List<AlarmVO> alarm_test(@RequestParam("userId") String userId) throws Exception {
        return alarmService.getAlarm(userId);
	}
    
    @RequestMapping("/alarm/updateReadYn")
    @ResponseBody
    public int updateReadYn(@RequestParam("alarmSeq") int alarmSeq) throws Exception{
    	return alarmService.updateReadYn(alarmSeq);
    }
}
