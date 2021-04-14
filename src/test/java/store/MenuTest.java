package store;


import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Store;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MenuTest {
    private static final Logger logger = LoggerFactory.getLogger(MenuTest.class);

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Test
    public void createStoreMybatisTest() {
        Menu m = new Menu();
        m.setMenu_name("test menu111");
        m.setMenu_desc("테스트 메뉴 설명입니다.");
        m.setMenu_price("30000");
        m.setMenu_saved_image("test.jpg");
        m.setMenu_original_image("test.jpg");
        m.setStore_id(8);
        m.setCategory_id(1);

        int result = sqlSession.insert("Menus.createMenu", m);

        if (result == 1)
            logger.info("Menu Created Result Success : " + result);
    }
}