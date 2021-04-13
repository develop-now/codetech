package com.codetech.www.controller;

import com.codetech.www.domain.Store;
import com.codetech.www.service.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value="/staff")
public class StaffController {
    private static final Logger logger = LoggerFactory.getLogger(StaffController.class);

    @Autowired
    private StoreService storeService;

    @RequestMapping(value = "/order-list", method = RequestMethod.GET)
    public String getStoreList(Model model, HttpSession session) {
        model.addAttribute("storeNav", "orderList");

        Integer staff_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + staff_id);

        List<Store> list = storeService.getStoreListByStaff(staff_id);
        model.addAttribute("store_list", list);

        return "store/order-list";
    }
}
