package com.codetech.www.dao;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Order;
import com.codetech.www.domain.OrderDetail;
import com.codetech.www.domain.Store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class OrderDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<Order> getOrderList(int store_id){
        return sqlSession.selectList("Orders.list", store_id);
    }

	public List<Order> getOrder(HashMap<String, Integer> map) {
        return sqlSession.selectList("Orders.ordered", map);

	}

	public List<Store> getStoreForOrder(HashMap<String, Integer> map) {
        return sqlSession.selectList("Orders.ordered_stores", map);

	}

	public List<OrderDetail> getOrderDetail(HashMap<String, Integer> map) {
        return sqlSession.selectList("Orders.ordered_details", map);
	}

	public List<Menu> getMenuForOrder(HashMap<String, Integer> map) {
        return sqlSession.selectList("Orders.ordered_menu", map);

	}

	public int getListCount(int user_id) {
		return sqlSession.selectOne("Orders.orderCount", user_id);
	}
}
