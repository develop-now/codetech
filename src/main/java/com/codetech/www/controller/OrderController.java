package com.codetech.www.controller;

import com.codetech.www.domain.*;
import com.codetech.www.service.OrderService;
import com.codetech.www.service.UsersService;

import com.codetech.www.task.SendMail;
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

    @Autowired
    private SendMail sendMail;

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

        // 고객에게 메일 발송
        if (status_id == 4 || status_id == 5) {
            int user_id = orderService.readOrder(order_id).getOrder_user();
            String user_email = userService.getUser(user_id).getUser_email();

            MailVO vo = new MailVO();
            vo.setTo(user_email);

            if (status_id == 4) {
                vo.setContent("오더가 준비완료 되었습니다. <br> 주문하신 매장에서 픽업하세요! ");
            } else {
                vo.setContent("오더 픽업 완료되었습니다. <br> 이용해주셔셔 감사합니다! ");
            }

            sendMail.sendMail(vo);
        }

        /*HJE points insert start 04.21.4pm 픽업완료로 status_id = 6으로 update 성공시 points에 내역 추가*/
        if (status_id == 6 && result == 1) {
            Order order = orderService.readOrder(order_id);
            int order_total = Integer.parseInt(order.getOrder_total_price());
            int point_value = order_total / 10; //하나의 오더 총금액의 10%를 포인트로 산정

            Point point = new Point();
            point.setPoint_value(point_value);
            point.setOrder_id(order_id);
            point.setStore_id(order.getStore_id());
            point.setUser_id(order.getOrder_user());
            point.setPoint_type("get");
            orderService.insertPoint(point);
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
