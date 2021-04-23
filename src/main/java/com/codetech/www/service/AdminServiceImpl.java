package com.codetech.www.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codetech.www.dao.AdminDAO;
import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Notice;
import com.codetech.www.domain.ReportUserList;
import com.codetech.www.domain.StoreInfoList;
import com.codetech.www.domain.UserPlusInfo;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO dao;
	
	/* 사용자 검색 파트 */
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
	} // 사용자 파트 End 사용자 파트 End 사용자 파트 End 사용자 파트 End 사용자 파트 End 사용자 파트 End 사용자 파트 End
	
	
	/* 가게 리스트 파트 */
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
	
	// 계약 대기중 가게 메뉴 리스트
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
	
	
	@Override
	public int getNoticeListCount(String search_text, int index) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (index != -1) {
			System.out.println("ServiceImpl에서 index 값: " + index);
			String[] notice_status = new String[] { "1", "2", "3" };

			// 0 넘어오면 공지사항, 1 넘어오면 이벤트, 2 넘어오면 점검사항
			map.put("notice_status", notice_status[index]);
			map.put("search_text", "%" + search_text + "%");
		}
		
		return dao.getNoticeListCount(map);
	}
	
	@Override
	public List<Notice> getNoticeList(String search_text, int index, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (index != -1) {
			String[] notice_status = new String[] { "1", "2", "3" };
			
			// 0 넘어오면 공지사항, 1 넘어오면 이벤트, 2 넘어오면 점검사항
			map.put("notice_status", notice_status[index]);
			map.put("search_text", "%" + search_text + "%");
		}
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getNoticeList(map);
	}
	
	@Override
	public int setReadCountUpdate(int notice_id) {
		return dao.setReadCountUpdate(notice_id);
	}
	
	@Override
	public void insertNotice(Notice notice) {
		dao.insertBoard(notice);
	}

	@Override
	public Notice noticeView(int notice_id) {
		if (setReadCountUpdate(notice_id) != 1)
			return null;
		return dao.noticeView(notice_id);
	}

	@Override
	public int modifyAction(Notice noticeModify) {
		return dao.modifyAction(noticeModify);
	}

	@Override
	public int noticeDelete(int notice_id) {
		int result = 0;
		
		Notice notice = dao.noticeView(notice_id);
		
		if (notice != null) {
			result = dao.noticeDelete(notice);
		}
		
		return result;
	}

	@Override
	public int getRULcount(int index, String search_text) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (index != -1) {
			String[] select_field = new String[] { "reporter_user_name", "reported_user_name", "created_at" };
			
			map.put("select_field", select_field[index]);
			map.put("search_word", "%" + search_text + "%");
		}
		
		return dao.getRULcount(map);
	}

	@Override
	public List<ReportUserList> getRUL(int index, String search_text, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (index != -1) {
			String[] select_field = new String[] { "reporter_user_name", "reported_user_name", "created_at" };
			
			map.put("select_field", select_field[index]);
			map.put("search_word", "%" + search_text + "%");
		}
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getRUL(map);
	}
}
