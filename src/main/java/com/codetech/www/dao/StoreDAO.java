package com.codetech.www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.codetech.www.domain.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    // Stores for HomePage
    public List<Store> getStoreForMain() {
        return sqlSession.selectList("Stores.forMain");
    }

    public Store storeNameCheck(String name) {
        return sqlSession.selectOne("Stores.nameCheck", name);
    }

    public int createStore(Store store) {
        return sqlSession.insert("Stores.createStore", store);
    }

    public List<Integer> getStoreLikes() {
        return sqlSession.selectList("Stores.store_likes");
    }

    public List<Integer> getStoreComments() {
        return sqlSession.selectList("Stores.store_comments");
    }

    public List<Store> getStoreListByOwner(int owner_id) {
        return sqlSession.selectList("Stores.listByOwner", owner_id);
    }

    public List<Store> getStoreListByStaff(int staff_id) {
        return sqlSession.selectList("Stores.listByStaff", staff_id);
    }

    public Store readStore(int store_id) {
        return sqlSession.selectOne("Stores.readStore", store_id);
    }

    public int storeStatusUpdate(Map<String, Object> param) {
        return sqlSession.update("Stores.updateStoreStatus", param);
    }

    public int updateStore(Store store) {
        return sqlSession.update("Stores.updateStore", store);
    }

    public List<Store> getStoreForReviewList(HashMap<String, Integer> map) {
        return sqlSession.selectList("Stores.forReviewList", map);
    }

    public List<Integer> getStoreCommentsReview() {
        return sqlSession.selectList("Stores.store_comment_forReview");
    }

    public List<Integer> getStoreLikesReview() {
        return sqlSession.selectList("Stores.store_likes_forReview");
    }

    public List<Store> getStoreForSearchList(HashMap<String, Object> map) {
        return sqlSession.selectList("Stores.store_search", map);
    }

    public List<Integer> getStoreLikesForSearchList(HashMap<String, Object> map) {
        return sqlSession.selectList("Stores.store_likes_forSearch", map);
    }

    public List<Integer> getStoreCommentsForSearchList(HashMap<String, Object> map) {
        return sqlSession.selectList("Stores.store_comment_forSearch", map);
    }

    public List<Store> getStoreForMainList(HashMap<String, Integer> map) {
        return sqlSession.selectList("Stores.forMainList", map);
    }

    public int getListCount() {
        return sqlSession.selectOne("Stores.getListCount");
    }

    public int getListCountforMainList() {
        return sqlSession.selectOne("Stores.getListCountforMainList");
    }

    public int getListCountforMainListComments() {
        return sqlSession.selectOne("Stores.getListCountforMainListComments");
    }

    public List<Integer> getStoreCommentsReview(HashMap<String, Integer> map) {
        return sqlSession.selectList("Stores.store_comment_forReview", map);
    }

    public int getListCountforSearchList(String searchWord) {
        return sqlSession.selectOne("Stores.getListCountforSearchList", searchWord);
    }

    public StoreMap getMap(String searchWordLike) {
        return sqlSession.selectOne("Stores.getMap", searchWordLike);
    }

    public Store getStore(int store_id) {
        return sqlSession.selectOne("Stores.storeInfo", store_id);
    }

    public int getStoreLike(int store_id) {
        return sqlSession.selectOne("Stores.storeLikeCount", store_id);
    }

    public int getStoreCustomerCount(int store_id) {
        return sqlSession.selectOne("Stores.storeCustomerCount", store_id);
    }

    public List<Customer> getStoreCustomer(Map<String, Object> param) {
        return sqlSession.selectList("Stores.storeCustomer", param);
    }

    public List<Profit> getStoreProfit(Map<String, Object> param) {
        return sqlSession.selectList("Stores.storeProfit", param);
    }

}
