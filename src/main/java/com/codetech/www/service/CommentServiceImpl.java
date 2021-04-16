package com.codetech.www.service;

import com.codetech.www.dao.CommentDAO;
import com.codetech.www.domain.Comment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService {
    private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);

    @Autowired
    private CommentDAO comment_dao;

    @Override
    public int getCommentCountByStore(int store_id, String search_val) {
        Map<String, Object> param = new HashMap<>();

        param.put("store_id", store_id);
        if (!search_val.equals("")) {
            param.put("search_val", "%" + search_val + "%");
        }

        return comment_dao.getCommentCountByStore(param);
    }

    @Override
    public List<Comment> getCommentListByStore(int store_id, int page, int limit, String search_val) {
        Map<String, Object> param = new HashMap<>();

        int startRow = (page - 1) * limit + 1;
        int endRow = startRow + limit - 1;

        logger.info("store_id : " + store_id);
        logger.info("startRow : " + startRow);
        logger.info("endRow : " + endRow);

        param.put("store_id", store_id);
        param.put("startRow", startRow);
        param.put("endRow", endRow);
        if (!search_val.equals("")) {
            param.put("search_val", "%" + search_val + "%");
        }

        return comment_dao.getCommentByStore(param);
    }

    @Override
    @Transactional
    public int createComment(Comment comment) {
        int result = -1; // 생성 실패

        int seqUpdateResult = comment_dao.updateSeq(comment);
        logger.info("[CommentServiceImpl] seqUpdateResult : " + seqUpdateResult);

        comment.setComment_lev(comment.getComment_lev() + 1);
        comment.setComment_seq(comment.getComment_seq() + 1);
        result = comment_dao.createComment(comment);

        return result;
}

    @Override
    public List<Comment> readComment(int comment_id) {
        return comment_dao.readComment(comment_id);
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
