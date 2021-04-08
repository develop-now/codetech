package com.codetech.www.service;

import com.codetech.www.dao.MenuDAO;
import com.codetech.www.dao.StoreDAO;
import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Store;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StoreServiceImpl implements StoreService {
    private static final Logger logger = LoggerFactory.getLogger(StoreServiceImpl.class);

    @Autowired
    private StoreDAO store_dao;

    @Autowired
    private MenuDAO menu_dao;

    @Override
    public int getStoreCount() {
        return 0;
    }

    @Override
    public List<Store> getStoreListByOwner(int owner_id) {
        return null;
    }

    @Transactional
    @Override
    public int createStore(Store store, Menu menu) {
        int rtn = -1;
        int create_result = store_dao.createStore(store);

        if (create_result != 0) {
            menu.setStore_id(store.getStore_id());
            return menu_dao.createMenu(menu);
        }

        return rtn;
    }

    @Override
    public Store readStore() {
        return null;
    }

    @Override
    public int updateStore() {
        return 0;
    }

    @Override
    public int deleteStore() {
        return 0;
    }

    @Override
    public int storeNameCheck(String name) {
        Store s = store_dao.storeNameCheck(name);

        int result = -1;

        if (s != null) {
            result = 1;
        }

        return result;
    }
}
