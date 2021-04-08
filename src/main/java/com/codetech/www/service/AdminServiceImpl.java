package com.codetech.www.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codetech.www.dao.AdminDAO;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO dao;
	
	@Override
	public List<User> getUsersSearchList(int index, int state, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (index != -1) {
			String[] search_field = new String[] { "user_email", "user_name", "user_tel" };
			String[] check_state = new String[] { "1", "2", "3", "4" };
			
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
	public List<UserInfo> getInfoSearchList(int index, int state, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (index != -1) {
			String[] search_field = new String[] { "user_email", "user_name", "user_tel" };
			String[] check_state = new String[] { "1", "2", "3", "4" };
			
			map.put("search_field", search_field[index]);
			map.put("check_state", check_state[state]);
			map.put("search_word", "%" + search_word + "%");
		}
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getInfoSearchList(map);
	}

    @Override
    public int getSearchListCount(int index, int state, String search_word) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	if (index != -1) {
			String[] search_field = new String[] { "user_email", "user_name", "user_tel" };
			String[] check_state = new String[] { "1", "2", "3", "4" };
			
			map.put("search_field", search_field[index]);
			map.put("check_state", check_state[state]);
			map.put("search_word", "%" + search_word + "%");
		}
    	
    	return dao.getSearchListCount(map);
    }

    @Override
    public int getNoticeListCount() {
        return dao.getNoticeListCount();
    }
}
