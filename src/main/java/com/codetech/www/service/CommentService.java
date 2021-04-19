package com.codetech.www.service;

import com.codetech.www.domain.Comment;
import com.codetech.www.domain.Report;

import java.util.List;

public interface CommentService {
    public int getCommentCountByStore(int store_id, String search_val);

    public List<Comment> getCommentListByStore(int store_id, int page, int limit, String search_val);

    public int createComment(Comment comment);

    public List<Comment> readComment(int comment_id);

    public int updateComment(int comment_id, String comment_content);

    public int deleteComment(int comment_id);

    public int reportComment(int comment_id, String report_content);

    public Comment getComment(int user_id);

	public Comment selectComment(int comment_id);

	public Report readCommentReport(int cmt_report_id);

	public List<Comment> getUserCommentList(int user_id, int page);

	public int getCommentCountByUser(int user_id);


}
