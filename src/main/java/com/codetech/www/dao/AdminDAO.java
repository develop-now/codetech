package com.codetech.www.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codetech.www.domain.UserPlusInfo;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<UserPlusInfo> getUsersSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Admin.getUsersSearchList", map);
	}
	
	public int getSearchListCount(Map<String, Object> map) {
		return sqlSession.selectOne("Admin.searchCount", map);
	}
	
    public int getNoticeListCount() {
        return sqlSession.selectOne("Admin.count");
    }
}
