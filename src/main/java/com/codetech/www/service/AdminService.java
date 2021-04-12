package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.UserPlusInfo;

public interface AdminService {
	public List<UserPlusInfo> getUsersSearchList(int index, int state, String search_word, int page, int limit);
	
	public int getSearchListCount(int index, int state, String search_word);
	
	public int getNoticeListCount();

	public int user_susp(String user_id);

	public int user_reac(String user_id);

	public int user_banned(String user_id);

	public int user_inac(String user_id);
}
