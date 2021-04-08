package com.codetech.www.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codetech.www.dao.StoreDAO;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.User;

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
    public List<Store> getStoreForReviewList(int page, int limit) {
    	HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
        return dao.getStoreForReviewList(map);
    }


    @Override
    public List<Integer> getStoreCommentsReview(int page, int limit) {
    	HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
        return dao.getStoreCommentsReview(map);
    }




	@Override
	public List<Store> getStoreForSearchList(String searchWord) {
		String searchWordLike = "%" + searchWord + "%";
		return dao.getStoreForSearchList(searchWordLike);

	}


	@Override
	public List<Integer> getStoreLikesForSearchList(String searchWord) {
		String searchWordLike = "%" + searchWord + "%";
		return dao.getStoreLikesForSearchList(searchWordLike);
	}


	@Override
	public List<Integer> getStoreCommentsForSearchList(String searchWord) {
		String searchWordLike = "%" + searchWord + "%";
		return dao.getStoreCommentsForSearchList(searchWordLike);
	}


	@Override
	public List<User> getAdminList() {
		return dao.getAdminList();
	}


	@Override
	public List<Store> getStoreForMainList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getStoreForMainList(map);
	}


	@Override
	public List<Integer> getStoreLikesForMainList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getStoreLikesForMainList(map);
	}


	@Override
	public List<Integer> getStoreCommentsForMainList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getStoreCommentsForMainList(map);
	}


	@Override
	public int getListCount() {
		return dao.getListCount();

	}
	
	@Override
	public int getListCountforMainList() {
		return dao.getListCountforMainList();

	}
	
	@Override
	public int getListCountforMainListComments() {
		return dao.getListCountforMainListComments();

	}


    @Override
    public List<Integer> getStoreLikesReview() {
        return dao.getStoreLikesReview();
    }

}
