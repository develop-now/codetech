package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;


public interface UsersService {
	int isEmail(String user_email);

	int isName(String user_name);
	
	public int insert(User user, UserInfo info);

}
