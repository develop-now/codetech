package com.codetech.www.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;
import com.codetech.www.service.UsersService;

@Controller
@RequestMapping(value = "/user")
public class UsersController {
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    private UsersService usersService;

    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private HttpSession session;
    
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

    @RequestMapping(value = "/joinProcess", method = RequestMethod.POST)
    public String joinprocess(
            User user, UserInfo info, RedirectAttributes rattr) throws Exception {

        logger.info("여기는 joinProcess");

        //이미지파일 저장하기 추가
        //메일 페이지로 이동 (가능하면 로그인 모달 열어주기)

        MultipartFile uploadfile = info.getUploadfile();

        logger.info("입력한 password 값 : " + user.getUser_password());

        /* 비밀번호 난수로 저장 */
        String encPassword = passwordEncoder.encode(user.getUser_password());
        user.setUser_password(encPassword);
        logger.info("passenc" + encPassword);

        if (!uploadfile.isEmpty()) {
            String fileName = uploadfile.getOriginalFilename();//원래 파일명
            info.setOriginal_file(fileName);//원래 파일명 저장
            logger.info("*********fileName*********" + fileName);

            /* 업로드 될 폴더명 생성 */
            Calendar c = Calendar.getInstance();
            String yearO = c.get(Calendar.YEAR) + "";
            int year = Integer.parseInt(yearO.substring(2, 4));
            int month = c.get(Calendar.MONTH) + 1;
            int date = c.get(Calendar.DATE);

            String homedir = user_profile + "/" + year + "-" + month + "-" + date;
            logger.info(homedir);
            File path1 = new File(homedir);
            if (!(path1.exists())) {
                path1.mkdir();
            }

            /* 중복된 파일이 생기는것을 방지하기위한 난수 생성 */
            Random r = new Random();
            int random = r.nextInt(1000000000);

            /* 확장자구하기 */
            int index = fileName.lastIndexOf(".");
            logger.info("index = " + index);

            String fileExtension = fileName.substring(index + 1);
            logger.info("fileExetension = " + fileExtension);


            /* 새로운 파일명 */
            String refileName = "p" + year + month + date + random + "." + fileExtension;
            logger.info("refileName =" + refileName);
            logger.info("****************새로운 파일명***********refileName*********" + refileName);


            /* 오라클 디비에 저장될 파일명 */
            String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
            logger.info("fileDBName = " + fileDBName);
            logger.info("*************오라클 디비에 저장될 파일명**********fileDBName*********" + fileDBName);

            uploadfile.transferTo(new File(user_profile + fileDBName));

            /* 바뀐 파일명으로 저장 */
            info.setUser_profile(fileDBName);
        }

        int result1 = usersService.userinsert(user, info);


        if (result1 == 1) {
            rattr.addFlashAttribute("info", "회원가입을 축하드립니다.");
            return "redirect:/home";
        } else {
            rattr.addFlashAttribute("alert", "회원가입에 실패하였습니다.");
            return "redirect:/home";
        }
    }

    
    @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
    public String login(String user_id, String user_password
            , RedirectAttributes rattr, HttpSession session) {
        //아이디 세션에 저장 후 주문하기 페이지로 이동 (가능하면 모달만 닫히고 같은 페이지에서 nav만 변경)

        /* 아이디 유무 확인 */
        int result = usersService.isUser(user_id, user_password);
        logger.info("isUser result : " + result);
        if (result == 1) {
            /* id와 password를 session에 저장후 home으로 이동 */
//            session.setAttribute("user_id", user_id);
            rattr.addFlashAttribute("info", "로그인 되었습니다 session ID:" + session.getId());
            return "redirect:/home";
        } else {
            if (result == 0) {
                rattr.addFlashAttribute("alert", "비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해 주세요.");
                return "redirect:/home";
            } else {
                rattr.addFlashAttribute("alert", "해당 아이디가 없습니다. 아이디를 확인 해 주세요.");
                return "redirect:/home";
            }
        }
    }
	  @RequestMapping(value="/infoMain",method =RequestMethod.GET)
	  public  String infomain(String user_id, HttpServletRequest request, RedirectAttributes rattr){ 
		//session id확인해서  그아이디에 해당하는 정보를 가지고 돌아간다. 
		  //TODO 회원 정보, 토탈포인트, 작성된 리뷰수review, 즐겨찾기 한 가게 수 값  전달하기likes 
		/*
		 * Integer sessionId = (Integer) session.getAttribute("user_id"); String url="";
		 * if(sessionId == null||!request.isRequestedSessionIdValid()) {
		 * rattr.addFlashAttribute("alert", "로그인이 필요한 서비스 입니다."); return
		 * "redirect:/home";
		 * 
		 * }else {
		  int user_id= (int)sessionId;
		 */
		  //클릭하고들어오면 user_id 값을 구한다.
		   int id = (int)session.getAttribute("id");
		   logger.info("=============세션에서 가져온  id=================" + id);
		  //구한 user_id값을 가지고 해당 info와 users테이블을 조회한다.
		  //조회한 값을 userplusinfo에 답아서 반환한다.
		  //좋아요 한 카페수를 전역으로 선언하고 map으로 반환해준다.
		  //UserPlusInfo upi = usersService.user_info(user_id); //리뷰수, 즐겨찾기한 가게 수 맵으로 가져오기(조인사용)
		 
		// mv.addAttribute("userinfo", upi);
		  return "user/mypage-infomain";
	 // }
	}
	 
  
	@RequestMapping(value="/infoModify",method =RequestMethod.GET)
	public String infomodify(int user_id, RedirectAttributes rattr){
	//mapage-info_modify.jsp로 이동
	String url = "";
	
		 url = "user/mypage-infomain_modify";
	
		//세션이 만료되었으니 로그인을 다시하라는 안내를 해준다.
	
	return url;
    }

