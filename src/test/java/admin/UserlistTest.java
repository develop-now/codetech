package admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.codetech.www.domain.Notice;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserlistTest {
	 private static final Logger logger = LoggerFactory.getLogger(UserlistTest.class);

	 @Autowired
	 private SqlSessionTemplate sqlSession;
	 
	 //@Test
	 public void getSearchListCount() {
		 Map<String, Object> map = new HashMap<String, Object>();
		   
		 map.put("search_field", "user_name");
		 map.put("check_state", 1);
		 map.put("search_word", "%user%");
		 
		 int count = sqlSession.selectOne("Admin.searchCount", map);
		 
		 logger.info("User Count: " + count + "개");
		 
		 map.put("start", 1);
		 map.put("end", 3);
		 
		 List<UserPlusInfo> Userlist = sqlSession.selectList("Admin.getUsersSearchList", map);
		   
		 for (UserPlusInfo result : Userlist) {
			 logger.info("번호: " + result.getUser_id());
			 logger.info("이메일: " + result.getUser_email());
			 logger.info("가입일: " + result.getCreated_at());
			 logger.info("수정일: " + result.getUpdated_at());
			 logger.info("이름: " + result.getUser_name());
			 logger.info("포인트: " + result.getPoint());
			 logger.info("전화번호: " + result.getUser_tel());
			 logger.info("주소: " + result.getUser_address());
			 logger.info("주소: " + result.getUser_status());
		 }
	 }
	 
	 @Test
	 public void getNoticeListCount() {
		 Map<String, Object> map = new HashMap<String, Object>();
		String[] notice_status = new String[] { "1", "2", "3" };
				
		// 0 넘어오면 공지사항, 1 넘어오면 이벤트, 2 넘어오면 점검사항
		map.put("notice_status", notice_status[1]);
		map.put("search_text", "%%");
		 
		 int count = sqlSession.selectOne("Admin.getNoticeListCount", map);
		 
		 logger.info("Notice Count: " + count + "개");
		 
		 map.put("start", 1);
		 map.put("end", 3);
		 
		 List<Notice> Userlist = sqlSession.selectList("Admin.getNoticeList", map);
		   
		 for (Notice result : Userlist) {
			 logger.info("번호: " + result.getNotice_id());
			 logger.info("제목: " + result.getNotice_subject());
			 logger.info("내용: " + result.getNotice_content());
			 logger.info("글 상태: " + result.getNotice_status());
			 logger.info("날짜: " + result.getNotice_date());
			 logger.info("조회수: " + result.getNotice_readcount());
			 logger.info("세이브: " + result.getNotice_saved_image());
			 logger.info("오리지날: " + result.getNotice_original_image());
		 }
	 }
}
