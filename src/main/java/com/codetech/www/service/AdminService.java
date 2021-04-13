package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.UserPlusInfo;

public interface AdminService {
	public List<UserPlusInfo> getUsersSearchList(int index, int state, String search_word, int page, int limit);
	
	public int getSearchListCount(int index, int state, String search_word);
	
	public int getNoticeListCount();
}
