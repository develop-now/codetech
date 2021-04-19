package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Notice;
import com.codetech.www.domain.StoreInfoList;
import com.codetech.www.domain.UserPlusInfo;

public interface AdminService {
	public List<UserPlusInfo> getUsersSearchList(int index, int state, String search_word, int page, int limit);
	public int getSearchListCount(int index, int state, String search_word);

	public int user_susp(String user_id);		// 유저 정지
	public int user_reac(String user_id);		// 유저 재활동
	public int user_banned(String user_id);		// 유저 추방
	public int user_inac(String user_id);		// 본인 탈퇴

	
	public int getPartnerSearchListCount(int index, int state, String search_word);
	public List<StoreInfoList> getPartnerSearchList(int index, int state, String search_word, int page, int limit);

	public int store_act(String store_id); 		// 가게 재활동
	public int store_susp(String store_id); 	// 가게 정지
	public int store_termi(String store_id);	// 가게 재계약 (보류)
	
	public List<Menu> getStoreMenuList(String store_id);
	
	public List<Notice> getNoticeList(String search_text, int index, int page, int limit);
	public int getNoticeListCount(String search_text, int index);
}
