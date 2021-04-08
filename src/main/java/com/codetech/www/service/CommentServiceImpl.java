package com.codetech.www.service;

import com.codetech.www.dao.CommentDAO;
import com.codetech.www.domain.Comment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);

    @Autowired
    private CommentDAO dao;

    @Override
    public List<Comment> getCommentListByStore(int store_id) {
        return null;
    }

    @Override
    public int createComment(Comment comment) {
        return 0;
    }

    @Override
    public Comment readComment() {
        return null;
    }

    @Override
    public int updateComment() {
        return 0;
    }

    @Override
    public int deleteComment() {
        return 0;
    }
}
