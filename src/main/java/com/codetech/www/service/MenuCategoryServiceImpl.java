package com.codetech.www.service;

import com.codetech.www.dao.MenuCategoryDAO;
import com.codetech.www.domain.MenuCategory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuCategoryServiceImpl implements MenuCategoryService {
    private static final Logger logger = LoggerFactory.getLogger(MenuCategoryServiceImpl.class);

    @Autowired
    private MenuCategoryDAO dao;

    @Override
    public List<MenuCategory> getCategoryList() {
        return dao.getCategoryList();
    }
}
