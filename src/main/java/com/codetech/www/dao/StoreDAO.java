package com.codetech.www.dao;


import java.util.HashMap;
import java.util.List;


import com.codetech.www.domain.Store;
import com.codetech.www.domain.User;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class StoreDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;


    //Stores for HomePage
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

    public Store readStore(int store_id) {
        return sqlSession.selectOne("Stores.read", store_id);
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

    public List<Store> getStoreForSearchList(String searchWordLike) {
        return sqlSession.selectList("Stores.store_search", searchWordLike);

    }

    public List<Integer> getStoreLikesForSearchList(String searchWordLike) {
        return sqlSession.selectList("Stores.store_likes_forSearch", searchWordLike);

    }

    public List<Integer> getStoreCommentsForSearchList(String searchWordLike) {
        return sqlSession.selectList("Stores.store_comment_forSearch", searchWordLike);

    }

    public List<User> getAdminList() {
        return sqlSession.selectList("Users.managerList");
    }

    public List<Store> getStoreForMainList(HashMap<String, Integer> map) {
        return sqlSession.selectList("Stores.forMainList", map);

    }

    public List<Integer> getStoreLikesForMainList(HashMap<String, Integer> map) {
        return sqlSession.selectList("Stores.forMainList_Store_likes", map);

    }

    public List<Integer> getStoreCommentsForMainList(HashMap<String, Integer> map) {
        return sqlSession.selectList("Stores.forMainList_Store_comments", map);

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


}
