package com.codetech.www.service;

import com.codetech.www.domain.Staff;

import java.util.List;

public interface StaffService {
    public List<Staff> getStaffListByStore(int store_id);

    public List<Staff> getStaffSearchList(int store_id, String search_val);

    public int createStaff(int store_id, int user_id);

    public int deleteStaff(int store_id, int user_id);
}
