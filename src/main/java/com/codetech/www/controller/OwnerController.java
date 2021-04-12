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
import com.codetech.www.domain.StoreMap;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
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
		int limit = 4; // 한 화면에 출력할 가게 수
		int listCount = ownerService.getListCount();
		List<Store> stores = ownerService.getStoreForMainList(page, limit);

		if (listCount > stores.size()) {
			mv.addObject("more", 1);
		}
		mv.setViewName("owner/mainList");
		mv.addObject("stores", stores);
		mv.addObject("limit", limit);
		mv.addObject("listCount", listCount);
		return mv;
	}

	// Sort of like
	@RequestMapping(value = "/mainListAjax")
	public ModelAndView mainListAjax(ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		int limit = 4; // 한 화면에 출력할 가게 수
		int listCount = ownerService.getListCount() - limit;
		List<Store> stores = ownerService.getStoreForMainList(page, limit);

		if (listCount > stores.size()) {
			mv.addObject("more", 1);
		}
		mv.setViewName("owner/mainListAjax");
		mv.addObject("stores", stores);
		mv.addObject("limit", limit);
		mv.addObject("listCount", listCount);
		return mv;
	}

	// Sort of distance
	@RequestMapping(value = "/mapPage")
	public String mapPage() {
		return "owner/mapPage";
	}

	@RequestMapping(value = "/searchListMap")
	public ModelAndView searchListMap(ModelAndView mv, String searchWord) {

		StoreMap storeMap = ownerService.getMap(searchWord);
		mv.addObject("storeMap", storeMap);
		mv.setViewName("owner/mapPageSearch");
		return mv;
	}

	// Sort of review
	@RequestMapping(value = "/reviewListPage")
	public ModelAndView reviewListPage(ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {

		int limit = 4;
		int listCount = ownerService.getListCount();

		List<Store> stores = ownerService.getStoreForReviewList(page, limit);

		if (listCount > stores.size()) {
			mv.addObject("more", 1);
		}
		mv.setViewName("owner/reviewList");

		mv.addObject("limit", limit);
		mv.addObject("listCount", listCount);
		mv.addObject("stores", stores);
		return mv;
	}

	@RequestMapping(value = "/reviewListPageAjax")
	public ModelAndView reviewListPageAjax(ModelAndView mv,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		int limit = 4;
		int listCount = ownerService.getListCount() - limit;
		List<Store> stores = ownerService.getStoreForReviewList(page, limit);

		if (listCount > stores.size()) {
			mv.addObject("more", 1);
		}
		mv.setViewName("owner/reviewListAjax");
		mv.addObject("stores", stores);
		mv.addObject("limit", limit);
		mv.addObject("listCount", listCount);
		return mv;
	}

	// Search
	@RequestMapping(value = "/searchList")
	public ModelAndView searchList(ModelAndView mv, String searchWord,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		int limit = 4;
		int listCount = ownerService.getListCountforSearchList(searchWord);
		List<Store> stores = ownerService.getStoreForSearchList(page, limit, searchWord);

		if (listCount > stores.size()) {
			mv.addObject("more", 1);
		}

		mv.setViewName("owner/searchList");
		mv.addObject("stores", stores);
		mv.addObject("limit", limit);
		mv.addObject("listCount", listCount);
		mv.addObject("searchWord", searchWord);
		logger.info(searchWord);
		return mv;
	}

	@RequestMapping(value = "/searchListAjax")
	public ModelAndView searchListAjax(ModelAndView mv, String searchWord,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		int limit = 4;
		int listCount = ownerService.getListCountforSearchList(searchWord) - limit;
		List<Store> stores = ownerService.getStoreForSearchList(page, limit, searchWord);

		if (listCount > stores.size()) {
			mv.addObject("more", 1);
		}

		mv.setViewName("owner/searchListAjax");
		mv.addObject("stores", stores);
		mv.addObject("limit", limit);
		mv.addObject("listCount", listCount);
		return mv;
	}

	// Management
	@RequestMapping(value = "/manage")
	public ModelAndView managerView(ModelAndView mv) {
		List<UserInfo> userInfo = ownerService.getAdminList();
		mv.setViewName("owner/managerList");
		mv.addObject("userInfo", userInfo);
		return mv;

	}
	
	// Management
	@RequestMapping(value = "/managerDetail")
	public ModelAndView managerView(ModelAndView mv, int user_id) {
		List<User> user = ownerService.getAdmin(user_id);
		List<UserInfo> userInfo = ownerService.getAdminInfo(user_id);
		mv.setViewName("owner/managerDetail");
		mv.addObject("userInfo", userInfo);
		mv.addObject("user", user);
		return mv;

	}

}
