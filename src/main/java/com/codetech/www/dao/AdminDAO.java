package com.codetech.www.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Notice;
import com.codetech.www.domain.ReportUserList;
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

	public List<Menu> getStoreMenuList(String store_id) {
		return sqlSession.selectList("Admin.getStoreMenuList", store_id);
	}
	
	public List<Notice> getNoticeList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getNoticeList", map);
	}
	
    public int getNoticeListCount(Map<String, Object> map) {
        return sqlSession.selectOne("Admin.getNoticeListCount", map);
    }

	public int insertBoard(Notice notice) {
		return sqlSession.insert("Admin.insertNotice", notice);
	}

	public int setReadCountUpdate(int notice_id) {
		return sqlSession.update("Admin.readCountUpdate", notice_id);
	}

	public Notice noticeView(int notice_id) {
		return sqlSession.selectOne("Admin.noticeView", notice_id);
	}

	public int modifyAction(Notice noticeModify) {
		return sqlSession.update("Admin.modifyAction", noticeModify);
	}

	public int noticeDelete(Notice notice) {
		return sqlSession.delete("Admin.noticeDelete", notice);
	}

	public int getRULcount(Map<String, Object> map) {
		return sqlSession.selectOne("Admin.getRULcount", map);
	}

	public List<ReportUserList> getRUL(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getRUL", map);
	}
}
