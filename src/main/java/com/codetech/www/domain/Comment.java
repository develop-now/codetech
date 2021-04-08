package com.codetech.www.domain;

public class Comment {
    private int comment_id;
    private String comment_content;
    private int comment_lev;
    private int comment_seq;
    private String created_at;
    private String updated_at;
    private int comment_writer;
    private int comment_ref;
    private int comment_status;

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public int getComment_lev() {
        return comment_lev;
    }

    public void setComment_lev(int comment_lev) {
        this.comment_lev = comment_lev;
    }

    public int getComment_seq() {
        return comment_seq;
    }

    public void setComment_seq(int comment_seq) {
        this.comment_seq = comment_seq;
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

    public int getComment_writer() {
        return comment_writer;
    }

    public void setComment_writer(int comment_writer) {
        this.comment_writer = comment_writer;
    }

    public int getComment_ref() {
        return comment_ref;
    }

    public void setComment_ref(int comment_ref) {
        this.comment_ref = comment_ref;
    }

    public int getComment_status() {
        return comment_status;
    }

    public void setComment_status(int comment_status) {
        this.comment_status = comment_status;
    }
}
