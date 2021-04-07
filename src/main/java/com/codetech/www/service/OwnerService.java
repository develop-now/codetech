package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.Store;
import com.codetech.www.domain.User;


public interface OwnerService {
	
	//Stores for HomePage 
	public List<Store> getStoreForMain();

	public List<Integer> getStoreLikes();

	public List<Integer> getStoreComments();

	public List<Store> getStoreForReviewList();

	public List<Integer> getStoreCommentsReview();

	public List<Integer> getStoreLikesReview();

	public List<Store> getStoreForSearchList(String searchWord);

	public List<Integer> getStoreLikesForSearchList(String searchWord);

	public List<Integer> getStoreCommentsForSearchList(String searchWord);

	public List<User> getAdminList();

	public List<Store> getStoreForMainList(int page, int limit);

	public List<Integer> getStoreLikesForMainList();

	public List<Integer> getStoreCommentsForMainList();

	public int getListCount();


}
