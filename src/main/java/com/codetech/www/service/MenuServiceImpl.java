package com.codetech.www.service;

import com.codetech.www.dao.MenuDAO;
import com.codetech.www.domain.Menu;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService{
    private static final Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);

    @Autowired
    private MenuDAO dao;

    @Override
    public void createMenu() {

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
