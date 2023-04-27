package com.pyeoni.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.CommentService;
import com.pyeoni.vo.CommentVO;

public class AdminCommentsController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = "manageComments.jsp";
		
		CommentService service = new CommentService();
		
		List<CommentVO> commentList = service.selectAllComment();
		
		HttpServletRequest req = (HttpServletRequest)data.get("request");
		req.setAttribute("commentList", commentList);
		
		return page;
	}

}
