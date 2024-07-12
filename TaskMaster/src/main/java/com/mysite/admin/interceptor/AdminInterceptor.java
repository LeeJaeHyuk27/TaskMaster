package com.mysite.admin.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.mysite.login.vo.UserInfoVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AdminInterceptor implements HandlerInterceptor{

	// 관리자 페이지에 접속하기 전 인터셉터로 접속을 가로채고 검사 후 페이지 접속을 허용
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false); // 세션이 없을 경우 null로 반환

        if (session == null || session.getAttribute("TaskMaster") == null) {
            response.sendRedirect("/login");
            return false; //세션이 null이거나 "TaskMaster"속성이 아닐 경우 /login 페이지로 돌아가고 false 반환
        }

        // "TaskMaster"속성을 가진 세션값을 user라는 vo에 넣어줌
        UserInfoVO user = (UserInfoVO) session.getAttribute("TaskMaster"); 

        if(!"Y".equals(user.getCompAdminYn())) { // vo값 중 관리자 권한을 확인하고 "Y"가 아닌 경우
            response.setContentType("text/html;charset=UTF-8"); // 권한이 없다는 알림 후 다시 로그인 창으로 돌아감
            response.getWriter().write("<script>alert('권한이 없습니다.'); location.href='/login';</script>");
            return false;
        }else { // 관리자 권한이 "Y"인 경우
        	return true;
        }
    }
}
