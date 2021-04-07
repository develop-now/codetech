package com.codetech.www.controller;

import com.codetech.www.domain.MenuCategory;
import com.codetech.www.service.MenuCategoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/menu-category")
public class MenuCategoryController {
    private static final Logger logger = LoggerFactory.getLogger(MenuCategoryController.class);

    @Autowired
    private MenuCategoryService menuCategoryService;

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Map<String, Object> getMenuCategoryList() {
        Map<String, Object> rtn = new HashMap<String, Object>();

        List<MenuCategory> list = menuCategoryService.getCategoryList();

        rtn.put("list", list);

        return rtn;
    }
}
