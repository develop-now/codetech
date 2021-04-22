package com.codetech.www.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.MiniCart;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.StoreMap;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;
import com.codetech.www.service.OwnerService;
import com.codetech.www.service.StoreService;
import com.codetech.www.service.UsersService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
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

	@Autowired
	private UsersService usersService;

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
		logger.info("search 도착");
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

	// pay
	@RequestMapping(value = "/pay")
	public ModelAndView pay(@RequestParam(value = "p_num") int[] p_num, @RequestParam(value = "p_price") int[] p_price,
			@RequestParam(value = "o_menu") String[] o_menu, @RequestParam(value = "p_numA") int[] p_numA,
			@RequestParam(value = "p_priceA") int[] p_priceA, @RequestParam(value = "o_menuA") String[] o_menuA,
			@RequestParam(value = "m_num") int[] m_num, @RequestParam(value = "m_numA") int[] m_numA, int user_id,
			int store_id, String totalPrice, int amount, ModelAndView mv) {

		List<MiniCart> list = new ArrayList<MiniCart>();

		if (totalPrice.equals("")) {
			mv.setViewName("user/orderMain?store_id=" + store_id);
		}

		for (int i = 0; i < p_num.length; i++) {
			if (p_num[i] > 0) {
				MiniCart cart = new MiniCart();
				cart.setMenuName(o_menu[i]);
				cart.setOrderAmount(p_num[i]);
				cart.setMenu_id(m_num[i]);
				cart.setMenu_price(p_price[i]);
				list.add(cart);
			}

		}

		for (int i = 0; i < p_numA.length; i++) {
			if (p_numA[i] > 0) {
				MiniCart cart = new MiniCart();
				cart.setMenuName(o_menuA[i]);
				cart.setOrderAmount(p_numA[i]);
				cart.setMenu_id(m_numA[i]);
				cart.setMenu_price(p_priceA[i]);
				list.add(cart);
			}
		}

		UserPlusInfo user = ownerService.getOwnerInfo(user_id);
		String newtotalPrice = totalPrice.replace("%2C", "").replace(",", "");
		mv.addObject("amount", amount);
		mv.addObject("list", list);
		mv.addObject("newtotalPrice", newtotalPrice);
		mv.addObject("user", user);
		mv.addObject("cartCount", list.size());
		mv.setViewName("owner/payment");
		return mv;
	}

	@RequestMapping(value = "/payCart")
	public ModelAndView payCart(@RequestParam(value = "p_num") int[] p_num, @RequestParam(value = "m_num") int[] m_num,
			@RequestParam(value = "p_price") int[] p_price, @RequestParam(value = "o_menu") String[] o_menu,
			@RequestParam(value = "cart_id") int[] cart_id, int user_id, String totalPrice, int amount,
			@RequestParam(value = "cartTh", defaultValue = "0", required = false) int cartTh, ModelAndView mv) {

		List<MiniCart> list = new ArrayList<MiniCart>();

		if (totalPrice.equals("")) {
			mv.setViewName("owner/mainList");
		}

		for (int i = 0; i < p_num.length; i++) {
			MiniCart cart = new MiniCart();
			cart.setMenuName(o_menu[i]);
			cart.setOrderAmount(p_num[i]);
			cart.setMenu_price(p_price[i]);
			cart.setMenu_id(m_num[i]);
			list.add(cart);
		}

		UserPlusInfo user = ownerService.getOwnerInfo(user_id);
		String newtotalPrice = totalPrice.replace("%2C", "").replace(",", "");
		mv.addObject("amount", amount);
		mv.addObject("list", list);
		mv.addObject("newtotalPrice", newtotalPrice);
		mv.addObject("user", user);
		mv.addObject("cartCount", list.size());
		mv.addObject("cartTh", cartTh);
		mv.setViewName("owner/payment");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImplUid(Model model, Local locale, HttpSession session,
			@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		return api.paymentByImpUid(imp_uid);
	}

	@RequestMapping(value = "/payment_complete")
	public ModelAndView payment_complete(@RequestParam(value = "p_num") int[] p_num,
			@RequestParam(value = "o_menu") String[] o_menu, @RequestParam(value = "m_num") int[] m_num,
			@RequestParam(value = "p_price") int[] p_price, int user_id, int cartCount, int price, int amount,
			int cartTh, ModelAndView mv
			,@RequestParam(value="usedPoint", defaultValue="0", required = false)int point) {
		int cartStatus = 0;
		for (int i = 0; i < m_num.length; i++) {
			int result = ownerService.plusOrderCount(m_num[i]);
			logger.info("주문수 증가 완료");
			if (result != 1) {
				logger.info("에러");
			}
		}

		for (int i = 0; i < m_num.length; i++) {
			int store_id = ownerService.getStoreId(m_num[i]);
			int order = ownerService.order(price, user_id, store_id, m_num, p_price, p_num, point);
			if (cartTh == 1) {
				cartStatus = ownerService.delCartList(m_num[i]);
			}
			if (order == 1) {
				logger.info("order + detail 성공");
			}
		}

		mv.setViewName("user/orderView?user_id="+user_id);
		return mv;
	}

}
