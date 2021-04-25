package com.codetech.www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.codetech.www.domain.Point;
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
    	System.out.println("DAO에서 " + user_email);
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

    public User getAdmin(int user_id) {
        return sqlSession.selectOne("users.manager", user_id);
    }

    public UserInfo getAdminInfo(int user_id) {
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
        logger.info("dao ui.original확인" + ui.getOriginal_file());
        return sqlSession.update("users.updateUserInfo", ui);
    }

    public int addReport(Report report) {
        if (report.getReported_store() != 0) {
            sqlSession.insert("users.addStoreReport", report);
        } else {
            sqlSession.insert("users.addCmtReport", report);
        }
        return 0;
    }

    public List<UserInfo> getUserName() {
        return sqlSession.selectList("users.getUserName");
    }

    public UserInfo getUser(String reported) {
        return sqlSession.selectOne("users.getUserRP", reported);
    }

    public int reportUser(HashMap<String, Object> map) {
        return sqlSession.insert("users.userReport", map);
    }

    public User getUser(int user_id) {
        return sqlSession.selectOne("users.getUser", user_id);
    }

    public int updatePoint(Map<String, Object> map) {
        return sqlSession.update("users.updatePoint", map);
    }

    public List<Point> getPointList(HashMap<String, Integer> map) {
        logger.info("dao==========");
        return sqlSession.selectList("users.getPointList", map);
    }

    public int pointListCount(int user_id) {
        return sqlSession.selectOne("users.pointListCount", user_id);
    }


    public int getPointValue(int order_id) {
        logger.info("----------------값 getPointValue======================= " + order_id);

        int point = sqlSession.selectOne("users.pointValue", order_id);
        logger.info("----------------값 가져와서 " + point);
        return point;
    }

    public int revoke(int user_id) {
        return sqlSession.update("users.revoke", user_id);
    }


    public int getOrderStore(int store_id) {
        return sqlSession.selectOne("users.getOrderStore", store_id);

    }

    public int chcekStoreLikeAsUser(Map<String, Integer> map) {
        Integer result = sqlSession.selectOne("users.checkLike", map);
        logger.info("checkLike xml 값조회 완료 후 result = " + result);
        if (result == null) {
            result = 0;
        }
        logger.info("만약 result=null -> 0으로 변환  result=" + result);
        return result;
    }

    public int likesCount(int user_id) {
        return sqlSession.selectOne("users.likesCount", user_id);
    }

    public List<Report> reportStoreAndUserList(HashMap<String, Integer> map) {
        return sqlSession.selectList("users.reportStoreAndUserList", map);
    }

    public int getReportListCount(int user_id) {
        return sqlSession.selectOne("users.reportCount", user_id);
    }


}
