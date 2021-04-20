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
	private UsersDAO dao;

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
		User user = dao.isEmail(user_email);
		return (user == null) ? -1 : 1;
	}

	@Override
	public int isName(String user_name) {
		UserInfo user = dao.isName(user_name);
		return (user == null) ? -1 : 1;
	}

	@Override
	public int userinsert(User user, UserInfo info) {
		int result = dao.userinsert(user);
		if (result == 1) {
			int user_id = dao.userId(user);
			info.setUser_id(user_id);
			dao.infoinsert(info);
		}
		return result;
	}

	@Override
	public int isUser(String user_email, String user_password) {
		User user = dao.isEmail(user_email);
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
		return dao.user_total_info(user_id);
	}

	@Override
	public User getUserId(String user_email) {
		return dao.getUserId(user_email);
	}

	@Override
	public int passcheck(int user_id, String user_newpassword, String user_password) {
		User userInfo = dao.userInfo(user_id);
		int result = 0;
		if (userInfo != null) {
			if (passwordEncoder.matches(user_password, userInfo.getUser_password())) {

				user_newpassword = passwordEncoder.encode(user_newpassword);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("user_id", user_id);
				map.put("user_password", user_newpassword);
				result = dao.updatePassword(map);
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
		return dao.userModify(ui);
	}

	@Override
	public List<Report> reportStoreAndComment(int user_id) {
		return dao.reportStoreAndComment(user_id);
	}

	@Override
	public int addReport(Report report) {
		return dao.addReport(report);
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
	public int cartRegister(int user_id,  int p_num, int m_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();

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
	public int getAmount(int user_id) {
		return odao.getAmount(user_id);
	}

	@Override
	public int getTotalPrice(int user_id) {
		return odao.getTotalPrice(user_id);

	}

	@Override
	public int cartDel(int cart_id) {
		return odao.cartDel(cart_id);
	}

}
