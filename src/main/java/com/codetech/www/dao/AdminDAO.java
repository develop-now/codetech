package com.codetech.www.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Notice;
import com.codetech.www.domain.ReportStoreList;
import com.codetech.www.domain.ReportUserList;
import com.codetech.www.domain.StoreInfoList;
import com.codetech.www.domain.UserPlusInfo;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 유저 리스트
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

	
	// 파트너 가게 리스트
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

	public int updateOwnerUserStatus(Map<String, Object> store_user) {
		return sqlSession.update("Admin.updateOwnerUserStatus", store_user);
	}

	public int isWorker(Map<String, Object> partner_param) {
		return sqlSession.selectOne("Admin.isWorker", partner_param);
	}
	
	public int store_act(String store_id) {
		return sqlSession.update("Admin.storeAct", store_id);
	}

	public List<Menu> getStoreMenuList(String store_id) {
		return sqlSession.selectList("Admin.getStoreMenuList", store_id);
	}
	
	
	// 공지사항
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

	
	// 유저 신고 리스트
	public int getRULcount(Map<String, Object> map) {
		return sqlSession.selectOne("Admin.getRULcount", map);
	}

	public List<ReportUserList> getRUL(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getRUL", map);
	}

	public int RULstatusChange(int user_report_id) {
		return sqlSession.update("Admin.RULstatusChange", user_report_id);
	}

	public int RULstatusCompleted(int user_report_id) {
		return sqlSession.update("Admin.RULstatusCompleted", user_report_id);
	}

	// 가게가 유저 신고 리스트
	public int getRSLcount(Map<String, Object> map) {
		return sqlSession.selectOne("Admin.getRSLcount", map);
	}

	public List<ReportUserList> getRSL(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getRSL", map);
	}

	public int RSLstatusChange(int user_report_id) {
		return sqlSession.update("Admin.RSLstatusChange", user_report_id);
	}

	public int RSLstatusCompleted(int user_report_id) {
		return sqlSession.update("Admin.RSLstatusCompleted", user_report_id);
	}

	
	// 유저가 가게 신고 리스트
	public int getRUScount(Map<String, Object> map) {
		return sqlSession.selectOne("Admin.getRUScount", map);
	}

	public List<ReportStoreList> getRUS(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getRUS", map);
	}

	public int RUSstatusChange(int store_report_id) {
		return sqlSession.update("Admin.RUSstatusChange", store_report_id);
	}

	public int RUSstatusCompleted(int store_report_id) {
		return sqlSession.update("Admin.RUSstatusCompleted", store_report_id);
	}
}
