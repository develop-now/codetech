package com.codetech.www.dao;

import com.codetech.www.domain.Staff;
import com.codetech.www.domain.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class StaffDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<Staff> getStaffListByStore(int store_id) {
        return sqlSession.selectList("Staffs.staffListByStore", store_id);
    }

    public List<Staff> getStaffSearchList(Map<String, Object> param) {
        return sqlSession.selectList("Staffs.staffSearchList", param);
    }

    public int isWorker(Map<String, Object> param) {
        return sqlSession.selectOne("Staffs.isWorker", param);
    }

    public int createStaff(Map<String, Object> param) {
        return sqlSession.insert("Staffs.createStaff", param);
    }

    public int deleteStaff(Map<String, Object> param) {
        return sqlSession.delete("Staffs.deleteStaff", param);
    }
}
