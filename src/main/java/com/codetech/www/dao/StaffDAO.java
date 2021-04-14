package com.codetech.www.dao;

import com.codetech.www.domain.Staff;
import com.codetech.www.domain.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StaffDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<Staff> getStaffListByStore(int store_id) {
        return sqlSession.selectList("Staffs.staffListByStore", store_id);
    }
}
