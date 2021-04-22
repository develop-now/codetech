package com.codetech.www.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codetech.www.domain.Menu;
import com.codetech.www.domain.Notice;
import com.codetech.www.domain.StoreInfoList;
import com.codetech.www.domain.UserPlusInfo;
import com.codetech.www.service.AdminService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;

	@Value("${saveFolderName}")
	private String saveFolder;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "admin/index";
	}

	@RequestMapping(value = "/userList")
	public ModelAndView userList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv, @RequestParam(value = "search_field", defaultValue = "-1") int index,
			@RequestParam(value = "search_word", defaultValue = "") String search_word,
			@RequestParam(value = "check_state", defaultValue = "-1") int state) {
		System.out.println("----------------------------");
		System.out.println("int index: " + index);
		System.out.println("int state: " + state);
		System.out.println("----------------------------\n");

		List<UserPlusInfo> Userslist = null;

		int limit = 7;
		int listcount = adminService.getSearchListCount(index, state, search_word);

		Userslist = adminService.getUsersSearchList(index, state, search_word, page, limit);

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("admin/user-list");

		mv.addObject("page", page); // 현재 페이지 수
		mv.addObject("maxpage", maxpage); // 최대 페이지 수

		// 현재 페이지에 표시할 첫 페이지 수
		mv.addObject("startpage", startpage);

		// 현재 페이지에 표시할 끝 페이지 수
		mv.addObject("endpage", endpage);

		mv.addObject("listcount", listcount); // 총 글의 수

		mv.addObject("Userslist", Userslist);

		// 해당 페이지의 글 목록을 갖고 있는 리스트
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		mv.addObject("check_state", state);

		return mv;
	}

	// 회원 정지
	@RequestMapping(value = "/UserSusp", method = RequestMethod.GET)
	public String userSusp(@RequestParam("user_id") String user_id, RedirectAttributes rattr) {
		logger.info("넘어온 아이디 값: " + user_id);
		int result = adminService.user_susp(user_id);

		if (result == 1) {
			logger.info("회원 정지 성공!");
			rattr.addFlashAttribute("result", "suspSuccess");
			return "redirect:/admin/userList";
		} else {
			logger.info("회원 정지 실패!");
			rattr.addFlashAttribute("result", "suspFail");
			return "redirect:/admin/userList";
		}
	}

	// 정지 해제
	@RequestMapping(value = "/UserReAc", method = RequestMethod.GET)
	public String userReAc(@RequestParam("user_id") String user_id, RedirectAttributes rattr) {
		int result = adminService.user_reac(user_id);

		if (result == 1) {
			logger.info("회원 정지 해제!");
			rattr.addFlashAttribute("result", "reacSuccess");
			return "redirect:/admin/userList";
		} else {
			logger.info("회원 정지 해제 실패!");
			rattr.addFlashAttribute("result", "reacFail");
			return "redirect:/admin/userList";
		}
	}

	// 강제 탈퇴
	@RequestMapping(value = "/UserBanned", method = RequestMethod.GET)
	public String userBanned(@RequestParam("user_id") String user_id, RedirectAttributes rattr) {
		int result = adminService.user_banned(user_id);

		if (result == 1) {
			logger.info("회원 강제 추방!");
			rattr.addFlashAttribute("result", "bannedSuccess");
			return "redirect:/admin/userList";
		} else {
			logger.info("회원 추방 실패!");
			rattr.addFlashAttribute("result", "bannedFail");
			return "redirect:/admin/userList";
		}
	}

	// 탈퇴 취소
	@RequestMapping(value = "/UserInac", method = RequestMethod.GET)
	public String userInac(@RequestParam("user_id") String user_id, RedirectAttributes rattr) {
		int result = adminService.user_inac(user_id);

		if (result == 1) {
			logger.info("회원 탈퇴 취소!");
			rattr.addFlashAttribute("result", "inacSuccess");
			return "redirect:/admin/userList";
		} else {
			logger.info("회원 탈퇴 취소 실패!");
			rattr.addFlashAttribute("result", "inacFail");
			return "redirect:/admin/userList";
		}
	}

	@RequestMapping(value = "/partnerList")
	public ModelAndView partnerList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv, @RequestParam(value = "search_field", defaultValue = "-1") int index,
			@RequestParam(value = "search_word", defaultValue = "") String search_word,
			@RequestParam(value = "check_state", defaultValue = "-1") int state) {

		List<StoreInfoList> Storelist = null;

		int limit = 7;
		int listcount = adminService.getPartnerSearchListCount(index, state, search_word);

		Storelist = adminService.getPartnerSearchList(index, state, search_word, page, limit);

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("admin/partner-list");

		mv.addObject("page", page); // 현재 페이지 수
		mv.addObject("maxpage", maxpage); // 최대 페이지 수

		// 현재 페이지에 표시할 첫 페이지 수
		mv.addObject("startpage", startpage);

		// 현재 페이지에 표시할 끝 페이지 수
		mv.addObject("endpage", endpage);

		mv.addObject("listcount", listcount); // 총 글의 수

		mv.addObject("Storelist", Storelist);

		// 해당 페이지의 글 목록을 갖고 있는 리스트
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		mv.addObject("check_state", state);

		return mv;
	}

	// 가게 활성화
	@RequestMapping(value = "/PartnerAct", method = RequestMethod.GET)
	public String partnerAct(@RequestParam("store_id") String store_id, RedirectAttributes rattr,
			HttpServletRequest request) {
		int result = adminService.store_act(store_id);

		if (result == 1) {
			logger.info("가게 정지 해지!");
			rattr.addFlashAttribute("result", "storeActSuccess");
			return "redirect:/admin/partnerList";
		} else {
			logger.info("가게 정지 해지 실패!");
			rattr.addFlashAttribute("result", "storeActFail");
			return "redirect:/admin/partnerList";
		}
	}

	// 가게 정지
	@RequestMapping(value = "/PartnerSusp", method = RequestMethod.GET)
	public String partnerSusp(@RequestParam("store_id") String store_id, RedirectAttributes rattr,
			HttpServletRequest request) {
		int result = adminService.store_susp(store_id);

		if (result == 1) {
			logger.info("가게 정지!");
			rattr.addFlashAttribute("result", "storeSuspSuccess");
			return "redirect:/admin/partnerList";
		} else {
			logger.info("가게 정지 실패!");
			rattr.addFlashAttribute("result", "storeSuspFail");
			return "redirect:/admin/partnerList";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/PartnerPend", method = RequestMethod.GET)
	public List<Menu> partnerPend(@RequestParam("store_id") String store_id) {
		List<Menu> Menulist = null;

		Menulist = adminService.getStoreMenuList(store_id);

		return Menulist;
	}

	// 계약 종료
	@RequestMapping(value = "/PartnerTermi", method = RequestMethod.GET)
	public String partnerTermi(@RequestParam("store_id") String store_id, RedirectAttributes rattr,
			HttpServletRequest request) {
		int result = adminService.store_termi(store_id);

		if (result == 1) {
			logger.info("계약 해지!");
			rattr.addFlashAttribute("result", "termiSuccess");

			return "redirect:/admin/partnerList";
		} else {
			logger.info("계약 해지 실패!");
			rattr.addFlashAttribute("result", "termiFail");

			return "redirect:/admin/partnerList";
		}
	}

	@RequestMapping(value = "/noticeAll", method = RequestMethod.GET)
	public ModelAndView noticeList
			(@RequestParam(value = "page", defaultValue = "1", required = false) int page, ModelAndView mv,
			 @RequestParam(value = "notice_status", defaultValue = "-1") int index,
			 @RequestParam(value = "search_text", defaultValue = "") String search_text) {
		int limit = 10; // 한 화면에 출력할 레코드 갯수

		int listcount = adminService.getNoticeListCount(search_text, index); // 샐랙트 구문을 통해 리스트 값을 가져옴
		List<Notice> noticelist = adminService.getNoticeList(search_text, index, page, limit); // 리스트를 받아온다.

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지수(1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("admin/notice-all");

		mv.addObject("limit", limit);
		mv.addObject("page", page);

		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);

		mv.addObject("noticelist", noticelist);
		mv.addObject("listcount", listcount);

		return mv;
	}

	@RequestMapping(value = "/noticeNotice", method = RequestMethod.GET)
	public ModelAndView noticeNotice
			(@RequestParam(value = "page", defaultValue = "1", required = false) int page, ModelAndView mv, 
			 @RequestParam(value = "notice_status", defaultValue = "0") int index,
			 @RequestParam(value = "search_text", defaultValue = "") String search_text) {
		int limit = 10; // 한 화면에 출력할 레코드 갯수

		int listcount = adminService.getNoticeListCount(search_text, index); // 샐랙트 구문을 통해 리스트 값을 가져옴
		List<Notice> noticelist = adminService.getNoticeList(search_text, index, page, limit); // 리스트를 받아온다.

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지수(1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("admin/notice-notice");

		mv.addObject("limit", limit);
		mv.addObject("page", page);

		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);

		mv.addObject("noticelist", noticelist);
		mv.addObject("listcount", listcount);

		return mv;
	}
	
	@RequestMapping(value = "/noticeEvent", method = RequestMethod.GET)
	public ModelAndView noticeEvent(@RequestParam(value = "page", defaultValue = "1", required = false) int page, ModelAndView mv, 
			@RequestParam(value = "notice_status", defaultValue = "1") int index,
			@RequestParam(value = "search_text", defaultValue = "") String search_text) {
		int limit = 10; // 한 화면에 출력할 레코드 갯수

		int listcount = adminService.getNoticeListCount(search_text, index); // 샐랙트 구문을 통해 리스트 값을 가져옴
		List<Notice> noticelist = adminService.getNoticeList(search_text, index, page, limit); // 리스트를 받아온다.

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지수(1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("admin/notice-event");

		mv.addObject("limit", limit);
		mv.addObject("page", page);

		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);

		mv.addObject("noticelist", noticelist);
		mv.addObject("listcount", listcount);

		return mv;
	}
	
	@RequestMapping(value = "/noticeCheck", method = RequestMethod.GET)
	public ModelAndView noticeCheck(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv, @RequestParam(value = "notice_status", defaultValue = "2") int index,
			@RequestParam(value = "search_text", defaultValue = "") String search_text) {
		int limit = 10; // 한 화면에 출력할 레코드 갯수

		int listcount = adminService.getNoticeListCount(search_text, index); // 샐랙트 구문을 통해 리스트 값을 가져옴
		List<Notice> noticelist = adminService.getNoticeList(search_text, index, page, limit); // 리스트를 받아온다.

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지수(1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("admin/notice-check");

		mv.addObject("limit", limit);
		mv.addObject("page", page);

		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);

		mv.addObject("noticelist", noticelist);
		mv.addObject("listcount", listcount);

		return mv;
	}
	
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)
	public String noticeWrite() throws Exception {
		return "admin/notice-write";
	}

	@RequestMapping(value = "/noticeAdd", method = RequestMethod.POST)
	public String noticeAdd(Notice notice, RedirectAttributes rattr) throws Exception {
		adminService.insertNotice(notice);
		
		return "redirect:noticeList";
	}
	
	@RequestMapping(value = "/noticeView", method = RequestMethod.GET)
	public ModelAndView noticeView(int notice_id, ModelAndView mv, HttpServletRequest request) {
		Notice notice = adminService.noticeView(notice_id);

		if (notice == null) {
			logger.info("글 보기 실패");
			
			mv.setViewName("error/error");
			mv.addObject("error_code", request.getRequestURL());
			mv.addObject("error_msg", "글 보기 실패");
			
			return mv;
		}
		
		logger.info("글 보기 성공");

		mv.setViewName("admin/notice-view");
		mv.addObject("noticeView", notice);
			
		return mv;	
	}

	@RequestMapping(value = "/noticeModify", method = RequestMethod.GET)
	public ModelAndView noticeModify(int notice_id, ModelAndView mv, HttpServletRequest request) {
		Notice notice = adminService.noticeView(notice_id);
		
		if (notice == null) {
			logger.info("수정할 글 보기 실패");
			
			mv.setViewName("error/error");
			mv.addObject("error_code", request.getRequestURL());
			mv.addObject("error_msg", "수정할 글 보기 실패");
			
			return mv;
		}
		
		logger.info("수정할 글 보기 성공");

		mv.setViewName("admin/notice-modify");
		mv.addObject("noticeModify", notice);
			
		return mv;
	}

	@RequestMapping(value = "/noticeAction", method = RequestMethod.POST)
	public String modifyAction(Notice noticeModify, Model m, 
			HttpServletRequest request, RedirectAttributes rattr) throws Exception {
		int result = adminService.modifyAction(noticeModify);
		String url = "";
		
		if (result == 0) {
			logger.info("글 수정 실패");
			
			m.addAttribute("error_code", request.getRequestURL());
			m.addAttribute("error_msg", "공지사항 수정 실패");
			
			url = "error/error";
		} else {
			logger.info("글 수정 성공");
			
			url = "redirect:noticeView";
			
			// 글 수정후 페이지 이동할 때 아이디 값으로 경로 찾아간다.
			rattr.addAttribute("notice_id", noticeModify.getNotice_id());
			rattr.addAttribute("result", "modifySuccess");
		}
		
		return url;
	}
	
	@RequestMapping(value = "/noticeDelete", method = RequestMethod.GET)
	public String modifyAction(int notice_id, Model m, 
			HttpServletRequest request, RedirectAttributes rattr) throws Exception {
		int result = adminService.noticeDelete(notice_id);
		String url = "";
		
		if (result == 0) {
			logger.info("글 삭제 실패");
			
			m.addAttribute("error_code", request.getRequestURL());
			m.addAttribute("error_msg", "공지사항 삭제 실패");
			
			url = "error/error";
		} else {
			logger.info("글 삭제 성공");
			
			rattr.addAttribute("result", "deleteSuccess");
			
			url = "redirect:noticeList";
		}
		
		return url;
	}
	
	@RequestMapping(value = "/noticeImage")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
		System.out.println(upload);
		
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {
			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 이미지 경로 생성
			String path = saveFolder + "upImage/";
			// C:\Users\altn0\Documents\workspace-sts-3.9.8.RELEASE\codetech\src\main\webapp\resources\\upload
			// /upImage\09ee41ad-29f1-47b2-bfd7-ae60d6c26d01_inspect.png
			String ckUploadPath = path + uid + "_" + fileName;
			File folder = new File(path);

			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			
			// 업로드 된 파일을 바이트 형식으로 저장해서 버퍼에 남은거 전부 전송
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

			printWriter = response.getWriter();
			String fileUrl = "/www/admin/noticeImageSub?uid=" + uid + "&fileName=" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	@RequestMapping(value = "/noticeImageSub")
	public void ckSubmit(@RequestParam(value = "uid") String uid,
						 @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서버에 저장된 이미지 경로
		String path = saveFolder + "upImage/";

		String sDirPath = path + uid + "_" + fileName;

		File imgFile = new File(sDirPath);

		// 사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();

				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}

				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();

			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}
	
	@RequestMapping(value = "/reportUser", method = RequestMethod.GET)
	public String reportUser() {
		return "admin/report-user";
	}
	
	@RequestMapping(value = "/reportStore", method = RequestMethod.GET)
	public String reportStore() {
		return "admin/report-store";
	}
	
	@RequestMapping(value = "/reportComment", method = RequestMethod.GET)
	public String reportComment() {
		return "admin/report-comment";
	}
}
