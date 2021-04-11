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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        return store_dao.getStoreListByOwner(owner_id);
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
    public Store readStore(int store_id) {
        return store_dao.readStore(store_id);
    }

    @Override
    public int updateStore(Store store) {
        return store_dao.updateStore(store);
    }

    @Override
    public int deleteStore() {
        return 0;
    }

    @Override
    public int storeStatusChange(int store_id, String status_value) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("store_id", store_id);
        param.put("status_value", status_value);

        return store_dao.storeStatusUpdate(param);
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

    @Override
    public boolean isStoreOwner(int owner_id, int store_id) {
        Store store = store_dao.readStore(store_id);

        if (store != null)
            return store.getOwner_id() == owner_id;

        return false;
    }
}
