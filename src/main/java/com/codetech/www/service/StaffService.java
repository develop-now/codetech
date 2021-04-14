package com.codetech.www.service;

import com.codetech.www.domain.Staff;

import java.util.List;

public interface StaffService {
    public List<Staff> getStaffListByStore(int store_id);

}
