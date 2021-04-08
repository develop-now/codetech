package com.codetech.www.service;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Store;

import java.util.List;

public interface StoreService {
    public int getStoreCount();

    public List<Store> getStoreListByOwner(int owner_id);

    public int createStore(Store store, Menu menu);

    public Store readStore();

    public int updateStore();

    public int deleteStore();

    public int storeNameCheck(String name);
}
