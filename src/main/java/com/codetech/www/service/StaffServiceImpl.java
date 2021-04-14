package com.codetech.www.service;

import com.codetech.www.dao.StaffDAO;
import com.codetech.www.dao.UsersDAO;
import com.codetech.www.domain.Staff;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StaffServiceImpl implements StaffService {
    private static final Logger logger = LoggerFactory.getLogger(StaffServiceImpl.class);

    private final String role_member = "ROLE_MEMBER";
    private final String role_staff = "ROLE_STORE_STAFF";

    @Autowired
    private StaffDAO staff_dao;

    @Autowired
    private UsersDAO user_dao;

    @Override
    public List<Staff> getStaffListByStore(int store_id) {
        return staff_dao.getStaffListByStore(store_id);
    }

    @Override
    public List<Staff> getStaffSearchList(int store_id, String search_val) {
        Map<String, Object> param = new HashMap<String, Object>();

        param.put("store_id", store_id);
        param.put("search_val", "%" + search_val + "%");

        return staff_dao.getStaffSearchList(param);
    }

    // TODO :: 사장 ID 받아와서 그 가게의 사장인지 확인
    @Transactional
    @Override
    public int createStaff(int store_id, int user_id) {
        int result = -2; // Create Fail

        Map<String, Object> staff_param = new HashMap<String, Object>();

        staff_param.put("store_id", store_id);
        staff_param.put("user_id", user_id);

        int checkResult = staff_dao.isWorker(staff_param);

        logger.info("checkResult" + checkResult);

        if (checkResult > 0) {
            logger.info("Already Exist at store");
            return -1; // Already Exist at store
        }

        if (staff_dao.createStaff(staff_param) > 0) {
            logger.info("[StaffServiceImpl] Change to role to staff ***");

            Map<String, Object> user_param = new HashMap<String, Object>();
            user_param.put("user_id", user_id);
            user_param.put("role_value", role_staff);

            result = user_dao.updateStaffUserStatus(user_param); // 0 일때는 이미 직원 ROLE, 1일때는 ROLE 변경
        }

        return result;
    }

    // TODO :: 사장 ID 받아와서 그 가게의 사장인지 확인
    @Transactional
    @Override
    public int deleteStaff(int store_id, int user_id) {
        int result = -1; // Delete Fail

        Map<String, Object> staff_param = new HashMap<String, Object>();

        staff_param.put("store_id", store_id);
        staff_param.put("user_id", user_id);

        int deleteResult = staff_dao.deleteStaff(staff_param);

        if (deleteResult <= 0) {
            return result;
        } else {
            result = deleteResult;
        }

        staff_param.remove("store_id");

        int checkResult = staff_dao.isWorker(staff_param);

        if (checkResult <= 0) {
            logger.info("[StaffServiceImpl] No more worker ***");

            Map<String, Object> user_param = new HashMap<String, Object>();
            user_param.put("user_id", user_id);
            user_param.put("role_value", role_member);

            result = user_dao.updateStaffUserStatus(user_param);
        }

        return result;
    }
}
