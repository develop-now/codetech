package com.codetech.www.security;

import com.codetech.www.domain.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;

@Service
public class CustomUserDetailService implements UserDetailsService {
    private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailService.class);

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        logger.info("userName 은 로그인시 입력한 값: " + username);

        User user = sqlSession.selectOne("users.authIdCheck", username);

        if (user == null) {
            logger.info("userName : " + username + " not found");
            throw new UsernameNotFoundException("userName : " + username + " not found");
        }

        Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
        roles.add(new SimpleGrantedAuthority(user.getAuth()));

        return new org.springframework.security.core.userdetails.User(username, user.getUser_password(), roles);
    }
}
