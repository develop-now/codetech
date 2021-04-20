package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.Store;
import com.codetech.www.domain.StoreMap;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;


public interface OwnerService {
	
	//Stores for HomePage 
	public List<Store> getStoreForMain();

	public List<Store> getStoreForReviewList(int page, int limit);

	public List<Store> getStoreForSearchList(int page, int limit, String searchWord);

	public List<UserInfo> getAdminList();

	public List<Store> getStoreForMainList(int page, int limit);

	public int getListCount();
	
	public int getListCountforMainList();

	public int getListCountforSearchList(String searchWord);

	public StoreMap getMap(String searchWord);

	public List<User> getAdmin(int user_id);

	public List<UserInfo> getAdminInfo(int user_id);

	public Store getStore(int store_id);

	public UserPlusInfo getOwnerInfo(int user_id);

	public List<Store> getStoreName();

	public List<UserInfo> getUserName();





}
