package com.codetech.www.domain;

public class Order {
    private int order_id;
    private String created_at;
    private String updated_at;
    private String order_total_price;
    private int order_user;
    private int order_status;
    private int store_id;
    private boolean comment_writable;
    private boolean comment_wrote;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
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

    public String getOrder_total_price() {
        return order_total_price;
    }

    public void setOrder_total_price(String order_total_price) {
        this.order_total_price = order_total_price;
    }

    public int getOrder_user() {
        return order_user;
    }

    public void setOrder_user(int order_user) {
        this.order_user = order_user;
    }

    public int getOrder_status() {
        return order_status;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    public int getStore_id() {
        return store_id;
    }

    public void setStore_id(int store_id) {
        this.store_id = store_id;
    }

    public boolean isComment_writable() {
        return comment_writable;
    }

    public void setComment_writable(boolean comment_writable) {
        this.comment_writable = comment_writable;
    }

    public boolean isComment_wrote() {
        return comment_wrote;
    }

    public void setComment_wrote(boolean comment_wrote) {
        this.comment_wrote = comment_wrote;
    }
}
