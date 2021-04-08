package com.codetech.www.service;

import java.util.List;

public interface UsersService {
//	public List<Users> getSearchList(int index, int state, String search_word, int page, int limit);
	public int getSearchListCount(int index, int state, String search_word);
	public int getNoticeListCount();
}
