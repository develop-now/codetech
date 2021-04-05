package com.codetech.www.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UsersDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<Users> getSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Users.getSearchList", map);
	}
}
