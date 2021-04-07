package com.codetech.www.dao;


import java.util.HashMap;
import java.util.List;


import com.codetech.www.domain.Store;

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

    public List<Store> getStoreForReviewList() {
        return sqlSession.selectList("Stores.forReviewList");
    }

    public List<Integer> getStoreCommentsReview() {
        return sqlSession.selectList("Stores.store_comment_forReview");
    }

    public List<Integer> getStoreLikesReview() {
        return sqlSession.selectList("Stores.store_likes_forReview");
    }

}
