package com.codetech.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codetech.www.dao.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService{
	@Autowired
	private UsersDAO dao;
		
//	@Override
//	public List<Users> getSearchList(int index, int state, String search_word, int page, int limit) {
//		Map<String, Object> map = new HashMap<String, Obejct>();
//		
//		if (index != -1) {
//			String[] search_field = new String[] { "user_email", "user_name", "user_tel" };
//			String[] check_state = new String[] { "active", "inactive", "suspending", "banned" };
//			
//			map.put("search_field", search_field[index]);
//			map.put("check_state", check_state[index]);
//			map.put("search_word", "%" + search_word + "%");
//		}
//		
//		int startrow = (page - 1) * limit + 1;
//		int endrow = startrow + limit - 1;
//		
//		map.put("start", startrow);
//		map.put("end", endrow);
//		
//		return dao.getSearchList(map);
//	}

	@Override
	public int getSearchListCount(int index, int state, String search_word) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getNoticeListCount() {
		return dao.getNoticeListCount();
	}
}
