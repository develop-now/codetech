package com.codetech.www.service;

import com.codetech.www.domain.Order;

import java.util.List;

public interface OrderService {
    public List<Order> getOrderList(int store_id);

    public void createOrder();

    public Order readOrder();

    public int updateOrder();

    public int deleteOrder();
}
