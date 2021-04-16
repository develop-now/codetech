package com.codetech.www.service;

import com.codetech.www.domain.Comment;

import java.util.List;

public interface CommentService {
    public int getCommentCountByStore(int store_id, String search_val);

    public List<Comment> getCommentListByStore(int store_id, int page, int limit, String search_val);

    public int createComment(Comment comment);

    public List<Comment> readComment(int comment_id);

    public int updateComment();

    public int deleteComment();

	public Comment getComment(int user_id);
}
