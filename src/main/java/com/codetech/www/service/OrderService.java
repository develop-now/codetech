package com.codetech.www.service;

import com.codetech.www.domain.Order;
import com.codetech.www.domain.OrderStatus;

import java.util.List;

public interface OrderService {
    public List<OrderStatus> getOrderStatusList();

    public int updateOrderStatus(int order_id, int status_id);

    public int getOrderListCountAjax(int store_id, String selected_date, int status_id);

    public List<Order> getOrderListAjax(int store_id, String selected_date, int status_id, String order_key, int page);

    public List<Order> getOrderList(int store_id);

    public void createOrder();

    public Order readOrder();

    public int updateOrder();

    public int deleteOrder();
}
