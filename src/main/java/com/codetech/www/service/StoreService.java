package com.codetech.www.service;

import com.codetech.www.domain.Store;

import java.util.List;

public interface StoreService {
    public int getStoreCount();

    public List<Store> getStoreList();

    public void createStore();

    public Store readStore();

    public int updateStore();

    public int deleteStore();
}
