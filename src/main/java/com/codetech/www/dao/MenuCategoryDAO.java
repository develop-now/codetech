package com.codetech.www.dao;

import com.codetech.www.domain.MenuCategory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MenuCategoryDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<MenuCategory> getCategoryList() {
        return sqlSession.selectList("MenuCategories.list");
    }
}
