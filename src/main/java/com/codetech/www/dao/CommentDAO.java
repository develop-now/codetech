package com.codetech.www.dao;

import com.codetech.www.domain.Comment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CommentDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public int getCommentCountByStore(Map<String, Object> param) {
        return sqlSession.selectOne("Comments.commentCountByStore", param);
    }

    public List<Comment> getCommentByStore(Map<String, Object> param) {
        return sqlSession.selectList("Comments.commentListByStore", param);
    }

    public List<Comment> readComment(int comment_id) {
        return sqlSession.selectList("Comments.read", comment_id);
    }

    public int updateSeq(Comment comment) {
        return sqlSession.update("Comments.updateSeq", comment);
    }

    public int createComment(Comment comment) {
        return sqlSession.insert("Comments.create", comment);
    }

    public int updateComment(Map<String, Object> param){
        return sqlSession.update("Comments.update", param);
    }


}
