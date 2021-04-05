package com.codetech.www.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codetech.www.dao.StoreDAO;
import com.codetech.www.domain.Store;

@Service
public class OwnerServiceImpl implements OwnerService{
    private static final Logger logger = LoggerFactory.getLogger(StoreServiceImpl.class);

	@Autowired
	private StoreDAO dao;
	

	@Override
	public List<Store> getStoreForMain() {
		return dao.getStoreForMain();
	}

}
