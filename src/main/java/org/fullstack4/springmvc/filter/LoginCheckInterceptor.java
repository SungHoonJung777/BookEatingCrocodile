package org.fullstack4.springmvc.filter;

import lombok.extern.log4j.Log4j2;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Log4j2
public class LoginCheckInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("member_id") == null) {
            log.info("미인증 사용자 요청");
            //로그인으로 redirect
            response.sendRedirect("/login/login");
            return false;
        } else {
            if (session.getAttribute("member_type").equals("a")) {
                response.sendRedirect("/admin/main");
            } else if(session.getAttribute("member_type").equals("b")) {
                response.sendRedirect("/");
            } else if(session.getAttribute("member_type").equals("c")){
                response.sendRedirect("/delivery/main");
            }
        }
        return true;
    }
}