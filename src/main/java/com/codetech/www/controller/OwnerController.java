package com.codetech.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/owner")
public class OwnerController {

    //Sort of like
    @RequestMapping(value = "/mainList")
    public String mainList() {
    	//인기순으로 정렬하는 로직
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
