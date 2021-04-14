package com.codetech.www.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codetech.www.domain.StoreInfoList;
import com.codetech.www.domain.UserPlusInfo;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<UserPlusInfo> getUsersSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getUsersSearchList", map);
	}
	
	public int getSearchListCount(Map<String, Object> map) {
		return sqlSession.selectOne("Admin.getSearchListCount", map);
	}
	
    public int getNoticeListCount() {
        return sqlSession.selectOne("Admin.count");
    }

	public int user_susp(String user_id) {
		return sqlSession.update("Admin.susp", user_id);
	}
	
	public int user_reac(String user_id) {
		return sqlSession.update("Admin.reac", user_id);
	}
	
	public int user_banned(String user_id) {
		return sqlSession.update("Admin.banned", user_id);
	}
	
	public int user_inac(String user_id) {
		return sqlSession.update("Admin.inac", user_id);
	}

	public List<StoreInfoList> getPartnerSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getPartnerSearchList", map);
	}
	
	public int getPartnerSearchListCount(Map<String, Object> map) {
		return sqlSession.selectOne("Admin.getPartnerSearchListCount", map);
	}

	public int store_termi(String store_id) {
		return sqlSession.update("Admin.storeTermi", store_id);
	}

	public int store_susp(String store_id) {
		return sqlSession.update("Admin.storeSusp", store_id);
	}

	public int store_act(String store_id) {
		return sqlSession.update("Admin.storeAct", store_id);
	}
}
