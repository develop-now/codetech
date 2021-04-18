package com.codetech.www.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Local;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codetech.www.domain.Store;
import com.codetech.www.domain.StoreMap;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;
import com.codetech.www.service.OwnerService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping(value = "/owner")
public class OwnerController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private OwnerService ownerService;

	private IamportClient api;

	public OwnerController() {
		// REST API 키와 REST API secret을 입력
		this.api = new IamportClient("6673213502446208",
				"j5bX7kHM0u9fFwQFJh8pudgn1CAPWAEfFPcN9TzanJq2ggI0xQp24Fp5i0VeAAtgqF4AzEKXna0EqIFY");

	}

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

	// chat for store
	@RequestMapping(value = "/chatS")
	public ModelAndView chat1(Store store, HttpServletRequest request, HttpSession session, ModelAndView mv)
			throws Exception {

		// int store_id = (Integer)session.getAttribute("store_id");
		Store storeInfo = ownerService.getStore(1);
		mv.addObject("store", storeInfo); // Store_id, Store_name, Store_saved_image

		// ip로 접근하는 경우와 localhost로 접근하는 경우 모두 적용하기 위해 접근할 url을 구합니다.
		String requestURL = request.getRequestURL().toString();
		// http://localhost:8088/mychat/logoiProecess
		// url = //localhost:8088/www/owner
		int start = requestURL.indexOf("//");
		int end = requestURL.lastIndexOf("/o");
		String url = requestURL.substring(start, end);
		mv.addObject("url", url);
		logger.info("url = " + url);
		mv.setViewName("owner/chattingS");
		return mv;

	}

	// chat for owner
	@RequestMapping(value = "/chatM")
	public ModelAndView chat(HttpServletRequest request, HttpSession session, ModelAndView mv) throws Exception {
		int user_id = (Integer) session.getAttribute("user_id");
		UserPlusInfo adminInfo = ownerService.getOwnerInfo(user_id);
		mv.addObject("admin", adminInfo); // user_name, user_profile

		// ip로 접근하는 경우와 localhost로 접근하는 경우 모두 적용하기 위해 접근할 url을 구합니다.
		String requestURL = request.getRequestURL().toString();
		// http://localhost:8088/mychat/logoiProecess
		int start = requestURL.indexOf("//");
		int end = requestURL.lastIndexOf("/o");
		String url = requestURL.substring(start, end);
		mv.addObject("url", url);
		mv.setViewName("owner/chattingM");
		return mv;

	}

	@RequestMapping(value = "/payment")
	public String payment() {
		return "payment";
	}
	
	@ResponseBody
	@RequestMapping(value = "/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImplUid(
			Model model, Local locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{
		return api.paymentByImpUid(imp_uid);
	}
	
	@RequestMapping(value = "/payment_complete")
	public String payment_complete() {
		return "payment_complete";
	}

}
