package com.codetech.www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.codetech.www.domain.Store;
import com.codetech.www.service.OwnerService;

@Controller
@RequestMapping(value = "/owner")
public class OwnerController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


    //Sort of like
    @RequestMapping(value = "/mainList")
    public String mainList() {
        return "owner/mainList";
    }

    //Sort of distance
    @RequestMapping(value = "/mapPage")
    public String mapPage() {
        return "owner/mapPage";
    }

    //Sort of review
    @RequestMapping(value = "/reviewListPage")
    public String reviewListPage() {
        return "owner/reviewList";
    }
}
