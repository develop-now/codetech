package com.codetech.www.service;


import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codetech.www.dao.UsersDAO;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;


@Service
public class UsersServiceImpl implements UsersService {
    private static final Logger logger = LoggerFactory.getLogger(UsersServiceImpl.class);

    @Autowired
    private UsersDAO dao;

    @Override
    public int getSearchListCount(int index, int state, String search_word) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int getNoticeListCount() {
        return dao.getNoticeListCount();
    }


    @Override
    public int isEmail(String user_email) {
        User user = dao.isEmail(user_email);
        return (user == null) ? -1 : 1;
    }

    @Override
    public int isName(String user_name) {
        UserInfo user = dao.isName(user_name);
        return (user == null) ? -1 : 1;
    }

	@Override
	public int insert(User user, UserInfo info) {
		Map<String, Object> map = new HashMap<String, Object>();
		return 0;
	}
}
