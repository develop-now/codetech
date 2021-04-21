package com.codetech.www.service;

import com.codetech.www.dao.OrderDAO;
import com.codetech.www.domain.DetailMenuJoin;
import com.codetech.www.domain.Order;

import com.codetech.www.domain.OrderDetail;
import com.codetech.www.domain.OrderStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Autowired
    private OrderDAO dao;

    @Override
    public List<OrderStatus> getOrderStatusList() {
        return dao.getOrderStatusList();
    }

    @Override
    public int updateOrderStatus(int order_id, int status_id) {
        Map<String, Object> param = new HashMap<>();

        param.put("order_id", order_id);
        param.put("status_id", status_id);

        return dao.updateOrderStatus(param);
    }

    @Override
    public int getOrderListCountAjax(int store_id, String selected_date, int status_id) {
        Map<String, Object> param = new HashMap<>();

        param.put("store_id", store_id);
        param.put("selected_date", selected_date);

        if (status_id != 0) {
            param.put("status_id", status_id);
        }

        return dao.getOrderListCountAjax(param);
    }

    @Override
    public List<Order> getOrderListAjax(int store_id, String selected_date, int status_id, String order_key, int page) {
        Map<String, Object> param = new HashMap<>();

        param.put("store_id", store_id);
        param.put("selected_date", selected_date);
        param.put("startRow", 1);
        param.put("endRow", page * 5);
        param.put("order_key", order_key);

        if (status_id != 0) {
            param.put("status_id", status_id);
        }

        return dao.getOrderListAjax(param);
    }

    @Override
    public List<Order> getOrderList(int store_id) {
        return dao.getOrderList(store_id);
    }

    @Override
    public void createOrder() {

    }

    @Override
    public int getOrderStatusID(String status_value) {
        return dao.getOrderStatusID(status_value);
    }


    @Override
    @Transactional
    public Order readOrder(int order_id) {
        Order order = dao.readOrder(order_id);

        if (order.getOrder_status() == 1) {
            logger.info("ORDER STATUS VALUE 1");

            int status_id = getOrderStatusID("checked");
            logger.info("status_id : " + status_id);

            int result = updateOrderStatus(order_id, status_id);
            logger.info("update result : " + (result > 0));
        }

        return dao.readOrder(order_id);
    }

    @Override
    public List<DetailMenuJoin> readOrderDetail(int order_id) {
        return dao.readOrderDetail(order_id);
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
