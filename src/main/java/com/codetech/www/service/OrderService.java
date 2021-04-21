package com.codetech.www.service;

import com.codetech.www.domain.DetailMenuJoin;
import com.codetech.www.domain.Order;
import com.codetech.www.domain.OrderDetail;
import com.codetech.www.domain.OrderStatus;

import java.util.List;

public interface OrderService {
    public int getOrderStatusID(String status_value);

    public List<OrderStatus> getOrderStatusList();

    public int updateOrderStatus(int order_id, int status_id);

    public List<OrderDetail> getOrderDetails(int store_id);

    public int getOrderListCountAjax(int store_id, String selected_date, int status_id);

    public List<Order> getOrderListAjax(int store_id, String selected_date, int status_id, String order_key, int page);

    public List<Order> getOrderList(int store_id);

    public void createOrder();

    public Order readOrder(int order_id);

    public List<DetailMenuJoin> readOrderDetail(int order_id);

    public int updateOrder();

    public int deleteOrder();
}