    @RequestMapping(value = "/infoModifyAction", method = RequestMethod.GET)
    public void infomodify(UserInfo info) {
        //이미지파일 변경 추가
        //userinfo에 담아서 변경된 값 mapage-infomain으로 보내주기
    }

    @RequestMapping(value = "/pointList", method = RequestMethod.GET)
    public String pointList(String user_id) {
        //포인트내역 조회 한 값을 가지고 mypage-point.jsp로 이동한다
    	String url = "";
    	
		 url = "user/mypage-point";
	
		//세션이 만료되었으니 로그인을 다시하라는 안내를 해준다.
	
	return url;
    }

    @RequestMapping(value = "/reportList", method = RequestMethod.GET)
    public String reportList(String user_id/*,리포트 테이블 빈*/) {
        //신고 내역을 가지고 mypage-report.jsp로 이동
        //신고를 당한 입장이면 어디서 확인을 하는지 체크하기
    	String url = "";
    	
		 url = "user/mypage-report";
	
	
	return url;
    }

    @RequestMapping(value = "/reportDetail", method = RequestMethod.GET)
    public void reportDetail(String report_id, String user_id /*, 리포트테이블 빈*/) {
        //신고내용을 작성하지 않을경우 삭제
    }

    @RequestMapping(value = "/reviewList", method = RequestMethod.GET)
    public String reviewList(String user_id/*,review테이블 빈*/) {
    	String url = "";
    	
		 url = "user/mypage-review";
	
	
	return url;
    }

    @RequestMapping(value = "/reviesWrite", method = RequestMethod.POST)
    public void reviewWrite(/*리뷰 테이블 빈*/) {
        //리뷰 작성이동은 모달로 처리예정
        //작성된 리뷰를 가지고 와서 테이블에 저장
        //리뷰 리스트로 이동
    }

    @RequestMapping(value = "/orderMain", method = RequestMethod.GET)
    public void order(int store_id) {
        //, Store store, Menu menu /*,cart빈 생성, likes 테이블 빈*/사용
        //가게 주문하기 클릭하면 이동되어옴, 각테이블에서 정보 가져와서
        //jsp에서 삭제를 선택한 경우 어디로 들어가서 어떻게 처리하고 넘겨주는지 생각해보기
        //옵션에서 선택한 값들이 있으면 rightnav에 값넘겨줘야함 map으로 정리해서 보내?
        //옵션에 대한 총 가격들 계산은 js에서하는지 어디서 할지 생각
        //cart에 값 담아놓기
        //order-main.jsp로 이동


    }

    @RequestMapping(value = "/option", method = RequestMethod.GET)
    public void option(int menu_id) {
        ///*메뉴에대한 옵션 테이블 빈*/사용
        //메뉴아이디에따른 옵션화면에 보여주기, 가게 정보도 보여줘야함
        //ajax로 리턴값알려줄 거니까 httpResponse또는 map으로 싸서 oreder-main.jsp의 모달로 보내주기
    }
    
    @RequestMapping(value="/cart", method = RequestMethod.GET)
    public void cart(/*cart 빈 */) {
        //cart 빈에 담기 정보들을 불러와서 보내줘야함(가게id, menuid, optionid, amount, total) arrya사용
        //각 메뉴에대한 개수를 넘겨받아야한다. 총금액은 이곳에서 다시 설정해서 보여준다.(메뉴수를 변경 가능하기 때문에)
        //jsp에서 삭제를 선택한 경우 어디로 들어가서 어떻게 처리하고 넘겨주는지 생각해보기
        //옵션에 대한 총 가격들 계산은 js에서하는지 어디서 할지 생각
        //메뉴와 옵션에 대한 가격을 조회하기위한 option빈 사용

    }

    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public void payment(/*cart 빈*/) {

    }

    @RequestMapping(value = "/orderList", method = RequestMethod.GET)
    public void orderList(String user_id) {
        //order조회후 order-list.jsp로 이동
        //더보기로 내용 추가조회 가능하도록 페이지 처리
    }

    @RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
    public void orderDetail(String order_id) {
        //상세내역 조회 후 order-list.jsp modal로 이동
    }

    @RequestMapping(value = "/likesList", method = RequestMethod.GET)
    public void likesList(String user_id) {
        //좋아요한 가게 리스트조회하여 order-likes.jsp로 이동
        //더보기로 내용 추가조회 가능하도록 페이지 처리
    }
}

