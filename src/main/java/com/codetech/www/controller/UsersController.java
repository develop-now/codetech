package com.codetech.www.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codetech.www.service.UsersService;

@Controller
@RequestMapping(value = "/user")
public class UsersController {
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    private UsersService usersService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "user/index";
    }

    @RequestMapping(value = "/emailcheck", method = RequestMethod.GET)
    public void emailcheck(String user_email, HttpServletResponse response) throws IOException {
        int result = usersService.isEmail(user_email);
        response.setContentType("text/html;charset=utf-8");
        logger.info("emailcheck 도착" + result);
        PrintWriter out = response.getWriter();
        out.println(result);
    }


    @RequestMapping(value = "/nickcheck", method = RequestMethod.GET)
    public void nickcheck(String user_name, HttpServletResponse response) throws IOException {
        int result = usersService.isName(user_name);
        response.setContentType("text/html;charset=utf-8");
        logger.info("emailcheck 도착" + result);
        PrintWriter out = response.getWriter();
        out.println(result);
    }
}

