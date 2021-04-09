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

import java.util.List;

@Controller
@RequestMapping(value = "/comment")
public class CommentController {
    private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/comment-list", method = RequestMethod.GET)
    public String getStoreCommentList(@RequestParam(value = "store_id") int store_id, Model model) {
        model.addAttribute("storeNav", "commentList");
        // TODO:: GET ID FROM SESSION OR SECURITY

        List<Comment> list = commentService.getCommentListByStore(store_id);

        return "store/comment-list";
    }

    @RequestMapping(value = "/comment-read", method = RequestMethod.GET)
    public String getStoreCommentRead(@RequestParam(value = "comment_id") int comment_id, Model model) {
        model.addAttribute("storeNav", "commentRead");

        return null;
    }
}
