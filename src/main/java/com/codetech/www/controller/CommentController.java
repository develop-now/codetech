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
    public Map<String, Object> getStoreCommentListAjax(HttpSession session, @RequestParam(value = "store_id") int store_id) {
        Integer owner_id = (Integer) session.getAttribute("user_id");
        logger.info("store owner id : " + owner_id);

        List<Comment> list = commentService.getCommentListByStore(store_id);

        Map<String, Object> rtn = new HashMap<String, Object>();

        rtn.put("list", list);
        rtn.put("success", list.size() > 0);

        return rtn;
    }

    @RequestMapping(value = "/comment-read", method = RequestMethod.GET)
    public String getStoreCommentRead(@RequestParam(value = "comment_id") int comment_id, Model model) {
        model.addAttribute("storeNav", "commentRead");

        return null;
    }
}
