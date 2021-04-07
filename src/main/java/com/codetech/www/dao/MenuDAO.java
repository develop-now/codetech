package com.codetech.www.dao;

import com.codetech.www.domain.Menu;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MenuDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public int createMenu(Menu menu) {
        return sqlSession.insert("Menus.createMenu", menu);
    }

    public List<Menu> getMenuListByStore(int store_id){
        return sqlSession.selectList("Menus.listByStore", store_id);
    }
    public List<Menu> getMenuListByOwner(int owner_id){
        return sqlSession.selectList("Menus.listByOwner", owner_id);
    }
}
