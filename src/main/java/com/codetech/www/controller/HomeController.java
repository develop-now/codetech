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

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private OwnerService ownerService;
	
    @RequestMapping(value = "/home")
    public ModelAndView home(ModelAndView mv) {
    	List<Store> stores = ownerService.getStoreForMain();
    	mv.setViewName("home");
		mv.addObject("stores", stores);
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
