package com.codetech.www.controller;

import com.codetech.www.domain.DetailMenuJoin;
import com.codetech.www.domain.Order;
import com.codetech.www.domain.OrderDetail;
import com.codetech.www.domain.OrderStatus;
import com.codetech.www.domain.Point;
import com.codetech.www.service.OrderService;
import com.codetech.www.service.UsersService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;
    
    private UsersService userService;

    @ResponseBody
    @RequestMapping(value = "/order-status-ajax", method = RequestMethod.GET)
    public Map<String, Object> orderStatusListAjax() {
        Map<String, Object> rtn = new HashMap<>();

        List<OrderStatus> list = orderService.getOrderStatusList();

        rtn.put("list", list);
        rtn.put("success", list.size() > 0);

        return rtn;
    }

    @ResponseBody
    @RequestMapping(value = "/order-list-ajax", method = RequestMethod.GET)
    public Map<String, Object> orderListAjax(@RequestParam(value = "store_id") int store_id,
                                             @RequestParam(value = "selected_date") String selected_date,
                                             @RequestParam(value = "status_id") int status_id,
                                             @RequestParam(value = "order_key") String order_key,
                                             @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        Map<String, Object> rtn = new HashMap<String, Object>();

        List<Order> list = orderService.getOrderListAjax(store_id, selected_date, status_id, order_key, page);
        int listCount = orderService.getOrderListCountAjax(store_id, selected_date, status_id);

        rtn.put("success", list.size() > 0);
        rtn.put("list", list);
        rtn.put("listCount", listCount);

        return rtn;
    }

    @RequestMapping(value = "/order-read", method = RequestMethod.GET)
    public String readOrder(@RequestParam(value = "order_id") int order_id, Model model) {
        model.addAttribute("storeNav", "orderRead");

        Order order = orderService.readOrder(order_id);
        List<DetailMenuJoin> detail_list = orderService.readOrderDetail(order_id);

        model.addAttribute("order", order);
        model.addAttribute("detail_list", detail_list);

        return "store/order/order-read";
    }

    @ResponseBody
    @RequestMapping(value = "/updateAction", method = RequestMethod.POST)
    public Map<String, Object> updateAction(@RequestParam(value = "order_id") int order_id,
                                            @RequestParam(value = "status_id") int status_id) {

        Map<String, Object> rtn = new HashMap<String, Object>();

        int result = orderService.updateOrderStatus(order_id, status_id);
        
        /*HJE points insert start 04.21.4pm 픽업완료로 status_id = 6으로 update 성공시 points에 내역 추가*/
        if(status_id ==6 && result == 1) {
        	//order_id에 해당하는order_user-> user_id, store_id, order_total_price을 가져온다.
        	Order order = orderService.readOrder(order_id);
        	//order_total_price의 10%를 구한다 -> point_value
        	int order_total = Integer.parseInt(order.getOrder_total_price());
        	int point_value = order_total/10; //하나의 오더 총금액의 10%를 포인트로 산정
        	
        	//point.java에 값을 담고 points테이블에 적용하러 간다.
        	Point point = new Point();
        	point.setPoint_value(point_value);
        	point.setOrder_id(order_id);
        	point.setStore_id(order.getStore_id());
        	point.setUser_id(order.getOrder_user());
        	point.setPoint_type("get");
        	orderService.insertPoint(point);
        	//dao에서 리턴값이 1일경우 point.java에 담긴 point_value를 user_info에 담고 user_info테이블을 update해준다. -- 이때 업데이트하느날짜는 사용하지 않음
        	//userservieceimpl에서 위의 로직 처리
        	
        }
        /*HJE points insert end*/
        
        rtn.put("success", result > 0);

        return rtn;
    }

    @RequestMapping(value = "/order-update", method = RequestMethod.GET)
    public void updateOrder(@RequestParam(value = "order_id") int order_id, Model model) {
        model.addAttribute("storeNav", "orderUpdate");
    }

    @RequestMapping(value = "/order-delete", method = RequestMethod.GET)
    public void deleteOrder(@RequestParam(value = "order_id") int order_id, Model model) {
        model.addAttribute("storeNav", "orderDelete");
    }
}
