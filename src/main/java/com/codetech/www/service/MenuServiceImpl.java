package com.codetech.www.service;

import com.codetech.www.dao.MenuDAO;
import com.codetech.www.domain.Menu;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MenuServiceImpl implements MenuService {
    private static final Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);

    @Autowired
    private MenuDAO dao;


    @Override
    public List<Menu> getMenuListByStore(int store_id) {
        List<Menu> list = dao.getMenuListByStore(store_id);

        for (Menu m : list) {
            logger.info(m.getMenu_name());
        }

        return list;
    }

    @Override
    public Map<String, List<Menu>> getMenuListByOwner(int owner_id) {
        List<Menu> list = dao.getMenuListByOwner(owner_id);
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

    @Override
    public int createMenu(Menu menu) {
        return dao.createMenu(menu);
    }

    @Override
    public Menu readMenu() {
        return null;
    }

    @Override
    public int updateMenu() {
        return 0;
    }

    @Override
    public int deleteMenu() {
        return 0;
    }
}
