package com.codetech.www.domain;

public class Menu {
    private int menu_id;
    private String menu_name;
    private String menu_desc;
    private String menu_price;
    private String menu_image;
    private int menu_read_count;
    private int menu_order_count;
    private String created_at;
    private String updated_at;
    private int store_id;
    private int category_id;
    private int menu_status;

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public String getMenu_desc() {
        return menu_desc;
    }

    public void setMenu_desc(String menu_desc) {
        this.menu_desc = menu_desc;
    }

    public String getMenu_price() {
        return menu_price;
    }

    public void setMenu_price(String menu_price) {
        this.menu_price = menu_price;
    }

    public String getMenu_image() {
        return menu_image;
    }

    public void setMenu_image(String menu_image) {
        this.menu_image = menu_image;
    }

    public int getMenu_read_count() {
        return menu_read_count;
    }

    public void setMenu_read_count(int menu_read_count) {
        this.menu_read_count = menu_read_count;
    }

    public int getMenu_order_count() {
        return menu_order_count;
    }

    public void setMenu_order_count(int menu_order_count) {
        this.menu_order_count = menu_order_count;
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

    public int getStore_id() {
        return store_id;
    }

    public void setStore_id(int store_id) {
        this.store_id = store_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getMenu_status() {
        return menu_status;
    }

    public void setMenu_status(int menu_status) {
        this.menu_status = menu_status;
    }
}
