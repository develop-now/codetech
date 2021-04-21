package com.codetech.www.controller;

import com.codetech.www.domain.Comment;
import com.codetech.www.domain.User;
import com.codetech.www.service.CommentService;
import com.codetech.www.service.UsersService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/comment")
public class CommentController {
    private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

    @Autowired
    private CommentService commentService;
    
    @Autowired
    private UsersService userService;

    @ResponseBody
    @RequestMapping(value = "/comment-list-by-store-ajax", method = RequestMethod.GET)
    public Map<String, Object> getStoreCommentListAjax(HttpSession session,
                                                       @RequestParam(value = "store_id") int store_id,
                                                       @RequestParam(value = "page") int page,
                                                       @RequestParam(value = "limit") int limit,
                                                       @RequestParam(value = "search_val", required = false, defaultValue = "") String search_val) {
        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        int listCount = commentService.getCommentCountByStore(store_id, search_val);
        List<Comment> list = commentService.getCommentListByStore(store_id, page, limit, search_val);

        int maxPage = (listCount + limit - 1) / limit;

        int startPage = ((page - 1) / 10) * 10 + 1;

        int endPage = startPage + 10 - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        Map<String, Object> rtn = new HashMap<String, Object>();

        rtn.put("list", list);
        rtn.put("page", page);
        rtn.put("limit", limit);
        rtn.put("listCount", listCount);
        rtn.put("maxPage", maxPage);
        rtn.put("startPage", startPage);
        rtn.put("endPage", endPage);
        rtn.put("success", list.size() > 0);

        return rtn;
    }

    @RequestMapping(value = "/comment-read", method = RequestMethod.GET)
    public String getStoreCommentRead(@RequestParam(value = "comment_id") int comment_id, Model model) {
        model.addAttribute("storeNav", "commentRead");

        List<Comment> list = commentService.readComment(comment_id);
        model.addAttribute("list", list);

        return "store/comment/comment-read";
    }

    @RequestMapping(value = "/createAction", method = RequestMethod.POST)
    public String createAction(Comment comment, RedirectAttributes redirectAttributes) {

        int result = commentService.createComment(comment);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("info", "답글 생성에 성공하였습니다");
        } else {
            redirectAttributes.addFlashAttribute("alert", "답글 생성에 실패하였습니다");
        }

        int comment_id = comment.getComment_ref();
        String redirectURI = "/comment/comment-read?comment_id=" + comment_id;
        return "redirect:" + redirectURI;
    }

    @RequestMapping(value = "/updateAction", method = RequestMethod.POST)
    public String updateAction(@RequestParam(value = "comment_id") int comment_id,
                               @RequestParam(value = "comment_content", required = false, defaultValue = "") String comment_content,
                               @RequestParam(value = "comment_ref") int comment_ref,
                               @RequestParam(value = "update_flag") String flag,
                               RedirectAttributes redirectAttributes) {

        int result = 0;
        String flag_msg = "";

        switch (flag) {
            case "update":
                result = commentService.updateComment(comment_id, comment_content);
                flag_msg = "수정";
                break;
            case "delete":
                result = commentService.deleteComment(comment_id);
                flag_msg = "삭제";
                break;
        }


        if (result > 0) {
            redirectAttributes.addFlashAttribute("info", "답글" + flag_msg + "에 성공하였습니다");
        } else {
            redirectAttributes.addFlashAttribute("alert", "답글" + flag_msg + "에 실패하였습니다");
        }

        String redirectURI = "/comment/comment-read?comment_id=" + comment_ref;
        return "redirect:" + redirectURI;

    }
    
    @ResponseBody
    @RequestMapping(value="/user/comment-list-by-user-ajax", method= RequestMethod.GET)
    public Map<String, Object> getUserCommentListAjax(HttpSession session
    								,@RequestParam(value="page",defaultValue="1",required=false)int page
    									) {
    	logger.info("여기는 getlistajax");
    	int user_id = (Integer)session.getAttribute("user_id");
    	List<Comment> list= commentService.getUserCommentList(user_id, page);
    	int listCount = commentService.getCommentCountByUser(user_id);
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("listCount", listCount);
    	map.put("list", list);
    	return map;
    }
    
    @ResponseBody
    @RequestMapping(value="/user/deleteUserComment", method = RequestMethod.POST)
    public Map<String, Object> deleteUserComment(int comment_id) {
    	logger.info("''''''''''''''''''''''''''''''''''''''''' deleteUserComment들어옴");

    	//comment_id받고 그 아이디에 해당하는 글의 status를 update해준다 + update_at도 변경
    	int result = commentService.deleteComment(comment_id);
    	logger.info("''''''''''''''''''''''''''''''''''''''''' deleteUserComment" + result);
    	Map<String, Object> map = new HashMap<String, Object>();
    	if(result != 1) {
    		logger.info("deleteUserComment update ERROR");
    	}else {
    		map.put("result", result);
    	}
    	return map;
    }
    @RequestMapping(value = "/user/storeReviewView", method = RequestMethod.GET)
	public String storeReviewView() {
		// 상세내역 조회 후 order-list.jsp modal로 이동
    	
    	String url="user/storeReview";
    	return url;
    	
	}
    
    @ResponseBody
    @RequestMapping(value = "/user/storeAllReview", method = RequestMethod.GET)
	public Map<String, Object> storeReview(int store_id, int page) {
    	String search_val = "";
    	List<Comment> list = commentService.getCommentListAllByStore(store_id, page);
    	int count = commentService.getCommentCountByStore(store_id, search_val);
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("list",list);
    	map.put("listCount", count);
    	logger.info("=================storeAllReview ajax로 들어옴===========================+"+count);
    	return map;
	}
    
    @RequestMapping(value="/user/addComment", method=RequestMethod.POST)
    public String addCommentByUser(Comment cmt, RedirectAttributes rattr) {
    	logger.info("addcommetnbyuser도착");
    	String user_email = cmt.getComment_writer_value();
    	User user = userService.getUserId(user_email);
    	cmt.setComment_writer(user.getUser_id());
    	logger.info("addCommentByUser-----------user_id=>comment_writer"+cmt.getComment_writer());
    	cmt.setComment_lev(0);
    	cmt.setComment_lev(0);
    	int result = commentService.addCommentByUser(cmt);
    	if(result == 1) {
    		rattr.addFlashAttribute("info", "리뷰작성을 완료하였습니다.");
    	}else {
    		rattr.addFlashAttribute("alert", "리뷰작성에 실패하였습니다.");
    	}
    	return"redirect:/home";
    }
}
