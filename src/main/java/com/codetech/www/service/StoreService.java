package com.codetech.www.service;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Report;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.User;

import java.util.List;

public interface StoreService {
    public int getStoreCount();

    public List<Store> getStoreListByOwner(int owner_id);

    public List<Store> getStoreListByStaff(int staff_id);

    public int createStore(Store store, Menu menu);

    public Store readStore(int store_id);

    public int updateStore(Store store);

    public int deleteStore();

    public int storeStatusChange(int store_id, String status_value);

    public int storeNameCheck(String name);

    public boolean isStoreOwner(int owner_id, int store_id);

	public Report readStoreReport(int store_report_id);
}
