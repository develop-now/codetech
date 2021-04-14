package com.codetech.www.service;

import com.codetech.www.dao.StaffDAO;
import com.codetech.www.domain.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffServiceImpl implements StaffService{
    @Autowired
    private StaffDAO staff_dao;

    @Override
    public List<Staff> getStaffListByStore(int store_id) {
        return staff_dao.getStaffListByStore(store_id);
    }
}
