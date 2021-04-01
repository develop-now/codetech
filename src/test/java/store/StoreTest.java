package store;

import com.codetech.www.domain.Store;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class StoreTest {
    private static final Logger logger = LoggerFactory.getLogger(StoreTest.class);

    @Autowired
    private SqlSessionTemplate sqlSession;


    @Test
    public void storeCountTest() {
        int count = sqlSession.selectOne("Stores.count", 3);

        logger.info("Store count : " + count);
    }

    @Test
    public void storeListTest() {
        List<Store> list = sqlSession.selectList("Stores.list", 3);

        for (Store s : list) {
            logger.info("Store name" + s.getStore_name());
        }
    }

}
