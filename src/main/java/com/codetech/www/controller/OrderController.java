package com.codetech.www.controller;

import com.codetech.www.domain.Order;
import com.codetech.www.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/order-list", method = RequestMethod.GET)
    public String getOrderList(@RequestParam(value = "store_id") int store_id, Model model) {
        model.addAttribute("storeNav", "orderList");
        // TODO:: GET ID FROM SESSION OR SECURITY

        List<Order> list = orderService.getOrderList(store_id);

        return "store/order-list";
    }

    @RequestMapping(value = "/order-read", method = RequestMethod.GET)
    public String readOrder(@RequestParam(value = "order_id") int order_id, Model model) {
        model.addAttribute("storeNav", "orderRead");

        return "store/order-read";
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
