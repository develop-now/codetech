package com.codetech.www.dao;

import com.codetech.www.domain.Store;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public Store storeNameCheck(String name) {
        return sqlSession.selectOne("Stores.nameCheck", name);
    }

    public int createStore(Store store) {
        return sqlSession.insert("Stores.createStore", store);
    }
}
