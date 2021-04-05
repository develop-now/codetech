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
    private String opening_h_w;
    private String opening_h_h;
    private String holiday;
    private int owner_id;
    private int store_status;

    private MultipartFile store_image;

    private String store_saved_image; // 실제 저정된 파일 이름
    private String store_original_image; // 첨부될 파일 이름

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

    public String getOpening_h_w() {
        return opening_h_w;
    }

    public void setOpening_h_w(String opening_h_w) {
        this.opening_h_w = opening_h_w;
    }

    public String getOpening_h_h() {
        return opening_h_h;
    }

    public void setOpening_h_h(String opening_h_h) {
        this.opening_h_h = opening_h_h;
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
}
