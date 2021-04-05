package com.codetech.www.controller;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Store;
import com.codetech.www.service.MenuService;
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
@RequestMapping(value = "/menu")
public class MenuController {
    private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/menu-list", method = RequestMethod.GET)
    public String getMenuList(@RequestParam(value = "store_id") int store_id, Model model) {
        model.addAttribute("storeNav", "menuList");
        // TODO:: GET ID FROM SESSION OR SECURITY

        List<Menu> list = menuService.getMenuList(store_id);

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
