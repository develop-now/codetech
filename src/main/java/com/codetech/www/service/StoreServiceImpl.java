package com.codetech.www.service;

import com.codetech.www.dao.MenuDAO;
import com.codetech.www.dao.StoreDAO;

import com.codetech.www.domain.*;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

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

    @Override
    public List<Store> getStoreListByStaff(int staff_id) {
        return store_dao.getStoreListByStaff(staff_id);
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
        int result = -1;

        Store s = store_dao.storeNameCheck(name);

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


    @Override
    public Report readStoreReport(int store_report_id) {
    	return store_dao.readStoreReport(store_report_id);
    }

    @Override
    public int getStoreCustomerCount(int store_id) {
        return store_dao.getStoreCustomerCount(store_id);
    }

    @Override
    public List<Customer> getStoreCustomer(int store_id, int page, String order_key) {
        Map<String, Object> param = new HashMap<>();

        param.put("store_id", store_id);
        param.put("order_key", order_key);
        param.put("startRow", 1);
        param.put("endRow", page * 5);

        return store_dao.getStoreCustomer(param);
    }

    private String calculateDate(String key_date, int value) {
        DateFormat df = new SimpleDateFormat("yyyyMMdd");
        Date date = null;

        try {
            date = df.parse(key_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Calendar cal = Calendar.getInstance();

        if (date != null) {
            cal.setTime(date);
            cal.add(Calendar.DATE, value);
        } else {
            logger.error("[StoreServiceImpl] ERROR :  날짜 변환에 실패하였습니다.");
            return "";
        }

        return df.format(cal.getTime());
    }

    @Override
    public int getStoreTotalLike(int store_id) {
        return store_dao.getStoreTotalLike(store_id);
    }

    @Override
    public int getStoreTotalIncome(int store_id) {
        return store_dao.getStoreTotalIncome(store_id);
    }

    @Override
    public List<Profit> getStoreProfit(int store_id, String selected_date) {
        Map<String, Object> param = new HashMap<>();

        String start_date = calculateDate(selected_date, -3);
        String end_date = calculateDate(selected_date, 3);

        param.put("store_id", store_id);
        param.put("startDate", start_date);
        param.put("endDate", end_date);

        return store_dao.getStoreProfit(param);
    }
}
