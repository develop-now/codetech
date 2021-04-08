package com.codetech.www.service;

import java.util.List;


public interface UsersService {
	public int getSearchListCount(int index, int state, String search_word);
	public int getNoticeListCount();

	int isEmail(String user_email);

	int isName(String user_name);

}
