package com.codetech.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "home";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String user() {
        return "user/index";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin() {
        return "admin/index";
    }

    @RequestMapping(value = "/store", method = RequestMethod.GET)
    public String store() {
        return "store/index";
    }

    @RequestMapping(value = "/owner", method = RequestMethod.GET)
    public String owner() {
        return "owner/index";
    }

}
