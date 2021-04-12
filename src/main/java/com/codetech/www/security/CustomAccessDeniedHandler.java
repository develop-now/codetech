package com.codetech.www.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
    private static final Logger logger = LoggerFactory.getLogger(CustomAccessDeniedHandler.class);

    @Override
    public void handle(HttpServletRequest req, HttpServletResponse res, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        logger.error("Access Denied Handler");
        String url = "/WEB-INF/views/error/error.jsp";

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);

        req.setAttribute("error_code", "403");
        req.setAttribute("error_msg", "접근 권한이 없는 사용자 입니다");

        dispatcher.forward(req, res);
    }
}
