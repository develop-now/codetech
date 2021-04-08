package com.codetech.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.codetech.www.domain.Store;
import com.codetech.www.domain.User;
import com.codetech.www.service.OwnerService;

@Controller
@RequestMapping(value = "/owner")
public class OwnerController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private OwnerService ownerService;

	// Sort of like
	@RequestMapping(value = "/mainList")
	public ModelAndView mainList(ModelAndView mv, 
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		int limit = 4; //한 화면에 출력할 가게 수
		int listCount = ownerService.getListCount();
		List<Store> stores = ownerService.getStoreForMainList(page, limit);
		List<Integer> likes = ownerService.getStoreLikesForMainList();
		List<Integer> comments = ownerService.getStoreCommentsForMainList();
		
		if(listCount > stores.size()) {
			mv.addObject("more", 1);
		}
		mv.setViewName("owner/mainList");
		mv.addObject("stores", stores);
		mv.addObject("likes", likes);
		mv.addObject("comments", comments);
		mv.addObject("limit", limit);
		mv.addObject("listCount", listCount);
		return mv;
	}
	
	// Sort of like
		@RequestMapping(value = "/mainListAjax")
		public ModelAndView mainListAjax(ModelAndView mv, 
				@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
			int limit = 4; //한 화면에 출력할 가게 수
			int listCount = ownerService.getListCount() - limit;
			List<Store> stores = ownerService.getStoreForMainList(page, limit);
			List<Integer> likes = ownerService.getStoreLikesForMainList();
			List<Integer> comments = ownerService.getStoreCommentsForMainList();
			
			if(listCount > stores.size()) {
				mv.addObject("more", 1);
			}
			mv.setViewName("owner/mainListAjax");
			mv.addObject("stores", stores);
			mv.addObject("likes", likes);
			mv.addObject("comments", comments);
			mv.addObject("limit", limit);
			mv.addObject("listCount", listCount);
			return mv;
		}

	// Sort of distance
	@RequestMapping(value = "/mapPage")
	public String mapPage() {
		return "owner/mapPage";
	}

	// Sort of review
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

	// Search
	@RequestMapping(value = "/searchList")
	public ModelAndView searchList(ModelAndView mv, String searchWord) {
		List<Store> stores = ownerService.getStoreForSearchList(searchWord);
		List<Integer> likes = ownerService.getStoreLikesForSearchList(searchWord);
		List<Integer> comments = ownerService.getStoreCommentsForSearchList(searchWord);

		mv.setViewName("owner/reviewList");
		mv.addObject("likes", likes);
		mv.addObject("stores", stores);
		mv.addObject("comments", comments);
		return mv;
	}

	// Management
	@RequestMapping(value = "/manage")
	public ModelAndView managerView(ModelAndView mv, User user) {
		List<User> users = ownerService.getAdminList();

		mv.setViewName("owner/managerList");
		mv.addObject("users", users);
		return mv;

	}

}
