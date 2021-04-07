package com.codetech.www.service;

import com.codetech.www.domain.Menu;

import java.util.List;
import java.util.Map;

public interface MenuService {
    public List<Menu> getMenuListByStore(int store_id);

    public Map<String, List<Menu>> getMenuListByOwner(int owner_id);

    public int createMenu(Menu menu);

    public Menu readMenu();

    public int updateMenu();

    public int deleteMenu();
}
