package com.codetech.www.security;

import com.codetech.www.domain.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Service
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
    private static final Logger logger = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication authentication) throws IOException, ServletException {
        logger.info("Login Success Handler");

        HttpSession session = req.getSession();

        User user = sqlSession.selectOne("users.authIdCheck", authentication.getName());

        session.setAttribute("id", user.getUser_id());
        session.setAttribute("role", user.getAuth());

        session.setAttribute("greetingMsg", authentication.getName() + "님 환영합니다.");
        String url = req.getContextPath() + "/home";

        res.sendRedirect(url);
    }
}
