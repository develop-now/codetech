package com.codetech.www.controller;

import com.codetech.www.domain.Menu;
import com.codetech.www.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/menu")
public class MenuController {
    private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/menu-list-by-owner", method = RequestMethod.GET)
    public ModelAndView getMenuListByOwner(@RequestParam(value = "owner_id") int owner_id, ModelAndView modelAndView) {
        modelAndView.addObject("storeNav", "menuList");
        // TODO:: GET ID FROM SESSION OR SECURITY

        Map<String, List<Menu>> list = menuService.getMenuListByOwner(owner_id);
        List<String> storeList = new ArrayList<String>();

        if (list.size() > 0)
            for (String key : list.keySet()) {
                logger.info("가게 이름 : " + key);
                storeList.add(key);
                modelAndView.addObject(key, list.get(key));
            }
        modelAndView.addObject("menuList", list);
        modelAndView.addObject("storeList", storeList);

        modelAndView.setViewName("store/menu-list");

        return modelAndView;
    }

    @RequestMapping(value = "/menu-list-by-store", method = RequestMethod.GET)
    public String getMenuListByStore(@RequestParam(value = "store_id") int store_id, Model model) {
        model.addAttribute("storeNav", "menuList");
        // TODO:: GET ID FROM SESSION OR SECURITY

        List<Menu> list = menuService.getMenuListByStore(store_id);

        return "store/menu-list";
    }

    @RequestMapping(value = "/menu-read", method = RequestMethod.GET)
    public String readMenu(@RequestParam(value = "menu_id") int menu_id, Model model) {
        model.addAttribute("storeNav", "menuRead");

        return "store/menu-read";
    }

    @RequestMapping(value = "/menu-create", method = RequestMethod.GET)
    public String createMenu(Model model) {
        model.addAttribute("storeNav", "menuUpdate");

        return "store/menu-create";
    }

    @RequestMapping(value = "/menu-update", method = RequestMethod.GET)
    public String updateMenu(@RequestParam(value = "menu_id") int menu_id, Model model) {
        model.addAttribute("storeNav", "menuUpdate");

        return "store/menu-update";
    }

    @RequestMapping(value = "/menu-delete", method = RequestMethod.GET)
    public String deleteMenu(@RequestParam(value = "menu_id") int menu_id, Model model) {
        model.addAttribute("storeNav", "menuDelete");

        return "store/menu-delete";
    }
}
