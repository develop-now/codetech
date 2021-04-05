package com.codetech.www.dao;


import java.util.HashMap;
import java.util.List;


import com.codetech.www.domain.Store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class StoreDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;


    
    //Stores for HomePage
	public List<Store> getStoreForMain() {
		return sqlSession.selectList("Stores.forMain");
	}

    public Store storeNameCheck(String name) {
        return sqlSession.selectOne("Stores.nameCheck", name);
    }

    public int createStore(Store store) {
        return sqlSession.insert("Stores.createStore", store);
    }

}
