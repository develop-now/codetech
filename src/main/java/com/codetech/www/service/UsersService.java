package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.*;

public interface UsersService {
    int isEmail(String user_email);

    int isName(String user_name);

    int userinsert(User user, UserInfo info);

	int isUser(String user_email, String user_password);

	UserPlusInfo user_info(int user_id);

	User getUserId(String user_email);

	int passcheck(int user_id, String user_newpassword,String user_password);

	Store getStore(int store_id);

	int getStoreLike(int store_id);

	List<Menu> getTopMenu(int store_id);

	List<Menu> getAllMenu(int store_id);
	
	int modifyInfo(UserInfo ui);


	List<Report> reportStoreAndComment(int user_id);

	int addReport(Report report);

	int getMenuCount(int store_id);

	List<Order> getOrder(int user_id, int page, int limit);

	List<Store> getStoreForOrder(int user_id, int page, int limit);

	List<OrderDetail> getOrderDetail(int user_id, int page, int limit);

	List<Menu> getMenuForOrder(int user_id, int page, int limit);

	int getListCount(int user_id);


}
