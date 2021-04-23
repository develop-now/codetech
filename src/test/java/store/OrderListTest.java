package store;

import com.codetech.www.domain.Order;
import com.codetech.www.domain.OrderDetail;
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
public class OrderListTest {
    private static final Logger logger = LoggerFactory.getLogger(OrderListTest.class);

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Test
    public void detailTest() {
        int store_id = 1;
        String selected_date = "20210418";
        int status_id = 4;

        Map<String, Object> param = new HashMap<>();

        param.put("store_id", store_id);
        param.put("selected_date", selected_date);
        param.put("status_id", status_id);
        param.put("order_key", "order_date");
        param.put("startRow", 1);
        param.put("endRow", 5);

        int orderCount = sqlSession.selectOne("Orders.listCountAjax", param);
        List<Order> list = sqlSession.selectList("Orders.listAjax", param);

        logger.info("OrderListTest ORDER COUNT : " + orderCount);

        for (Order o : list) {
            logger.info("OrderListTest ORDER ID : " + o.getOrder_id());
        }
    }
}
