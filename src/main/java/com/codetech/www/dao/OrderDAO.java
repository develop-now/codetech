package com.codetech.www.dao;

import com.codetech.www.domain.Cart;
import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Order;
import com.codetech.www.domain.OrderDetail;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;


    public List<OrderStatus> getOrderStatusList() {
        return sqlSession.selectList("Orders.statusList");
    }

    public int updateOrderStatus(Map<String, Object> param) {
        return sqlSession.update("Orders.updateStatus", param);
    }

    public int getOrderListCountAjax(Map<String, Object> param) {
        return sqlSession.selectOne("Orders.listCountAjax", param);
    }

    public List<Order> getOrderListAjax(Map<String, Object> param) {
        return sqlSession.selectList("Orders.listAjax", param);
    }

    public List<Order> getOrderList(int store_id) {
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

    public int cartRegister(HashMap<String, Object> map) {
        return sqlSession.insert("Orders.cart", map);
    }

    public List<Cart> getCart(int user_id) {
        return sqlSession.selectList("Orders.cartList", user_id);

    }

    public List<Menu> getMenuForCart(int user_id) {
        return sqlSession.selectList("Orders.menuList", user_id);

    }

    public List<Store> getStoreForCart(int user_id) {
        return sqlSession.selectList("Orders.storeList", user_id);

    }

    public int getAmount(int user_id) {
        return sqlSession.selectOne("Orders.getAmount", user_id);
    }

    public int getTotalPrice(int user_id) {
        return sqlSession.selectOne("Orders.getTotalPrice", user_id);

    }

}
