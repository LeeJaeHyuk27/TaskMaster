package com.mysite.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysite.login.service.LoginService;
import com.mysite.alarm.service.AlarmService;
import com.mysite.alarm.vo.AlarmVO;
import com.mysite.common.vo.MessageVO;
import com.mysite.login.vo.UserInfoVO;
import com.mysite.util.AesUtil;
import com.mysite.util.TempKey;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;
	
	@Autowired
	AlarmService alarmService;
	
	@RequestMapping("/login")
	public String login()throws Exception{
		return "/login";
	}
	
	// 로그인
	@RequestMapping("/loginProcess")
	@ResponseBody
	public MessageVO loginProcess(@ModelAttribute UserInfoVO vo, HttpServletRequest request) throws Exception{
		
		MessageVO msgvo = new MessageVO();
		String pwd = AesUtil.aesEncode(vo.getPassword());
		vo = loginService.selectUserInfo(vo);
		
		if(vo!=null) {	//등록 아이디일 경우
			
			if(vo.getPassword().equals(pwd)) {  //동일한 패스워드일 경우.
				//세션저장
				HttpSession session = request.getSession();
				session.setAttribute("TaskMaster", vo);
				if(vo.getAuthYn().equals("Y")) {
					msgvo.setResult(true);
				}else {
					msgvo.setResult(false);
					msgvo.setMsg("로그인 권한이 없습니다.");
				}
			}else {	//패스워드가 동일하지 않을 경우
				msgvo.setResult(false);
				msgvo.setMsg("패스워드가 일치하지 않습니다.");
			}
		}else {  //등록 아이디가 아닐경우
			msgvo.setResult(false);
			msgvo.setMsg("미등록 회원아이디 입니다.");
		}
		return msgvo;
	}
	
	// 회원가입
	@RequestMapping("/joinProcess")
	@ResponseBody
	public MessageVO joinProcess(@ModelAttribute UserInfoVO vo)throws Exception{
		
		MessageVO msgvo = new MessageVO();
		AlarmVO alarmvo = new AlarmVO();
		UserInfoVO vo_for_emailCheck = new UserInfoVO();
		vo.setPassword(AesUtil.aesEncode(vo.getPassword()));
		vo_for_emailCheck.setUserId(vo.getUserId());
		vo_for_emailCheck = loginService.selectUserInfo(vo_for_emailCheck);
		
		if(vo_for_emailCheck!=null) {	// 등록 이메일일 경우
			msgvo.setResult(false);
			msgvo.setMsg("이미 가입된 이메일 입니다.");
		}else {  // 등록 이메일이 아닐경우
			// 인증키 생성
			String key = new TempKey().getKey(10, false);
			vo.setAuthKey(key);

			// 알람세팅
			alarmvo.setAlarmType("A");
			alarmvo.setCreateUserId(vo.getUserId()+vo.getEmail());
			alarmvo.setCompanyCd(vo.getCompanyCd());
			
			loginService.insertUserInfo(vo);
			alarmService.createAlarm(alarmvo);
			msgvo.setResult(true);
			msgvo.setMsg("회원가입 신청이 완료되었습니다 담당자가 승인하면 메일이 발송됩니다.");
		}
		return msgvo;
	}

}
