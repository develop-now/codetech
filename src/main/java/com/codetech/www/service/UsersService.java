package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Report;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;


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


}
