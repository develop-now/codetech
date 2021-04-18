package store;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CommentTest {
    private static final Logger logger = LoggerFactory.getLogger(CommentTest.class);

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Test
    public void commentListTest() {
        int store_id = 1;
        String search_val = "r2";

        Map<String, Object> param = new HashMap<>();

        param.put("store_id", store_id);
        if (!search_val.equals("")) {
            param.put("search_val", "%" + search_val + "%");
        }

        int count = sqlSession.selectOne("Comments.commentCountByStore", param);

        logger.info("COMMENT COUNT : " + count);
    }
}
