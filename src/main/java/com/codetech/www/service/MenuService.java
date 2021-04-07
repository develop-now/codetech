package com.codetech.www.service;

import com.codetech.www.domain.Menu;

public interface MenuService {
    public int createMenu(Menu menu);

    public Menu readMenu();

    public int updateMenu();

    public int deleteMenu();
}
