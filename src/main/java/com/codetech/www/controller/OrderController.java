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

    @ResponseBody
    @RequestMapping(value = "/order-list-ajax", method = RequestMethod.GET)
    public Map<String, Object> deleteStore(@RequestParam(value = "store_id") int store_id, Model model) {
        model.addAttribute("storeNav", "storeDelete");
        Map<String, Object> rtn = new HashMap<String, Object>();

        return rtn;
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
