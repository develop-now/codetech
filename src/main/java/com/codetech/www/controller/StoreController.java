package com.codetech.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/store")
public class StoreController {
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "store/index";
    }
}
