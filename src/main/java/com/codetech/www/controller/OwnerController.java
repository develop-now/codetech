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

	@Autowired
	private OwnerService ownerService;
	
    //Sort of like
    @RequestMapping(value = "/mainList")
    public ModelAndView mainList(ModelAndView mv) {
    	List<Store> stores = ownerService.getStoreForMain();
    	List<Integer> likes = ownerService.getStoreLikes();
    	List<Integer> comments = ownerService.getStoreComments();
    	mv.setViewName("owner/mainList");
		mv.addObject("stores", stores);
		mv.addObject("likes", likes);
		mv.addObject("comments", comments);
        return mv;
    }
    

    
    //Sort of distance
    @RequestMapping(value = "/mapPage")
    public String mapPage() {
        return "owner/mapPage";
    }
    
    //Sort of review
    @RequestMapping(value = "/reviewListPage")
    public ModelAndView reviewListPage(ModelAndView mv) {
    	List<Store> stores = ownerService.getStoreForReviewList();
    	List<Integer> comments = ownerService.getStoreCommentsReview();
    	List<Integer> likes = ownerService.getStoreLikesReview();
    	mv.setViewName("owner/reviewList");
		mv.addObject("stores", stores);
		mv.addObject("likes", likes);
		mv.addObject("comments", comments);
		return mv;
    }
    
    
    
}
