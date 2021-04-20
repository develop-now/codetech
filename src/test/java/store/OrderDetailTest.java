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

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class OrderDetailTest {
    private static final Logger logger = LoggerFactory.getLogger(OrderDetailTest.class);

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Test
    public void detailTest() {
        int order_id = 9;

        Order order = sqlSession.selectOne("Orders.readOrder", order_id);
        List<OrderDetail> detail = sqlSession.selectList("Orders.readOrderDetail", order_id);

        logger.info("OrderDetailTest ORDER ID RESULT : " + order.getOrder_id());
        logger.info("OrderDetailTest MENU SIZE RESULT : " + detail.size());
    }
}
