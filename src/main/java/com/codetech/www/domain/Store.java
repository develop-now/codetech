package com.codetech.www.domain;

import org.springframework.web.multipart.MultipartFile;

public class Store {
    private int store_id;
    private String store_name;
    private String store_tel;
    private String store_address_si;
    private String store_address_gu;
    private String store_address_dong;
    private String store_address_etc;
    private String store_desc;
    private String store_rnum;
    private int report_count;
    private String created_at;
    private String updated_at;
    private String opening_h_w_open;
    private String opening_h_w_close;
    private String opening_h_h_open;
    private String opening_h_h_close;
    private String holiday;
    private int owner_id;
    private int store_status;

    private int like_count;
    private int comment_count;



    public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	private MultipartFile store_image;

    private String store_saved_image; // 실제 저정된 파일 이름
    private String store_original_image; // 첨부될 파일 이름

    private String store_status_value;


    public int getStore_like() {
        return store_like;
    }

    public void setStore_like(int store_like) {
        this.store_like = store_like;
    }

    public int getStore_comment() {
        return store_comment;
    }

    public void setStore_comment(int store_comment) {
        this.store_comment = store_comment;
    }

    public int getStore_id() {
        return store_id;
    }

    public void setStore_id(int store_id) {
        this.store_id = store_id;
    }

    public String getStore_name() {
        return store_name;
    }

    public void setStore_name(String store_name) {
        this.store_name = store_name;
    }

    public String getStore_tel() {
        return store_tel;
    }

    public void setStore_tel(String store_tel) {
        this.store_tel = store_tel;
    }

    public String getStore_address_si() {
        return store_address_si;
    }

    public void setStore_address_si(String store_address_si) {
        this.store_address_si = store_address_si;
    }

    public String getStore_address_gu() {
        return store_address_gu;
    }

    public void setStore_address_gu(String store_address_gu) {
        this.store_address_gu = store_address_gu;
    }

    public String getStore_address_dong() {
        return store_address_dong;
    }

    public void setStore_address_dong(String store_address_dong) {
        this.store_address_dong = store_address_dong;
    }

    public String getStore_address_etc() {
        return store_address_etc;
    }

    public void setStore_address_etc(String store_address_etc) {
        this.store_address_etc = store_address_etc;
    }

    public String getStore_desc() {
        return store_desc;
    }

    public void setStore_desc(String store_desc) {
        this.store_desc = store_desc;
    }

    public String getStore_rnum() {
        return store_rnum;
    }

    public void setStore_rnum(String store_rnum) {
        this.store_rnum = store_rnum;
    }

    public int getReport_count() {
        return report_count;
    }

    public void setReport_count(int report_count) {
        this.report_count = report_count;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public String getOpening_h_w_open() {
        return opening_h_w_open;
    }

    public void setOpening_h_w_open(String opening_h_w_open) {
        this.opening_h_w_open = opening_h_w_open;
    }

    public String getOpening_h_w_close() {
        return opening_h_w_close;
    }

    public void setOpening_h_w_close(String opening_h_w_close) {
        this.opening_h_w_close = opening_h_w_close;
    }

    public String getOpening_h_h_open() {
        return opening_h_h_open;
    }

    public void setOpening_h_h_open(String opening_h_h_open) {
        this.opening_h_h_open = opening_h_h_open;
    }

    public String getOpening_h_h_close() {
        return opening_h_h_close;
    }

    public void setOpening_h_h_close(String opening_h_h_close) {
        this.opening_h_h_close = opening_h_h_close;
    }

    public String getHoliday() {
        return holiday;
    }

    public void setHoliday(String holiday) {
        this.holiday = holiday;
    }

    public int getOwner_id() {
        return owner_id;
    }

    public void setOwner_id(int owner_id) {
        this.owner_id = owner_id;
    }

    public int getStore_status() {
        return store_status;
    }

    public void setStore_status(int store_status) {
        this.store_status = store_status;
    }

    public MultipartFile getStore_image() {
        return store_image;
    }

    public void setStore_image(MultipartFile store_image) {
        this.store_image = store_image;
    }

    public String getStore_saved_image() {
        return store_saved_image;
    }

    public void setStore_saved_image(String store_saved_image) {
        this.store_saved_image = store_saved_image;
    }

    public String getStore_original_image() {
        return store_original_image;
    }

    public void setStore_original_image(String store_original_image) {
        this.store_original_image = store_original_image;
    }

    public String getStore_status_value() {
        return store_status_value;
    }

    public void setStore_status_value(String store_status_value) {
        this.store_status_value = store_status_value;
    }
}
