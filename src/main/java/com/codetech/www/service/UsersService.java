package com.codetech.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.codetech.www.domain.*;

public interface UsersService {
    int isEmail(String user_email);

    int isName(String user_name);

    int userinsert(User user, UserInfo info);

    int isUser(String user_email, String user_password);

    UserPlusInfo user_info(int user_id);

    User getUserId(String user_email);

    int passcheck(int user_id, String user_newpassword, String user_password);

    Store getStore(int store_id);

    int getStoreLike(int store_id);

    List<Menu> getTopMenu(int store_id);

    List<Menu> getAllMenu(int store_id);

    int modifyInfo(UserInfo ui);

    int addReport(Report report);

    int getMenuCount(int store_id);

    List<Order> getOrder(int user_id, int page, int limit);

    List<Store> getStoreForOrder(int user_id, int page, int limit);

    List<OrderDetail> getOrderDetail(int user_id, int page, int limit);

    List<Menu> getMenuForOrder(int user_id, int page, int limit);

    int getListCount(int user_id);

	List<Store> getStoreFavorite(int user_id);

	int favoriteCancel(int user_id, int store_id);

	int cartRegister(int user_id, int m_numA, int m_num);

	List<Cart> getCart(int user_id);

	List<Menu> getMenuForCart(int user_id);

	List<Store> getStoreForCart(int user_id);

	Integer getAmount(int user_id);

	Integer getTotalPrice(int user_id);

	int cartDel(int cart_id);

	public Store getStore(String reported);

	public int reportStore(String subject, String content, int user_id, int store_id);

	public UserInfo getUser(String reported);

	public int reportUser(String subject, String content, int user_id, int user_id2);

	User getUser(int user_id);

	List<Point> getPointList(int user_id, int page,int limit);

	int pointListCount(int user_id);

	int getPointValue(int order_id);

	int checkStoreLikeAsUser(Integer user_id, int store_id);

	int favoriteAdd(int user_id, int store_id);

	int likesCount(int user_id);

	List<Report> reportStoreAndUserList(int user_id, int page, int limit);

	int getReportListCount(int user_id);

}
