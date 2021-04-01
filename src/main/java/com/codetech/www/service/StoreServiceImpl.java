package com.codetech.www.service;

import com.codetech.www.dao.StoreDAO;
import com.codetech.www.domain.Store;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreServiceImpl implements StoreService {
    private static final Logger logger = LoggerFactory.getLogger(StoreServiceImpl.class);

    @Autowired
    private StoreDAO dao;

    @Override
    public int getStoreCount() {
        return 0;
    }

    @Override
    public List<Store> getStoreList() {
        return null;
    }

    @Override
    public void createStore() {

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
}
