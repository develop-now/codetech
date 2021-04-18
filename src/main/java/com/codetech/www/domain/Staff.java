package com.codetech.www.domain;

public class Staff {
    private int user_id;
    private String user_email;
    private String user_name;
    private String user_status_value;
    private String created_at;

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_status_value() {
        return user_status_value;
    }

    public void setUser_status_value(String user_status_value) {
        this.user_status_value = user_status_value;
    }
}
