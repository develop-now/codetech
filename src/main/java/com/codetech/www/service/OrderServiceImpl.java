package com.codetech.www.service;

import com.codetech.www.dao.MenuDAO;
import com.codetech.www.dao.OrderDAO;
import com.codetech.www.dao.UsersDAO;
import com.codetech.www.domain.DetailMenuJoin;
import com.codetech.www.domain.Order;

import com.codetech.www.domain.OrderDetail;
import com.codetech.www.domain.OrderStatus;
import com.codetech.www.domain.Point;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {

    private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Autowired
    private OrderDAO order_dao;

    @Autowired
    private MenuDAO menu_dao;

    @Autowired
    private UsersDAO u_dao;

    @Override
    public List<OrderStatus> getOrderStatusList() {
        return order_dao.getOrderStatusList();
    }

    @Override
    @Transactional
    public int updateOrderStatus(int order_id, int status_id) {
        Map<String, Object> param = new HashMap<>();

        param.put("order_id", order_id);
        param.put("status_id", status_id);

        if (status_id == 5) {
            /*
             * 메뉴 테이블 menu_order_count +1 씩 하기위한 로직
             * */

            List<OrderDetail> orderDetails = getOrderDetails(order_id);

            for (OrderDetail d : orderDetails) {
                int menu_id = d.getMenu_id();

                Map<String, Object> menu_update_param = new HashMap<>();

                menu_update_param.put("menu_id", menu_id);
                menu_update_param.put("status_key", "menu_order_count");
                menu_update_param.put("status_value", 1);

                menu_dao.menuStatusUpdate(menu_update_param);
            }

            param.put("comment_writable", "true");
        }

        return order_dao.updateOrderStatus(param);
    }

    @Override
    public List<OrderDetail> getOrderDetails(int store_id) {
        return order_dao.getOrderDetails(store_id);
    }

    @Override
    public int getOrderListCountAjax(int store_id, String selected_date, int status_id) {
        Map<String, Object> param = new HashMap<>();

        param.put("store_id", store_id);
        param.put("selected_date", selected_date);

        if (status_id != 0) {
            param.put("status_id", status_id);
        }

        return order_dao.getOrderListCountAjax(param);
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

        return order_dao.getOrderListAjax(param);
    }

    @Override
    public int getNewOrderCountByStore(int store_id) {
        Map<String, Object> param = new HashMap<>();

        DateFormat df = new SimpleDateFormat("yyyyMMdd");
        Date date = new Date();

        String today = df.format(date);

        param.put("store_id", store_id);
        param.put("selected_date", today);

        return order_dao.getNewOrderCountByStore(param);
    }

    @Override
    public int getOrderCountByStore(int store_id) {
        return order_dao.getOrderCountByStore(store_id);
    }

    @Override
    public List<Order> getOrderList(int store_id) {
        return order_dao.getOrderList(store_id);
    }

    @Override
    public void createOrder() {

    }

    @Override
    public int getOrderStatusID(String status_value) {
        return order_dao.getOrderStatusID(status_value);
    }


    @Override
    @Transactional
    public Order readOrder(int order_id) {
        Order order = order_dao.readOrder(order_id);

        if (order.getOrder_status() == 1) {
            logger.info("ORDER STATUS VALUE 1");

            int status_id = getOrderStatusID("checked");
            logger.info("status_id : " + status_id);

            int result = updateOrderStatus(order_id, status_id);
            logger.info("update result : " + (result > 0));
        }

        return order_dao.readOrder(order_id);
    }

    @Override
    public List<DetailMenuJoin> readOrderDetail(int order_id) {
        return order_dao.readOrderDetail(order_id);
    }

    @Override
    public int updateOrder() {
        return 0;
    }

    @Override
    public int deleteOrder() {
        return 0;
    }

    @Override
    public void insertPoint(Point point) {
        int result = order_dao.insertPoint(point);
        if (result == 1) {
            int user_id = point.getUser_id();
            UserPlusInfo ui = u_dao.user_total_info(user_id);
            int prev_point = ui.getPoint();
            int total_point = prev_point + point.getPoint_value();
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("user_id", user_id);
            map.put("point", total_point);
            int pointUpdateResult = u_dao.updatePoint(map);
            if (pointUpdateResult != 1) {
                logger.info("user_info의 point update 실패"); //실패시 내역 삭제로 보완하기
            } else {
                logger.info("user_info의 point update 성공");
            }
        } else {
            logger.info("points의 point 내역 insert 실패");
        }
    }

	@Override
	public List<DetailMenuJoin> getOrderDetailsWithStoreName(int order_id) {
		return order_dao.getOrderDetailsWithStoreName(order_id);
	}
}
