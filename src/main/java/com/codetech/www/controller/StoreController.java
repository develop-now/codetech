package com.codetech.www.controller;

import com.codetech.www.service.StoreService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/store")
public class StoreController {
    private static final Logger logger = LoggerFactory.getLogger(StoreController.class);

    @Autowired
    private StoreService storeService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "store/index";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createStore() {
        return "store/store-create";
    }
}
