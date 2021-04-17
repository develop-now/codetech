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
public class StaffTest {
    private static final Logger logger = LoggerFactory.getLogger(StaffTest.class);

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Test
    public void staffExistTest() {
        Map<String, Object> staff_param = new HashMap<String, Object>();

        staff_param.put("store_id", 1);
        staff_param.put("user_id", 4);

        int count = sqlSession.selectOne("Staffs.isWorker", staff_param);

        logger.info("Store count : " + count);
    }
}
