package user;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.codetech.www.domain.Comment;
import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Point;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.UserPlusInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
		  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	      "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class UserControllerTest {
		private static final Logger logger = LoggerFactory.getLogger(UserControllerTest.class);
		
		@Autowired
		private WebApplicationContext webApplicationContext;
		
		private MockMvc mockMvc;
		
		@Autowired
		private SqlSessionTemplate sqlsession;
		
			@Before
		    public void setup() {
		        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webApplicationContext).build();
		        logger.info("========== SET UP ==========");
		    }
			
			//@Test
			public void userJoinProcessTest() throws Exception{
				MockMultipartFile file 
			      = new MockMultipartFile(
			        "file", 
			        "hello.txt", 
			        MediaType.TEXT_PLAIN_VALUE, 
			        "Hello, World!".getBytes()
			      );

			    MockMvc mockMvc 
			      = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
			    mockMvc.perform(multipart("/user/joinProcess").file(file))
			      .andExpect(status().isOk());
			}
		 //@Test
		 public void infolist() {
			int user_id = 5;
			
			
			UserPlusInfo upi = sqlsession.selectOne("users.userTotalInfo", user_id);
			logger.info("getUser_email: " + upi.getUser_email());
			logger.info("getUser_name: " + upi.getUser_name());
			logger.info("getUser_address: " + upi.getUser_address());
			logger.info("getUser_tel: " + upi.getUser_tel());
			logger.info("getUser_profile: " + upi.getUser_profile());
			logger.info("getOriginalfile: "+ upi.getOriginal_file());
			logger.info("getPoint: " + upi.getPoint());
		 }
		 
		 //@Test
		 public void usercommentcount() {
			 int user_id=5;
			 int count = sqlsession.selectOne("Comments.commentCountByUser", user_id);
			 logger.info("--------------------5번 유저 댓글 수"+count);
		 }
		// @Test
		 public void commentIdList() {
			 int user_id=5;
		/*
		 * CommentArray ca= sqlsession.selectOne("Comments.getComment", user_id);
		 * for(int i : ca.getComment_id()) { logger.info("인덱스1"+i);
		 * 
		 * }
		 */
	 }
		 //@Test
		 public void commentListWithStoreName() {
			 int user_id =5;
			 int page = 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		int endcount = page *4;
		map.putIfAbsent("user_id",user_id);
		map.put("start",1);
		map.put("end", endcount);
		List<Comment> list = sqlsession.selectList("Comments.userCommentList", map);
		
		for (Comment r : list) {
			logger.info("이메일: " + r);
			logger.info("이름 : " + r.getComment_store_value());
			logger.info("==========================");
		}
		
		 }
		//@Test
		 public void insertPoint() {
			 int total = 456789;
			 Point point = new Point();
	        	point.setPoint_value(300);
	        	point.setOrder_id(68);
	        	point.setStore_id(1);
	        	point.setUser_id(5);
	        	point.setPoint_type("get");
	        	int result = sqlsession.insert("Orders.insertPoint", point);
	        	logger.info("========== point 10% 삽입결과"+ result);
		 }
		 //@Test
		 public void updateUserInfoPoint() {
			 Map<String, Object> map = new HashMap<String, Object>();
				map.put("user_id",5);
				map.put("point",4567);
				int result = sqlsession.update("users.updatePoint", map);
	        	logger.info("========== userinfo update 결과"+ result);

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
