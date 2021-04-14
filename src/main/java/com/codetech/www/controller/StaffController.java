package com.codetech.www.controller;

import com.codetech.www.domain.Staff;
import com.codetech.www.domain.Store;
import com.codetech.www.service.StaffService;
import com.codetech.www.service.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/staff")
public class StaffController {
    private static final Logger logger = LoggerFactory.getLogger(StaffController.class);

    @Autowired
    private StoreService storeService;

    @Autowired
    private StaffService staffService;

    @RequestMapping(value = "/order-list", method = RequestMethod.GET)
    public String getStoreList(Model model, HttpSession session) {
        model.addAttribute("storeNav", "orderList");

        Integer staff_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + staff_id);

        List<Store> list = storeService.getStoreListByStaff(staff_id);
        model.addAttribute("store_list", list);

        return "store/order-list";
    }

    @ResponseBody
    @RequestMapping(value = "/staff-list-by-store-ajax", method = RequestMethod.GET)
    public Map<String, Object> getStoreStaffListAjax(HttpSession session, @RequestParam(value = "store_id") int store_id) {
        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        List<Staff> list = staffService.getStaffListByStore(store_id);

        Map<String, Object> rtn = new HashMap<String, Object>();

        rtn.put("list", list);
        rtn.put("success", list.size() > 0);

        return rtn;
    }

    @RequestMapping(value = "/staff-create", method = RequestMethod.GET)
    public String createStaff(Model model) {
        model.addAttribute("storeNav", "staffCreate");

        return "store/staff-create";
    }

    @ResponseBody
    @RequestMapping(value = "/searchAction", method = RequestMethod.GET)
    public Map<String, Object> searchStaffAction(@RequestParam(value = "store_id") int store_id,
                                                 @RequestParam(value = "search_val") String search_val,
                                                 HttpSession session) {
        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);
        logger.info("store store id : " + store_id);
        logger.info("store search_val : " + search_val);

        List<Staff> list = staffService.getStaffSearchList(store_id, search_val);

        Map<String, Object> rtn = new HashMap<String, Object>();

        rtn.put("list", list);
        rtn.put("success", list.size() > 0);

        return rtn;
    }

    @ResponseBody
    @RequestMapping(value = "/createAction", method = RequestMethod.POST)
    public Map<String, Object> createAction(@RequestParam(value = "store_id") int store_id,
                                            @RequestParam(value = "user_id") int user_id) {

        int createResult = staffService.createStaff(store_id, user_id);

        Map<String, Object> rtn = new HashMap<String, Object>();

        rtn.put("success", createResult >= 0);

        return rtn;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteAction", method = RequestMethod.POST)
    public Map<String, Object> deleteAction(@RequestParam(value = "store_id") int store_id,
                                            @RequestParam(value = "user_id") int user_id) {

        int deleteResult = staffService.deleteStaff(store_id, user_id);

        Map<String, Object> rtn = new HashMap<String, Object>();

        rtn.put("success", deleteResult > 0);

        return rtn;
    }
}
