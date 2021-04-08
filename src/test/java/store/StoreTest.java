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
        List<Store> list = sqlSession.selectList("Stores.listByOwner", 3);

        for (Store s : list) {
            logger.info("Store name" + s.getStore_name());
        }
    }

    @Test
    public void createStoreMybatisTest() {
        Store s = new Store();
        s.setStore_name("test store111");
        s.setStore_tel("123-456-789");
        s.setStore_address_si("테스트시");
        s.setStore_address_dong("테스트동");
        s.setStore_desc("테스트 가게 설명입니다.");
        s.setStore_rnum("123-56-78954");
        s.setStore_saved_image("test.jpg");
        s.setStore_original_image("test.jpg");
        s.setOpening_h_w("11:00~20:00");
        s.setOpening_h_h("13:00~18:00");
        s.setHoliday("Monday");
        s.setOwner_id(3);

        int result = sqlSession.insert("Stores.createStore", s);

        if (result == 1)
            logger.info("Store Created ID : " + s.getStore_id());
    }

}
