package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;


public interface UsersService {
	int isEmail(String user_email);

	int isName(String user_name);

	int userinsert(User user, UserInfo info);

	int isUser(String user_id, String user_password);


}
