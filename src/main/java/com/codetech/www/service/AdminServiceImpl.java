package com.codetech.www.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codetech.www.dao.AdminDAO;
import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.StoreInfoList;
import com.codetech.www.domain.UserPlusInfo;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO dao;
	private Object[] check_state;
	
	@Override
	public List<UserPlusInfo> getUsersSearchList(int index, int state, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (index != -1 && state != -1) {
			String[] search_field = new String[] { "user_email", "user_name", "user_tel" };
			String[] check_state = new String[] { "0", "1", "2", "3" };
			
			map.put("search_field", search_field[index]);
			map.put("check_state", check_state[state]);
			map.put("search_word", "%" + search_word + "%");
		}
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getUsersSearchList(map);
	}
	

    @Override
    public int getSearchListCount(int index, int state, String search_word) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	if (index != -1 && state != -1) {
			String[] search_field = new String[] { "user_email", "user_name", "user_tel" };
			String[] check_state = new String[] { "0", "1", "2", "3" };
			
			map.put("search_field", search_field[index]);
			map.put("check_state", check_state[state]);
			map.put("search_word", "%" + search_word + "%");
		}
    	
    	return dao.getSearchListCount(map);
    }

    @Override
    public int user_susp(String user_id) {
    	return dao.user_susp(user_id);
    }

	@Override
	public int user_reac(String user_id) {
		return dao.user_reac(user_id);
	}


	@Override
	public int user_banned(String user_id) {
		return dao.user_banned(user_id);
	}


	@Override
	public int user_inac(String user_id) {
		return dao.user_inac(user_id);
	}
	
	@Override
	public int getNoticeListCount() {
		return dao.getNoticeListCount();
	}


	@Override
	public int getPartnerSearchListCount(int index, int state, String search_word) {
		Map<String, Object> map = new HashMap<String, Object>();
    	
    	if (index != -1 && state != -1) {
			String[] search_field = new String[] { "store_name", "user_name", "store_tel" };
			String[] check_state = new String[] { "0", "1", "2", "3" };
			
			map.put("search_field", search_field[index]);
			map.put("check_state", check_state[state]);
			map.put("search_word", "%" + search_word + "%");
		}
    	
    	return dao.getPartnerSearchListCount(map);
    }


	@Override
	public List<StoreInfoList> getPartnerSearchList(int index, int state, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (index != -1 && state != -1) {
			String[] search_field = new String[] { "store_name", "user_name", "store_tel" };
			String[] check_state = new String[] { "0", "1", "2", "3" };
			
			map.put("search_field", search_field[index]);
			map.put("check_state", check_state[state]);
			map.put("search_word", "%" + search_word + "%");
		}
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getPartnerSearchList(map);
	}
	
	@Override
	public List<Menu> getStoreMenuList(String store_id) {
		return dao.getStoreMenuList(store_id);
	}
	
	@Override
	public int store_termi(String store_id) {
		return dao.store_termi(store_id);
	}


	@Override
	public int store_susp(String store_id) {
		return dao.store_susp(store_id);
	}


	@Override
	public int store_act(String store_id) {
		return dao.store_act(store_id);
	}


}
