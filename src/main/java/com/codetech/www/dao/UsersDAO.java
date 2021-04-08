package com.codetech.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;

@Repository
public class UsersDAO {
	private static final Logger logger = LoggerFactory.getLogger(UsersDAO.class);
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	public User isEmail(String user_email) {
		return sqlSession.selectOne("users.isEmail",user_email);
	}

	public UserInfo isName(String user_name) {
		return sqlSession.selectOne("users.isName",user_name);
	}

}
