package com.codetech.www.controller;


import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.codetech.www.domain.User;
import com.codetech.www.service.UsersService;

@Controller
@RequestMapping(value="/user")
public class UsersController {
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired

	private UsersService userService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "user/index";
	}
	
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String userList() {
		return "user/user-list";
	}
	
//	 @RequestMapping(value = "/userList")
//	public ModelAndView userList(
//			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
//			@RequestParam(value = "limit", defaultValue = "5", required = false) int limit, ModelAndView mv,
//			@RequestParam(value = "search_field", defaultValue = "-1") int index,
//			@RequestParam(value = "search_word", defaultValue = "") String search_word,
//			@RequestParam(value = "check_state", defaultValue = "1") int state) {
//		
//		List<Users>	list = null;
//		
//		int listcount = 0;
//		
//		list = userService.getSearchList(index, state, search_word, page, limit);
//		listcount = userService.getSearchListCount(index, state, search_word);
//		
//		// 총 페이지 수
//		int maxpage = (listcount + limit - 1) / limit;
//		
//		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
//		int startpage = ((page - 1) / 10) * 10 + 1;
//
//		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
//		int endpage = startpage + 10 - 1;
//
//		if (endpage > maxpage)
//			endpage = maxpage;
//
//		mv.setViewName("user/user_list");
//
//		mv.addObject("page", page); // 현재 페이지 수
//		mv.addObject("maxpage", maxpage); // 최대 페이지 수
//
//		// 현재 페이지에 표시할 첫 페이지 수
//		mv.addObject("startpage", startpage);
//
//		// 현재 페이지에 표시할 끝 페이지 수
//		mv.addObject("endpage", endpage);
//
//		mv.addObject("listcount", listcount); // 총 글의 수
//		mv.addObject("memberlist", list);
//
//		// 해당 페이지의 글 목록을 갖고 있는 리스트
//		mv.addObject("search_field", index);
//		mv.addObject("search_word", search_word);
//		
//		return mv;
//	}
  
//	@RequestMapping(value="/emailcheck",method = RequestMethod.GET) 
//  public void emailcheck(String user_email,HttpServletResponse response) throws IOException {
//		  int result = usersService.isEmail(user_email);
//	  response.setContentType("text/html;charset=utf-8");
//	  logger.info("emailcheck 도착"+ result); PrintWriter out = response.getWriter();
//	  out.println(result); }
//	 
//	
//	@RequestMapping(value="/nickcheck",method = RequestMethod.GET)
//	public void nickcheck(String user_name,HttpServletResponse response) throws IOException {
//		  int result = usersService.isName(user_name);
//	  response.setContentType("text/html;charset=utf-8");
//	  logger.info("emailcheck 도착"+ result); 
//	  PrintWriter out = response.getWriter();
//	  out.println(result); 
//	}

}

