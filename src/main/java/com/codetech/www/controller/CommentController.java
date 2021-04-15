package com.codetech.www.controller;

import com.codetech.www.domain.Comment;
import com.codetech.www.service.CommentService;
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

        if(result > 0){
            redirectAttributes.addFlashAttribute("info", "답글 생성에 성공하였습니다");
        } else {
            redirectAttributes.addFlashAttribute("alert", "답글 생성에 실패하였습니다");
        }

        int comment_id = comment.getComment_ref();
        String redirectURI = "/comment/comment-read?comment_id=" + comment_id;
        return "redirect:" + redirectURI;
    }
}
