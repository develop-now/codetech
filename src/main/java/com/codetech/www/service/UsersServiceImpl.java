package com.codetech.www.service;


import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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

    @Autowired
    private PasswordEncoder passwordEncoder;

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

	@Override
	public int isUser(String user_email, String user_password) {
		User user = dao.isEmail(user_email);
		int result=-1;
		logger.info("dao.isEmail result : " + result);
		if(user != null) {
			if(passwordEncoder.matches(user_password, user.getUser_password())) {
				result=1;
		}else
			result = 0;
	}
		return result;
	
}

	
	  @Override public UserPlusInfo user_info(int user_id) { 
		  return dao.user_total_info(user_id); 
	}

	@Override
	public User getUserId(String user_email) {
		return dao.getUserId(user_email);
	}
	 
	
	
}
