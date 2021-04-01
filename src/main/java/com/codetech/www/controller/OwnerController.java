package com.codetech.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/owner")
public class OwnerController {

    
    @RequestMapping(value = "/mainList", method = RequestMethod.GET)
    public String mainList() {
        return "owner/main_list";
    }
    
    
}
