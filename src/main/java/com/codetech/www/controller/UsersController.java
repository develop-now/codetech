package com.codetech.www.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codetech.www.domain.Cart;
import com.codetech.www.domain.Comment;
import com.codetech.www.domain.MailVO;
import com.codetech.www.domain.Menu;
import com.codetech.www.domain.MiniCart;
import com.codetech.www.domain.Order;
import com.codetech.www.domain.OrderDetail;
import com.codetech.www.domain.Point;
import com.codetech.www.domain.Report;
import com.codetech.www.domain.Store;
import com.codetech.www.domain.User;
import com.codetech.www.domain.UserInfo;
import com.codetech.www.domain.UserPlusInfo;
import com.codetech.www.service.CommentService;
import com.codetech.www.service.StoreService;
import com.codetech.www.service.UsersService;
import com.codetech.www.task.SendMail;
import com.sun.xml.internal.ws.api.ha.StickyFeature;

@Controller
@RequestMapping(value = "/user")
public class UsersController {
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    private UsersService usersService;

    @Autowired
    private StoreService storeService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private HttpSession session;

    @Autowired
    private SendMail sendMail;

    @Value("${saveFolderName}")
    private String saveFolder;

    private int likesCount;

    private int reviewCount;

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
    public String joinprocess(User user, UserInfo info, RedirectAttributes rattr) throws Exception {

        logger.info("여기는 joinProcess");

        // 이미지파일 저장하기 추가
        // 메일 페이지로 이동 (가능하면 로그인 모달 열어주기)

        MultipartFile uploadfile = info.getUploadfile();

        logger.info("입력한 password 값 : " + user.getUser_password());

        /* 비밀번호 난수로 저장 */
        String encPassword = passwordEncoder.encode(user.getUser_password());
        user.setUser_password(encPassword);
        logger.info("passenc" + encPassword);

        if (!uploadfile.isEmpty()) {
            String fileName = uploadfile.getOriginalFilename();// 원래 파일명
            info.setOriginal_file(fileName);// 원래 파일명 저장
            logger.info("*********fileName*********" + fileName);

            /* 업로드 될 폴더명 생성 */
            Calendar c = Calendar.getInstance();
            String yearO = c.get(Calendar.YEAR) + "";
            int year = Integer.parseInt(yearO.substring(2, 4));
            int month = c.get(Calendar.MONTH) + 1;
            int date = c.get(Calendar.DATE);

            String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
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

            uploadfile.transferTo(new File(saveFolder + fileDBName));

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
    public String login(String user_id, String user_password, RedirectAttributes rattr, HttpSession session) {
        // 아이디 세션에 저장 후 주문하기 페이지로 이동 (가능하면 모달만 닫히고 같은 페이지에서 nav만 변경)

        /* 아이디 유무 확인 */
        int result = usersService.isUser(user_id, user_password);
        logger.info("isUser result : " + result);
        if (result == 1) {
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

    @RequestMapping(value = "/infoMain", method = RequestMethod.GET)
    public ModelAndView infomain(ModelAndView mv) {
        Integer user_id = (Integer) session.getAttribute("user_id");
        logger.info("=============세션에서 가져온  id=================" + user_id);
        UserPlusInfo upi = usersService.user_info(user_id);
        // UserPlusInfo upi = usersService.user_info(user_id); //리뷰수, 즐겨찾기한 가게 수 맵으로
        // 가져오기(조인사용)
        // 좋아요 한 카페수를 전역으로 선언하고 map으로 반환해준다.

        mv.setViewName("user/mypage-infomain");
        mv.addObject("userPlusInfo", upi);
        // mv.addAttribute("userinfo", upi);
        return mv;
        // }
    }

    @RequestMapping(value = "/modifyPassword", method = RequestMethod.POST)
    public String modifyPassword(@RequestParam(value = "user_newpassword_check") String user_newpassword,
                                 @RequestParam(value = "user_originpassword") String user_password, RedirectAttributes rattr) {
        int user_id = (int) session.getAttribute("user_id");
        int result = usersService.passcheck(user_id, user_newpassword, user_password);
        if (result == 1) { // 비밀번호 변경 완료
            rattr.addFlashAttribute("info", "비밀번호 변경을 완료하였습니다.");
        } else if (result == -1) { // 비밀번호 update 실행 불가
            rattr.addFlashAttribute("alert", "비밀번호 변경에 실패하였습니다. 관리자에게 문의하세요.");
        } else { // result = 0 기존 비밀번호 일치하지 않음
            rattr.addFlashAttribute("alert", "기존 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
        }
        return "redirect:/user/infoMain";
    }

    @RequestMapping(value = "/infoModifyAction", method = RequestMethod.POST)
    public String infomodify(String check, String user_profile, MultipartFile uploadfile_m, String user_name_m,
                             String user_tel_m, String user_postcode_m, String user_address_m, RedirectAttributes rattr)
            throws IllegalStateException, IOException {
        logger.info("infomodify도착 check value" + check);
        UserInfo ui = new UserInfo();
        ui.setUser_id((int) session.getAttribute("user_id"));
        ui.setUser_profile(user_profile);
        ui.setUser_name(user_name_m);
        ui.setUser_tel(user_tel_m);
        String user_address = user_postcode_m + user_address_m;
        ui.setUser_address(user_address);

        // String before_file = ui.getUser_profile();
        logger.info(saveFolder);

        if (check != null && !check.equals("")) {
            logger.info("기존파일 변경없이 사용");
            ui.setOriginal_file(check);
            logger.info(ui.getOriginal_file());

        } else {
            if (uploadfile_m != null && !uploadfile_m.isEmpty()) {
                logger.info("파일 변경되었습니다");
                String fileName = uploadfile_m.getOriginalFilename();
                ui.setOriginal_file(fileName);
                logger.info("프로필 변경됐을 경우" + fileName);

                /* 업로드 될 폴더명 생성 */
                Calendar c = Calendar.getInstance();
                String yearO = c.get(Calendar.YEAR) + "";
                int year = Integer.parseInt(yearO.substring(2, 4));
                int month = c.get(Calendar.MONTH) + 1;
                int date = c.get(Calendar.DATE);

                String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
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

                uploadfile_m.transferTo(new File(saveFolder + fileDBName));

                /* 바뀐 파일명으로 저장 */
                ui.setUser_profile(fileDBName);
            }
        } // 파일이 변경됐을경우 end
        int result = usersService.modifyInfo(ui);

        if (result == 1) {
            rattr.addFlashAttribute("info", "정보수정이 완료되었습니다.");
            /*
             * 파일 변경될경우 삭제를 위한 부분 if(!before_file.equals("") &&
             * !before_file.equals(ui.getUser_profile())) {
             * usersService.insert_deleteFile(before_file); }
             */
        } else {
            rattr.addFlashAttribute("alert", "정보수정에 실패하였습니다. 관리자에게 문의해 주세요.");

        }
        return "redirect:/user/infoMain";
    }
    @ResponseBody
    @RequestMapping(value = "/pointList", method = RequestMethod.GET)
    public ModelAndView pointList(@RequestParam(value="page", defaultValue="1", required = false)int page
    								,@RequestParam(value="limit", defaultValue="4", required = false)int limit
    								,@RequestParam(value="ajax", defaultValue="false", required=false)String ajax
    								,ModelAndView mv) {
    												
    	int user_id = (int)session.getAttribute("user_id");
    	int count =usersService.pointListCount(user_id);
    	int maxpage = (count + limit -1)/limit;
		int startpage = ((page-1)/10)*10+1;
		int endpage = startpage +10-1;
		
		if (endpage >  maxpage)
			endpage = maxpage;
    	List<Point> list =usersService.getPointList(user_id, page, limit);
    	UserPlusInfo upi = usersService.user_info(user_id);
    	int totalPoint = upi.getPoint();
    	logger.info("=============pointList 갯수================" + count);
    	if(list == null) {
    		
    		logger.info("list가  null? ==========");
    	}
    	logger.info("=======ajax실행 boolean"+ ajax);
    	if(ajax.equals("false")) {
    		mv.setViewName("user/mypage-point");
    	}
    	mv.addObject("page", page);
    	mv.addObject("maxpage",maxpage);
    	mv.addObject("startpage", startpage);
    	mv.addObject("endpage",endpage);
		mv.addObject("list", list);
		mv.addObject("count", count);
		mv.addObject("totalPoint", totalPoint);
        return mv;
    }
    @RequestMapping(value = "/reportWrite", method = RequestMethod.GET)
    public ModelAndView reportWrite(
            @RequestParam(value = "reported_store", defaultValue = "0", required = false) String reported_store,
            @RequestParam(value = "reported_cmt", defaultValue = "0", required = false) String reported_cmt,
            ModelAndView mv) {
        logger.info("reportWrite 도착" + reported_store + reported_cmt);
        // 신고 내역을 가지고 mypage-report.jsp로 이동
        // 신고를 당한 입장이면 어디서 확인을 하는지 체크하기
        int store_id = Integer.parseInt(reported_store);
        int comment_id = Integer.parseInt(reported_cmt);
        Report report = new Report();
        if (store_id != 0) {
            report.setReported_store(store_id);
            Store store = storeService.readStore(store_id);
            String user = "";
            mv.setViewName("user/mypage-report_write");
            mv.addObject("reported_store", store);
            mv.addObject("reported_user", user);
        } else if (comment_id != 0) {
            report.setReported_user(comment_id);
            Comment comment = commentService.selectComment(comment_id);
            String store = "";
            mv.setViewName("user/mypage-report_write");
            mv.addObject("reported_user", comment);
            mv.addObject("reported_store", store);
        }
        return mv;

    }

//	@RequestMapping(value = "/addReport", method = RequestMethod.POST)
//	public String reportWriteAction(Report report, String reporter_email,
//			@RequestParam(value = "store_id", defaultValue = "0", required = false) int reported_store,
//			@RequestParam(value = "comment_id", defaultValue = "0", required = false) int reported_cmt,
//			RedirectAttributes rattr) {
//		logger.info("addReport 도착");
//		logger.info("cmt" + report.getReported_cmt());;
//		logger.info("store" + report.getReported_store());
//		String user_email = reporter_email;
//		User user = usersService.getUserId(user_email);
//		int user_id = user.getUser_id();
//		report.setReporter(user_id);
//		report.setReported_store(reported_store);
//		report.setReported_cmt(reported_cmt);
//
//		int result = usersService.addReport(report);
//		if (result == 1) {
//			rattr.addFlashAttribute("info", "신고내용이 접수 완료되었습니다.");
//			return "redirect:/user/reportList";
//		} else {
//			logger.info("addReport error");
//		}
//		return null;
//	}

    @RequestMapping(value = "/addReport")
    public String report(String reported, String subject, String content, int user_id, RedirectAttributes rattr) {
        User reporter = usersService.getUser(user_id);
        Store store = usersService.getStore(reported);
        UserInfo user = usersService.getUser(reported);

        if (store != null) {
            int result = usersService.reportStore(subject, content, user_id, store.getStore_id());
            if (result == 1) {
                MailVO vo = new MailVO();
                vo.setTo(reporter.getUser_email());
                vo.setContent(user.getUser_name() + "님 신고 접수가 완료되었습니다. <br> 사실 관계를 빠르게 확인하여 조치를 취하도록 하겠습니다. 감사합니다. ");
                sendMail.sendMail(vo);
                rattr.addFlashAttribute("result", "신고가 접수되었습니다.");
                logger.info("가게신고성공");
            } else {
                rattr.addFlashAttribute("result", "죄송합니다. 다시 시도해 주세요.");
                logger.info("가게신고실패");
            }
        } else {
            int user_result = usersService.reportUser(subject, content, user_id, user.getUser_id());
            if (user_result == 1) {
                MailVO vo = new MailVO();
                vo.setTo(reporter.getUser_email());
                vo.setContent(user_id + "님 회원 신고 접수가 완료되었습니다. .");
                sendMail.sendMail(vo);
                rattr.addFlashAttribute("result", "신고가 접수되었습니다.");
                logger.info("유저신고성공");
            } else {
                rattr.addFlashAttribute("result", "죄송합니다. 다시 시도해 주세요.");
                logger.info("유저신고실패");
            }
        }
        return "redirect:/home";

    }

    @RequestMapping(value = "/reportList", method = RequestMethod.GET)
    public ModelAndView reportList(ModelAndView mv) {
        logger.info("reportList도착");
        // 신고 내역을 가지고 mypage-report.jsp로 이동
        // 신고를 당한 입장이면 어디서 확인을 하는지 체크하기
        // 세션의 아이디를 가지고 comment와 store테이블을 조인한다.
        int user_id = (int) session.getAttribute("user_id");
        logger.info("접속한유저" + user_id);

        List<Report> report = usersService.reportStoreAndComment(user_id);
        // 가져온 값을 화면으로 보내준다.
        mv.setViewName("user/mypage-report");
        mv.addObject("list", report);
        return mv;
    }

    @RequestMapping(value = "/reportDetail", method = RequestMethod.GET)
    public ModelAndView reportDetail(
            @RequestParam(value = "store_report_id", defaultValue = "0", required = false) String store_reported,
            @RequestParam(value = "cmt_report_id", defaultValue = "0", required = false) String cmt_reported,
            ModelAndView mv) {
        logger.info("여기는 reportDetail");
        int store_report_id = Integer.parseInt(store_reported);
        int cmt_report_id = Integer.parseInt(cmt_reported);
        if (store_report_id != 0) {
            Report store_detail = storeService.readStoreReport(store_report_id);
            int store_id = store_detail.getReported_store();
            Store store = storeService.readStore(store_id);
            String store_name = store.getStore_name();
            logger.info(store_name);
            mv.setViewName("user/mypage-report_detail");
            mv.addObject("detail", store_detail);
            mv.addObject("store_name", store_name);
        } else if (cmt_report_id != 0) {
            Report cmt_detail = commentService.readCommentReport(cmt_report_id);
            int comment_id = cmt_detail.getReported_cmt();
            Comment comment = commentService.selectComment(comment_id);
            String comment_content = comment.getComment_content();
            mv.setViewName("user/mypage-report_detail");
            mv.addObject("detail", cmt_detail);
            mv.addObject("comment_content", comment_content);

        }
        return mv;

    }

    @RequestMapping(value = "/reviewList", method = RequestMethod.GET)
    public String reviewList(Model md) {
        int user_id = (int) session.getAttribute("user_id");
        int page = 1;
        //commentlist + store 이름
        List<Comment> list = commentService.getUserCommentList(user_id, page);
        int listCount = commentService.getCommentCountByUser(user_id);
        md.addAttribute("listCount", listCount);
        md.addAttribute("list", list);
        logger.info("comment도착");
        return "user/mypage-review";

    }

    @RequestMapping(value = "/reviesWrite", method = RequestMethod.POST)
    public void reviewWrite(/* 리뷰 테이블 빈 */) {
        // 리뷰 작성이동은 모달로 처리예정
        // 작성된 리뷰를 가지고 와서 테이블에 저장
        // 리뷰 리스트로 이동
    }

    @RequestMapping(value = "/orderMain", method = RequestMethod.GET)
    public ModelAndView order(int store_id, ModelAndView mv) {

        Store store = usersService.getStore(store_id);
        int storeLike = usersService.getStoreLike(store_id);
        List<Menu> topMenu = usersService.getTopMenu(store_id);
        List<Menu> allMenu = usersService.getAllMenu(store_id);
        int menuCount = usersService.getMenuCount(store_id);

        mv.setViewName("user/order-main");
        mv.addObject("store", store);
        mv.addObject("storeLike", storeLike);
        mv.addObject("topMenu", topMenu);
        mv.addObject("allMenu", allMenu);
        mv.addObject("menuCount", menuCount);
        mv.addObject("store_id", store_id);
        return mv;

    }

    @RequestMapping(value = "/orderView", method = RequestMethod.GET)
    public ModelAndView orderView(int user_id, ModelAndView mv,
                                  @RequestParam(value = "page", defaultValue = "1", required = false) int page) {
        int limit = 4;
        int listCount = usersService.getListCount(user_id);

        List<Order> orders = usersService.getOrder(user_id, page, limit);
        List<Store> store = usersService.getStoreForOrder(user_id, page, limit);
        List<OrderDetail> orderDetail = usersService.getOrderDetail(user_id, page, limit);
        List<Menu> menu = usersService.getMenuForOrder(user_id, page, limit);
        if (listCount > orders.size()) {
            mv.addObject("more", 1);
        }

        mv.setViewName("user/order-list");
        mv.addObject("store", store);
        mv.addObject("orders", orders);
        mv.addObject("orderDetail", orderDetail);
        mv.addObject("menu", menu);
        return mv;
    }

    @RequestMapping(value = "/orderViewAjax", method = RequestMethod.GET)
    public ModelAndView orderViewAjax(int user_id, ModelAndView mv,
                                      @RequestParam(value = "page", defaultValue = "1", required = false) int page) {
        int limit = 4;
        int listCount = usersService.getListCount(user_id) - limit;

        List<Order> orders = usersService.getOrder(user_id, page, limit);
        List<Store> store = usersService.getStoreForOrder(user_id, page, limit);
        List<OrderDetail> orderDetail = usersService.getOrderDetail(user_id, page, limit);
        List<Menu> menu = usersService.getMenuForOrder(user_id, page, limit);
        if (listCount > orders.size()) {
            mv.addObject("more", 1);
        }

        mv.setViewName("user/order-listAjax");
        mv.addObject("store", store);
        mv.addObject("orders", orders);
        mv.addObject("orderDetail", orderDetail);
        mv.addObject("menu", menu);
        return mv;
    }

    @RequestMapping(value = "/favorite", method = RequestMethod.GET)
    public ModelAndView favorite(int user_id, ModelAndView mv) {

        List<Store> store = usersService.getStoreFavorite(user_id);

        mv.setViewName("user/order-likes_list");
        mv.addObject("store", store);

        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/favoriteCancel", method = RequestMethod.GET)
    public int likesList(int user_id, int store_id) {
        int result = usersService.favoriteCancel(user_id, store_id);
        return result;

    }

    // for cart register
    @RequestMapping(value = "/cartRegister")
    public String cartRegister(@RequestParam(value = "p_num") int[] p_num,
                               @RequestParam(value = "p_price") int[] p_price, @RequestParam(value = "o_menu") String[] o_menu,
                               @RequestParam(value = "m_num") int[] m_num, @RequestParam(value = "p_numA") int[] p_numA,
                               @RequestParam(value = "p_priceA") int[] p_priceA, @RequestParam(value = "o_menuA") String[] o_menuA,
                               @RequestParam(value = "m_numA") int[] m_numA, int user_id, int store_id, String totalPrice, int amount) {

        for (int i = 0; i < p_num.length; i++) {
            if (p_num[i] > 0) {
                int result = usersService.cartRegister(user_id, p_num[i], m_num[i]);

                if (result == 1) {
                    logger.info("장바구니 담기 성공");
                } else {
                    logger.info("장바구니 담기 실패");
                }
            }
        }

        for (int i = 0; i < p_numA.length; i++) {
            if (p_numA[i] > 0) {
                int result = usersService.cartRegister(user_id, p_numA[i], m_numA[i]);
                if (result == 1) {
                    logger.info("장바구니 담기 성공");
                } else {
                    logger.info("장바구니 담기 실패");
                }
            }
        }
        return "redirect:/user/cartList?user_id=" + user_id;
    }

    @RequestMapping(value = "/cartList", method = RequestMethod.GET)
    public ModelAndView cartList(int user_id, ModelAndView mv) {

        List<Cart> cart = usersService.getCart(user_id);
        List<Menu> menu = usersService.getMenuForCart(user_id);
        List<Store> store = usersService.getStoreForCart(user_id);
        int amount = usersService.getAmount(user_id);
        int totalPrice = usersService.getTotalPrice(user_id);

        mv.setViewName("user/order-cart");
        mv.addObject("store", store);
        mv.addObject("menu", menu);
        mv.addObject("cart", cart);
        mv.addObject("amount", amount);
        mv.addObject("totalPrice", totalPrice);
        return mv;
    }


    // for cart register
    @ResponseBody
    @RequestMapping(value = "/cartDel")
    public int cartDel(int cart_id) {

        int result = usersService.cartDel(cart_id);
        return result;
    }

    @RequestMapping(value = "/option", method = RequestMethod.GET)
    public void option(int menu_id) {
        /// *메뉴에대한 옵션 테이블 빈*/사용
        // 메뉴아이디에따른 옵션화면에 보여주기, 가게 정보도 보여줘야함
        // ajax로 리턴값알려줄 거니까 httpResponse또는 map으로 싸서 oreder-main.jsp의 모달로 보내주기
    }

    @RequestMapping(value = "/orderList", method = RequestMethod.GET)
    public void orderList(String user_id) {
        // order조회후 order-list.jsp로 이동
        // 더보기로 내용 추가조회 가능하도록 페이지 처리
    }

    @RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
    public void orderDetail(String order_id) {
        // 상세내역 조회 후 order-list.jsp modal로 이동
    }

}
