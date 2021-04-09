package com.codetech.www.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;

import com.codetech.www.service.UsersService;

@Controller
@RequestMapping(value = "/user")
public class UsersController {
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    private UsersService usersService;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Value("${saveFolderName}")
	private String user_profile;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "user/index";
    }

    @RequestMapping(value = "/emailcheck", method = RequestMethod.GET)
    public void emailcheck(String user_email, HttpServletResponse response) throws IOException {
        int result = usersService.isEmail(user_email);
        response.setContentType("text/html;charset=utf-8");
        logger.info("emailcheck 도착" + result);
        PrintWriter out = response.getWriter();
        out.println(result);
    }


    @RequestMapping(value = "/nickcheck", method = RequestMethod.GET)
    public void nickcheck(String user_name, HttpServletResponse response) throws IOException {
        int result = usersService.isName(user_name);
        response.setContentType("text/html;charset=utf-8");
        logger.info("emailcheck 도착" + result);
        PrintWriter out = response.getWriter();
        out.println(result);
    }
    
    @RequestMapping(value="/joinpProcess", method = RequestMethod.POST)
    public void joinprocess(User user, UserInfo info, RedirectAttributes rattr)throws Exception{
    	//이미지파일 저장하기 추가
    	//메일 페이지로 이동 (가능하면 로그인 모달 열어주기)
    	String encPassword = passwordEncoder.encode(user.getUser_password());
    	user.setUser_password(encPassword);
    	
    	//파일 값 설정
    	MultipartFile uploadfile = info.getUploadfile();
    	
    	if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename();//원래 파일명
			info.setOriginalfile(fileName);//원래 파일명 저장
			logger.info("**************************************fileName*********" + fileName);
			//새로운폴더 이름: 오늘 년 + 월 + 일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); //오늘 년도 구한다.
			int month = c.get(Calendar.MONTH); //오늘 월
			int date = c.get(Calendar.DATE); //오늘 일
			
			String homedir = user_profile + year + "-" + month +"-" + date;
			logger.info(homedir);
			File path1 = new File(homedir);
			if(!(path1.exists())) {
				path1.mkdir(); //새로운 폴더를 생성
			}
			
			//난수를 구한다. -중복된 파일이 생기는 것을 방지하기 위함이다.
			Random r = new Random();
			int random = r.nextInt(1000000000);
			
			/*** 확장자 구하기 시작 ***/
			int index = fileName.lastIndexOf(".");
			//문자열에서 특정 문자열의 위치 값(index)를 반환한다.
			//indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			//lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환한다.
			//(파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴한다.)
			logger.info("index = " + index);
			
			String fileExtension = fileName.substring(index + 1);
			logger.info("fileExetension = " + fileExtension);
			/***확장자 구하기 끝***/
			
			//새로운 파일명
			String refileName = "p" + year + month + date + random + "." + fileExtension;
			logger.info("refileName =" + refileName);
			logger.info("****************새로운 파일명**********************refileName*********" + refileName);

			
			//오라클 디비에 저장될 파일명
			String fileDBName = "/" + year + "-" + month + "-"+ date + "/" + refileName;
			logger.info("fileDBName = " + fileDBName);
			logger.info("*****************오라클 디비에 저장될 파일명*********************fileDBName*********" + fileDBName);

			//@AutoWired savefolder했으니 아리를 주석달아준다. HttpServletRequest request 매개변수도 필요없으니 지워준다.
			//String saveFolder =	request.getSession().getServletContext().getRealPath("resources")+ "/upload/";
					
			
			//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장한다.
			uploadfile.transferTo(new File(user_profile + fileDBName));
			
			//바뀐 파일명으로 저장
			info.setUser_profile(fileDBName);
		}
    	int result = usersService.insert(user, info);
    	
    	if(result ==1) {
    		rattr.addFlashAttribute("infoMsg", "회원가입을 축하드립니다.");
    		//메인페이지로 리다이렉트
    		//return "redirect:";
    	}else {
    		rattr.addFlashAttribute("alertMsg","회원가입에 실패하였습니다.");
    		//메인페이지로 리다이렉트
    		//return "redirect:";
    	}
    	
    }
    
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public void login(String user_name, String user_password) {
    	//아이디 세션에 저장 후 주문하기 페이지로 이동 (가능하면 모달만 닫히고 같은 페이지에서 nav만 변경)
    }
    
    @RequestMapping(value="/infoModify",method =RequestMethod.GET)
    public void infomodify(){
    	//mapage-info_modify.jsp로 이동
    }
    
    @RequestMapping(value="/infoModifyAction", method = RequestMethod.GET)
    public void infomodify(UserInfo info) {
	   //이미지파일 변경 추가
	   //userinfo에 담아서 변경된 값 mapage-infomain으로 보내주기
    }
    
    @RequestMapping(value="/pointList", method = RequestMethod.GET)
    public void pointList(String user_id) {
    	//포인트내역 조회 한 값을 가지고 mypage-point.jsp로 이동한다.
    }
    
    @RequestMapping(value="/reportList",method = RequestMethod.GET)
    public void reportList(String user_id/*,리포트 테이블 빈*/) {
    	//신고 내역을 가지고 mypage-report.jsp로 이동
    	//신고를 당한 입장이면 어디서 확인을 하는지 체크하기
    }
    
    @RequestMapping(value="/reportDetail", method = RequestMethod.GET)
    public void reportDetail(String report_id, String user_id /*, 리포트테이블 빈*/){
    	//신고내용을 작성하지 않을경우 삭제
    }
    
    @RequestMapping(value="/reviewList", method = RequestMethod.GET)
    public void reviewList(String user_id/*,review테이블 빈*/) {
    	
    }
    
    @RequestMapping(value="/reviesWrite", method = RequestMethod.POST)
    public void reviewWrite(/*리뷰 테이블 빈*/) {
    	//리뷰 작성이동은 모달로 처리예정
    	//작성된 리뷰를 가지고 와서 테이블에 저장
    	//리뷰 리스트로 이동
    }
    
    @RequestMapping(value="/orderMain", method = RequestMethod.GET)
    public void order(int store_id) {
    	//, Store store, Menu menu /*,cart빈 생성, likes 테이블 빈*/사용
    	//가게 주문하기 클릭하면 이동되어옴, 각테이블에서 정보 가져와서
    	//jsp에서 삭제를 선택한 경우 어디로 들어가서 어떻게 처리하고 넘겨주는지 생각해보기
    	//옵션에서 선택한 값들이 있으면 rightnav에 값넘겨줘야함 map으로 정리해서 보내?
    	//옵션에 대한 총 가격들 계산은 js에서하는지 어디서 할지 생각
    	//cart에 값 담아놓기
    	//order-main.jsp로 이동
    	
    	
    }
    
   @RequestMapping(value="/option", method = RequestMethod.GET)
   public void option(int menu_id) {
	   ///*메뉴에대한 옵션 테이블 빈*/사용
	   //메뉴아이디에따른 옵션화면에 보여주기, 가게 정보도 보여줘야함
	   //ajax로 리턴값알려줄 거니까 httpResponse또는 map으로 싸서 oreder-main.jsp의 모달로 보내주기
   }
    
    @RequestMapping(value="/Cart", method = RequestMethod.GET)
    public void cart(/*cart 빈 */) {
    	//cart 빈에 담기 정보들을 불러와서 보내줘야함(가게id, menuid, optionid, amount, total) arrya사용
    	//각 메뉴에대한 개수를 넘겨받아야한다. 총금액은 이곳에서 다시 설정해서 보여준다.(메뉴수를 변경 가능하기 때문에)
    	//jsp에서 삭제를 선택한 경우 어디로 들어가서 어떻게 처리하고 넘겨주는지 생각해보기
    	//옵션에 대한 총 가격들 계산은 js에서하는지 어디서 할지 생각
    	//메뉴와 옵션에 대한 가격을 조회하기위한 option빈 사용
    	
    }
    
    @RequestMapping(value="/payment", method=RequestMethod.GET)
    public void payment(/*cart 빈*/) {
    	
    }
    
    @RequestMapping(value="/orderList", method = RequestMethod.GET)
    public void orderList(String user_id) {
    	//order조회후 order-list.jsp로 이동
    	//더보기로 내용 추가조회 가능하도록 페이지 처리
    }
    
    @RequestMapping(value="/orderDetail", method = RequestMethod.GET)
    public void orderDetail(String order_id) {
    	//상세내역 조회 후 order-list.jsp modal로 이동
    }
    
    @RequestMapping(value="/likesList", method= RequestMethod.GET)
    public void likesList(String user_id) {
    	//좋아요한 가게 리스트조회하여 order-likes.jsp로 이동 
    	//더보기로 내용 추가조회 가능하도록 페이지 처리
    }
}

