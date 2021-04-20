package com.codetech.www.service;

import com.codetech.www.dao.CommentDAO;
import com.codetech.www.domain.Comment;
import com.codetech.www.domain.Report;

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
    public int updateComment(int comment_id, String comment_content) {
        Map<String, Object> param = new HashMap<>();

        param.put("comment_id", comment_id);
        param.put("comment_content", comment_content);

        return comment_dao.updateComment(param);
    }

    @Override
    public int deleteComment(int comment_id) {
        Map<String, Object> param = new HashMap<>();

        param.put("comment_id", comment_id);
        param.put("comment_status", "inactive");

        return comment_dao.updateComment(param);
    }

    @Override
    public int reportComment(int comment_id, String report_content) {
        return 0;
    }


	@Override
	public Comment selectComment(int comment_id) {
		return comment_dao.selectComment(comment_id);
	}

	@Override
	public Report readCommentReport(int cmt_report_id) {
		return comment_dao.readCommentReport(cmt_report_id);
	}


    @Override
    public Comment getComment(int user_id) {
        return comment_dao.getComment(user_id);
    }

	@Override
	public List<Comment> getUserCommentList(int user_id, int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//id리스트를 받아와서 스트링 배열이 넣고 그 배열을 map으로 보내준 뒤 mapper 에서 foreach로 가게 부분을 돌려준다.
		int endcount = page * 4;
		logger.info("-------------ajax페이지 ========================" + endcount);
		map.putIfAbsent("user_id",user_id);
		map.put("start",1);
		map.put("end", endcount);
		return comment_dao.getUserCommentList(map);
	}

	@Override
	public int getCommentCountByUser(int user_id) {
		return comment_dao.getCommentCountByUser(user_id);
	}

}
