package store;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Store;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class StoreControllerTest {
    private static final Logger logger = LoggerFactory.getLogger(StoreControllerTest.class);

    @Autowired
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webApplicationContext).build();
        logger.info("========== SET UP ==========");
    }

    @Test
    public void createStoreControllerTest() throws Exception {
        logger.info("========== createStoreControllerTest() 시작 ==========");

        Store s = new Store();
        s.setStore_name("test store111");
        s.setStore_tel("123-456-789");
        s.setStore_address_si("테스트시");
        s.setStore_address_dong("테스트동");
        s.setStore_desc("테스트 가게 설명입니다.");
        s.setStore_rnum("123-56-78954");
        s.setStore_saved_image("test.jpg");
        s.setStore_original_image("test.jpg");
        s.setHoliday("Monday");
        s.setOwner_id(3);

        Menu m = new Menu();

        String opening_h_w_start = "09:00";
        String opening_h_w_end = "18:00";
        String opening_h_h_start = "11:00";
        String opening_h_h_end = "17:00";

        try {
            mockMvc.perform(get("/store/createAction").param("id", "User14"))
                    .andDo(print())
                    .andExpect(status().isOk());
            logger.info(">>>>>>>>>> 테스트 수행 성공 >>>>>>>>>>");
        } catch (Exception e) {
            logger.info(">>>>>>>>>> 테스트 수행 실패 >>>>>>>>>>" + e.getMessage());
        }
    }
}
