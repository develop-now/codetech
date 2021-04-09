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
import com.codetech.www.domain.UserPlusInfo;


@Service
public class UsersServiceImpl implements UsersService {
    private static final Logger logger = LoggerFactory.getLogger(UsersServiceImpl.class);

    @Autowired
    private UsersDAO dao;

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
	public int userinsert(User user, UserInfo info) {
		int result = dao.userinsert(user);
		if(result == 1 ) {
			int user_id = dao.userId(user);
			info.setUser_id(user_id);
			dao.infoinsert(info);
		}
		return result;
	}
	
}
