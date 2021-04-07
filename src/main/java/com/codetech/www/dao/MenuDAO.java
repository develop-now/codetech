package com.codetech.www.dao;

import com.codetech.www.domain.Menu;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public int createMenu(Menu menu) {
        return sqlSession.insert("Menus.createMenu", menu);
    }
}
