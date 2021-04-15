package com.codetech.www.dao;

import com.codetech.www.domain.Comment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<Comment> getCommentByStore(int store_id){
        return sqlSession.selectList("Comments.commentListByStore", store_id);
    }
}
