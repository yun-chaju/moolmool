package com.wappl.moolmool.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.wappl.moolmool.member.vo.MemberVO;

public class AuthorizationCheckAdminInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception e)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mav)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		HttpSession session = request.getSession(false);

		if(session != null) {
			MemberVO loginMember = (MemberVO)session.getAttribute("loginUser");
			
			if(loginMember != null && loginMember.getRoleCode().equals("ROLE_ADMIN")) {
				return true;
			}
			
		}
		response.sendRedirect(request.getContextPath() + "/");
		return false;
	}
	
}
