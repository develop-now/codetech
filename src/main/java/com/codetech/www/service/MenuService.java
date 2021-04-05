package com.codetech.www.service;

import com.codetech.www.domain.Menu;

import java.util.List;

public interface MenuService {
    public List<Menu> getMenuList(int store_id);

    public int createMenu(Menu menu);

    public Menu readMenu();

    public int updateMenu();

    public int deleteMenu();
}
