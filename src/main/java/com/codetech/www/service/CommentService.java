package com.codetech.www.service;

import com.codetech.www.domain.Comment;

import java.util.List;

public interface CommentService {
    public List<Comment> getCommentListByStore(int store_id);

    public int createComment(Comment comment);

    public Comment readComment();

    public int updateComment();

    public int deleteComment();
}
