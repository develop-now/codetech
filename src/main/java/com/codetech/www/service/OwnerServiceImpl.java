package com.codetech.www.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codetech.www.dao.StoreDAO;
import com.codetech.www.dao.UsersDAO;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.StoreMap;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;

@Service
public class OwnerServiceImpl implements OwnerService {
	private static final Logger logger = LoggerFactory.getLogger(OwnerServiceImpl.class);

	@Autowired
	private StoreDAO dao;
	
	@Autowired 
	private UsersDAO udao;

	@Override
	public List<Store> getStoreForMain() {
		return dao.getStoreForMain();
	}

	@Override
	public List<Store> getStoreForReviewList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getStoreForReviewList(map);
	}

	@Override
	public List<Store> getStoreForSearchList(int page, int limit, String searchWord) {
		String searchWordLike = "%" + searchWord + "%";
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("searchWord", searchWordLike);
		return dao.getStoreForSearchList(map);

	}

	@Override
	public List<UserInfo> getAdminList() {
		return udao.getAdminList();
	}

	@Override
	public List<Store> getStoreForMainList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getStoreForMainList(map);
	}

	@Override
	public int getListCount() {
		return dao.getListCount();

	}

	@Override
	public int getListCountforMainList() {
		return dao.getListCountforMainList();

	}

	@Override
	public int getListCountforSearchList(String searchWord) {
		String searchWordLike = "%" + searchWord + "%";
		return dao.getListCountforSearchList(searchWordLike);
	}

	@Override
	public StoreMap getMap(String searchWord) {
		String searchWordLike = "%" + searchWord + "%";
		return dao.getMap(searchWordLike);
	}


	@Override
	public List<User> getAdmin(int user_id) {
		return udao.getAdmin(user_id);

	}

	@Override
	public List<UserInfo> getAdminInfo(int user_id) {
		return udao.getAdminInfo(user_id);
	}

	@Override
	public Store getStore(int store_id) {
		return dao.getStore(store_id);
	}

	@Override
	public UserPlusInfo getOwnerInfo(int user_id) {
		return udao.user_total_info(user_id);
	}

	@Override
	public List<Store> getStoreName() {
		return dao.getStoreName();

	}

	@Override
	public List<UserInfo> getUserName() {
		return udao.getUserName();

	}





}
