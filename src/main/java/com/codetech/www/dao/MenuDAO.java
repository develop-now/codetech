package com.codetech.www.dao;

import com.codetech.www.domain.Menu;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MenuDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public int createMenu(Menu menu) {
        return sqlSession.insert("Menus.createMenu", menu);
    }

    public Menu readMenu(int menu_id) {
        return sqlSession.selectOne("Menus.read", menu_id);
    }

    public int updateMenu(Menu menu) {
        return sqlSession.update("Menus.updateMenu", menu);
    }

    public List<Menu> getMenuListByStore(int store_id) {
        return sqlSession.selectList("Menus.listByStore", store_id);
    }

    public List<Menu> getMenuListByOwner(int owner_id) {
        return sqlSession.selectList("Menus.listByOwner", owner_id);
    }

    public int menuStatusUpdate(Map<String, Object> param) {
        return sqlSession.update("Menus.menuStatusUpdate", param);
    }

    public List<Menu> getTopMenu(int store_id) {
        return sqlSession.selectList("Menus.topMenu", store_id);
    }

    public List<Menu> getAllMenu(int store_id) {
        return sqlSession.selectList("Menus.allMenu", store_id);
    }

    public int getMenuCount(int store_id) {
        return sqlSession.selectOne("Menus.menuCount", store_id);
    }

	public int plusOrderCount(int menu_id) {
		return sqlSession.update("Menus.plusOrderCount", menu_id);

	}
	
	public int getStoreId(int menu_id) {
		return sqlSession.selectOne("Menus.getStoreId", menu_id);
	}
	
	public int delCartList(int menu_id) {
		return sqlSession.update("Menus.delCartList", menu_id);
	}

	
}
