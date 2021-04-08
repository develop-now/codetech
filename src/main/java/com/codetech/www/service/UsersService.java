package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;


public interface UsersService {
	public int getSearchListCount(int index, int state, String search_word);
	public int getNoticeListCount();

	int isEmail(String user_email);

	int isName(String user_name);
	public int insert(User user, UserInfo info);

}
