package com.codetech.www.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Service
public class CustomLoginFailHandler implements AuthenticationFailureHandler {
    private static final Logger logger = LoggerFactory.getLogger(CustomLoginFailHandler.class);

    @Override
    public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res, AuthenticationException exception) throws IOException, ServletException {
        logger.error("Login Failed Handler");

        HttpSession session = req.getSession();
        session.setAttribute("loginFailMsg", "아이디 또는 비밀번호 오류 입니다");
        String url = req.getContextPath() + "/home";
        res.sendRedirect(url);
    }
}
