package com.codetech.www.service;

import com.codetech.www.dao.OrderDAO;
import com.codetech.www.domain.Order;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Autowired
    private OrderDAO dao;

    @Override
    public List<Order> getOrderList(int store_id) {
        return dao.getOrderList(store_id);
    }

    @Override
    public void createOrder() {

    }

    @Override
    public Order readOrder() {
        return null;
    }

    @Override
    public int updateOrder() {
        return 0;
    }

    @Override
    public int deleteOrder() {
        return 0;
    }
}
