package com.codetech.www.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codetech.www.dao.StoreDAO;
import com.codetech.www.domain.Store;

@Service
public class OwnerServiceImpl implements OwnerService {
    private static final Logger logger = LoggerFactory.getLogger(OwnerServiceImpl.class);

    @Autowired
    private StoreDAO dao;


    @Override
    public List<Store> getStoreForMain() {
        return dao.getStoreForMain();
    }


    @Override
    public List<Integer> getStoreLikes() {
        return dao.getStoreLikes();
    }


    @Override
    public List<Integer> getStoreComments() {
        return dao.getStoreComments();
    }


    @Override
    public List<Store> getStoreForReviewList() {
        return dao.getStoreForReviewList();
    }


    @Override
    public List<Integer> getStoreCommentsReview() {
        return dao.getStoreCommentsReview();
    }


    @Override
    public List<Integer> getStoreLikesReview() {
        return dao.getStoreLikesReview();
    }
}
