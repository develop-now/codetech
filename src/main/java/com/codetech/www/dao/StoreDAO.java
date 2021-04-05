package com.codetech.www.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codetech.www.domain.Store;

@Repository
public class StoreDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    
    //Stores for HomePage
	public List<Store> getStoreForMain() {
		return sqlSession.selectList("Stores.forMain");
	}
}
