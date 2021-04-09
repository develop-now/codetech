package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;

public interface AdminService {
	public List<User> getUsersSearchList(int index, int state, String search_word, int page, int limit);
	public List<UserInfo> getInfoSearchList(int index, int state, String search_word, int page, int limit);
	
	public int getSearchListCount(int index, int state, String search_word);
	
	public int getNoticeListCount();
}
