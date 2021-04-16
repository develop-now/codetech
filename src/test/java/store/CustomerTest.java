package store;

import com.codetech.www.domain.Customer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustomerTest {
    private static final Logger logger = LoggerFactory.getLogger(CustomerTest.class);

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Test
    public void customerListTest() {
        int store_id = 1;
        int page = 1;
        String order_key = "order_count";
//        String order_key = "customer_name";

        Map<String, Object> param = new HashMap<>();

        param.put("store_id", store_id);
        param.put("order_key", order_key);
        param.put("startRow", 1);
        param.put("endRow", page * 5);

        List<Customer> list = sqlSession.selectList("Stores.storeCustomer", param);

        for (Customer c : list) {
            logger.info("==============================");
            logger.info("Customer Name : " + c.getCustomer_name());
            logger.info("Customer Order Count : " + c.getOrder_count());
            logger.info("==============================");
        }

    }
}
