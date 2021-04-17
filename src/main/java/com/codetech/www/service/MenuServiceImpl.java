package com.codetech.www.service;

import com.codetech.www.dao.MenuDAO;
import com.codetech.www.dao.StoreDAO;
import com.codetech.www.domain.Menu;

import com.codetech.www.domain.Store;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MenuServiceImpl implements MenuService {
    private static final Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);

    @Autowired
    private MenuDAO menu_dao;

    @Autowired
    private StoreDAO store_dao;


    @Override
    public List<Menu> getMenuListByStore(int store_id) {
        List<Menu> list = menu_dao.getMenuListByStore(store_id);

        for (Menu m : list) {
            logger.info(m.getMenu_name());
        }

        return list;
    }

    @Override
    public Map<String, List<Menu>> getMenuListByOwner(int owner_id) {
        List<Menu> list = menu_dao.getMenuListByOwner(owner_id);
        Map<String, List<Menu>> rtn = new HashMap<String, List<Menu>>();

        for (Menu m : list) {
            if (rtn.get(m.getStore_name()) == null) {
                List<Menu> newList = new ArrayList<Menu>();
                newList.add(m);
                rtn.put(m.getStore_name(), newList);
            } else {
                List<Menu> oldList = rtn.get(m.getStore_name());
                oldList.add(m);
                rtn.put(m.getStore_name(), oldList);
            }
        }

        return rtn;
    }

    // TODO :: 사장 ID 받아와서 그 가게의 사장인지 확인
    @Override
    public int createMenu(Menu menu) {
        return menu_dao.createMenu(menu);
    }

    @Override
    public Menu readMenu(int menu_id) {
        return menu_dao.readMenu(menu_id);
    }

    // TODO :: 사장 ID 받아와서 그 가게의 사장인지 확인
    @Override
    public int updateMenu(Menu menu) {
        return menu_dao.updateMenu(menu);
    }

    // TODO :: 사장 ID 받아와서 그 가게의 사장인지 확인
    @Override
    public int deleteMenu() {
        return 0;
    }
}
