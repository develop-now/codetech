package com.codetech.www.dao;

import com.codetech.www.domain.Order;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<Order> getOrderList(int store_id){
        return sqlSession.selectList("Orders.list", store_id);
    }
}
