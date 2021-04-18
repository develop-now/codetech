package com.codetech.www.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codetech.www.domain.Report;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;

@Repository
public class UsersDAO {
    private static final Logger logger = LoggerFactory.getLogger(UsersDAO.class);

    @Autowired
    private SqlSessionTemplate sqlSession;


    public User isEmail(String user_email) {
        return sqlSession.selectOne("users.isEmail", user_email);
    }

    public UserInfo isName(String user_name) {
        return sqlSession.selectOne("users.isName", user_name);
    }

    public int userinsert(User user) {
        return sqlSession.insert("users.userInsert", user);
    }

    public int infoinsert(UserInfo info) {
        return sqlSession.insert("users.infoInsert", info);
    }


    public int userId(User user) {
        return sqlSession.selectOne("users.userId", user);
    }

    public List<UserInfo> getAdminList() {
        return sqlSession.selectList("users.managerName");
    }

    public List<User> getAdmin(int user_id) {
        return sqlSession.selectOne("users.manager", user_id);
    }

    public List<UserInfo> getAdminInfo(int user_id) {
        return sqlSession.selectOne("users.managerInfo", user_id);

    }

    public UserPlusInfo user_total_info(int user_id) {
        return sqlSession.selectOne("users.userTotalInfo", user_id);
    }

    public User getUserId(String user_email) {
        return sqlSession.selectOne("users.selectUsers", user_email);
    }

	public int updatePassword(Map<String, Object> map) {
		return sqlSession.insert("users.updatePassword", map);
	}

	public User userInfo(int user_id) {
		return sqlSession.selectOne("users.userInfo", user_id);
	}

    //	for store store staff
    public int updateStaffUserStatus(Map<String, Object> param) {
        return sqlSession.update("users.updateStaffUserStatus", param);
    }

	public int userModify(UserInfo ui) {
		logger.info("dao ui.original확인"+ ui.getOriginal_file());
		return sqlSession.update("users.updateUserInfo",ui);
	}

	public List<Report> reportStoreAndComment(int user_id) {
		return sqlSession.selectList("users.reportStoreAndComment",user_id);
	}

	public int addReport(Report report) {
		if(report.getReported_store()!= 0) {
			sqlSession.insert("users.addStoreReport",report);
		}else {
			sqlSession.insert("users.addCmtReport",report);
		}
		return 0;
	}


}
