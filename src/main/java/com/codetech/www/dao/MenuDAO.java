package com.codetech.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

}
