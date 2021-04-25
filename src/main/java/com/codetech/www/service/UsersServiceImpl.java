package com.codetech.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.codetech.www.dao.MenuDAO;
import com.codetech.www.dao.OrderDAO;
import com.codetech.www.dao.StoreDAO;
import com.codetech.www.dao.UsersDAO;
import com.codetech.www.domain.*;

@Service
public class UsersServiceImpl implements UsersService {
    private static final Logger logger = LoggerFactory.getLogger(UsersServiceImpl.class);

    @Autowired
    private UsersDAO udao;

    @Autowired
    private StoreDAO sdao;

    @Autowired
    private MenuDAO mdao;

    @Autowired
    private OrderDAO odao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public int isEmail(String user_email) {
        User user = udao.isEmail(user_email);
        return (user == null) ? -1 : 1;
    }

    @Override
    public int isName(String user_name) {
        UserInfo user = udao.isName(user_name);
        return (user == null) ? -1 : 1;
    }

    @Override
    public int userinsert(User user, UserInfo info) {
        int result = udao.userinsert(user);
        if (result == 1) {
            int user_id = udao.userId(user);
            info.setUser_id(user_id);
            udao.infoinsert(info);
        }
        return result;
    }

    @Override
    public int isUser(String user_email, String user_password) {
        User user = udao.isEmail(user_email);
        int result = -1;
        logger.info("dao.isEmail result : " + result);
        if (user != null) {
            if (passwordEncoder.matches(user_password, user.getUser_password())) {
                result = 1;
            } else
                result = 0;
        }
        return result;

    }

    @Override
    public UserPlusInfo user_info(int user_id) {
        return udao.user_total_info(user_id);
    }

    @Override
    public User getUserId(String user_email) {
        return udao.getUserId(user_email);
    }

    @Override
    public int passcheck(int user_id, String user_newpassword, String user_password) {
        User userInfo = udao.userInfo(user_id);
        int result = 0;
        if (userInfo != null) {
            if (passwordEncoder.matches(user_password, userInfo.getUser_password())) {

                user_newpassword = passwordEncoder.encode(user_newpassword);
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("user_id", user_id);
                map.put("user_password", user_newpassword);
                result = udao.updatePassword(map);
                if (result == 0) {
                    logger.info("dao updatepassword fail");
                    result = -1;
                }
                return result;
            }
            result = 0;
        }
        return result;
    }

    @Override
    public Store getStore(int store_id) {
        return sdao.getStore(store_id);
    }

    @Override
    public int getStoreLike(int store_id) {
        return sdao.getStoreLike(store_id);

    }

    @Override
    public List<Menu> getTopMenu(int store_id) {
        return mdao.getTopMenu(store_id);

    }

    @Override
    public List<Menu> getAllMenu(int store_id) {
        return mdao.getAllMenu(store_id);
    }

    @Override
    public int modifyInfo(UserInfo ui) {
        return udao.userModify(ui);
    }

    @Override
    public int addReport(Report report) {
        return udao.addReport(report);
    }

    public int getMenuCount(int user_id) {
        return mdao.getMenuCount(user_id);
    }

