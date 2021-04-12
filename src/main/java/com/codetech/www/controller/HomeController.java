package com.codetech.www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.codetech.www.domain.Store;
import com.codetech.www.service.OwnerService;

import javax.servlet.http.HttpSession;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private OwnerService ownerService;

    @RequestMapping(value = "/home")

    public ModelAndView home(ModelAndView mv, HttpSession session) {
        List<Store> stores = ownerService.getStoreForMain();
        List<Integer> likes = ownerService.getStoreLikes();
        List<Integer> comments = ownerService.getStoreComments();
        mv.setViewName("home");
        mv.addObject("stores", stores);
        mv.addObject("likes", likes);
        mv.addObject("comments", comments);

        //		login Fail Message Handling
        if (session.getAttribute("loginFailMsg") != null) {
            mv.addObject("alert", session.getAttribute("loginFailMsg"));
            session.removeAttribute("loginFailMsg");
        }

        //		login Success Message Handling
        if (session.getAttribute("greetingMsg") != null) {
            mv.addObject("info", session.getAttribute("greetingMsg"));
            session.removeAttribute("greetingMsg");
        }

        return mv;
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
