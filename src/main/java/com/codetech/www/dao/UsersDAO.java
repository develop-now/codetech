package com.codetech.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;

@Repository
public class UsersDAO {
    private static final Logger logger = LoggerFactory.getLogger(UsersDAO.class);
    
    @Autowired
    private SqlSessionTemplate sqlSession;

    public User isEmail(String user_email) {
        return sqlSession.selectOne("users.isEmail", user_email);
    }

    public UserInfo isName(String user_name) {
        return sqlSession.selectOne("users.isName", user_name);
    }

	public int userinsert(User user) {
		return sqlSession.insert("users.userInsert", user);
	}

	public int infoinsert(UserInfo info) {
		return sqlSession.insert("users.infoInsert", info);
	}

	public int userId(User user) {
		return sqlSession.selectOne("users.userId", user);
	}

	/*
	 * public UserPlusInfo user_total_info(int id) { return
	 * sqlSession.selectOne("users.userTotalInfo", id); }
	 */
}
