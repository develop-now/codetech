package com.codetech.www.service;

import java.util.List;

import com.codetech.www.domain.Store;


public interface OwnerService {
	
	//Stores for HomePage 
	public List<Store> getStoreForMain();

	public List<Integer> getStoreLikes();

	public List<Integer> getStoreComments();

	public List<Store> getStoreForReviewList();

	public List<Integer> getStoreCommentsReview();

	public List<Integer> getStoreLikesReview();


}