    @Override
    public List<Order> getOrder(int user_id, int page, int limit) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        int startrow = (page - 1) * limit + 1;
        int endrow = startrow + limit - 1;
        map.put("start", startrow);
        map.put("end", endrow);
        map.put("user_id", user_id);
        return odao.getOrder(map);

    }

    @Override
    public List<Store> getStoreForOrder(int user_id, int page, int limit) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        int startrow = (page - 1) * limit + 1;
        int endrow = startrow + limit - 1;
        map.put("start", startrow);
        map.put("end", endrow);
        map.put("user_id", user_id);
        return odao.getStoreForOrder(map);

    }

    @Override
    public List<OrderDetail> getOrderDetail(int user_id, int page, int limit) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        int startrow = (page - 1) * limit + 1;
        int endrow = startrow + limit - 1;
        map.put("start", startrow);
        map.put("end", endrow);
        map.put("user_id", user_id);
        return odao.getOrderDetail(map);

    }

    @Override
    public List<Menu> getMenuForOrder(int user_id, int page, int limit) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        int startrow = (page - 1) * limit + 1;
        int endrow = startrow + limit - 1;
        map.put("start", startrow);
        map.put("end", endrow);
        map.put("user_id", user_id);
        return odao.getMenuForOrder(map);

    }

    @Override
    public int getListCount(int user_id) {
        return odao.getListCount(user_id);
    }

    @Override
    public List<Store> getStoreFavorite(int user_id) {
        return sdao.getStoreFavorite(user_id);
    }

    @Override
    public int favoriteCancel(int user_id, int store_id) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("store_id", store_id);
        map.put("user_id", user_id);
        return sdao.favoriteCancel(map);

    }

    @Override
    public int cartRegister(int user_id, int p_num, int m_num) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        logger.info("ddddddddddddddddddddddddddddddddddddddddddddddddddddd" + user_id + "  " + p_num + "   " + m_num);
        map.put("user_id", user_id);
        map.put("amount", p_num);
        map.put("menu_id", m_num);
        return odao.cartRegister(map);

    }

    @Override
    public List<Cart> getCart(int user_id) {
        return odao.getCart(user_id);
    }

    @Override
    public List<Menu> getMenuForCart(int user_id) {
        return odao.getMenuForCart(user_id);

    }

    @Override
    public List<Store> getStoreForCart(int user_id) {
        return odao.getStoreForCart(user_id);

    }

    @Override
    public Integer getAmount(int user_id) {
        return odao.getAmount(user_id);
    }

    @Override
    public Integer getTotalPrice(int user_id) {
        return odao.getTotalPrice(user_id);

    }

    @Override
    public int cartDel(int cart_id) {
        return odao.cartDel(cart_id);
    }

    @Override
    public Store getStore(String reported) {
        return sdao.getStore(reported);

    }

    @Override
    public int reportStore(String subject, String content, int user_id, int store_id) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("subject", subject);
        map.put("content", content);
        map.put("user_id", user_id);
        map.put("store_id", store_id);
        return sdao.reportStore(map);
    }

    @Override
    public UserInfo getUser(String reported) {
        return udao.getUser(reported);

    }

    @Override
    public int reportUser(String subject, String content, int user_id, int user_id2) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("subject", subject);
        map.put("content", content);
        map.put("reporter", user_id);
        map.put("reported", user_id2);
        return udao.reportUser(map);

    }

    @Override
    public User getUser(int user_id) {
        return udao.getUser(user_id);
    }

    @Override
    public List<Point> getPointList(int user_id, int page, int limit) {
        logger.info("servicimpl");
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        int startrow = (page - 1) * limit + 1;
        int endrow = startrow + limit - 1;
        map.put("user_id", user_id);
        map.put("start", startrow);
        map.put("end", endrow);
        return udao.getPointList(map);
    }

    @Override
    public int pointListCount(int user_id) {
        return udao.pointListCount(user_id);
    }

    @Override
    public int getPointValue(int order_id) {
        return udao.getPointValue(order_id);
    }

    @Override
    public int checkStoreLikeAsUser(Integer user_id, int store_id) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("user_id", user_id);
        map.put("store_id", store_id);
        logger.info("스토어의 유저좋아요 유무 user_id=" + user_id + " store_id=" + store_id);
        return udao.chcekStoreLikeAsUser(map);
    }

    @Override
    public int favoriteAdd(int user_id, int store_id) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("store_id", store_id);
        map.put("user_id", user_id);
        return sdao.favoriteAdd(map);
    }

    @Override
    public int likesCount(int user_id) {
        return udao.likesCount(user_id);
    }

    @Override
    public List<Report> reportStoreAndUserList(int user_id, int page, int limit) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        int startrow = (page - 1) * limit + 1;
        int endrow = startrow + limit - 1;
        map.put("user_id", user_id);
        map.put("start", startrow);
        map.put("end", endrow);
        return udao.reportStoreAndUserList(map);
    }

    @Override
    public int getReportListCount(int user_id) {
        return udao.getReportListCount(user_id);
    }

}
