package com.codetech.www.service;

import com.codetech.www.domain.Order;

public interface OrderService {
    public void createOrder();

    public Order readOrder();

    public int updateOrder();

    public int deleteOrder();
}
