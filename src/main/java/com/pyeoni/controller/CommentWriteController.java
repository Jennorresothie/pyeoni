package com.pyeoni.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.CommentService;
import com.pyeoni.util.DateUtill;
import com.pyeoni.vo.CommentVO;

public class CommentWriteController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = "";
		
		String method = (String)data.get("method");
		
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		if(method.equals("POST")) {
			
			CommentVO comment = makeComment(request);
			
			CommentService service = new CommentService();
			
			int result = service.writeComment(comment);
		
			if (result == 0 ) {
				/* 성공 */
				return "responseBody:false";
			}else {
				/* 실패 */
				return "responseBody:true";
			}
		}
		return "DetailModal.jsp";
	}
	private CommentVO makeComment(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
	
//		int comment_id = Integer.parseInt(request.getParameter("COMMENT_ID"));
		String content = request.getParameter("comment");
		
//		Date comment_date = DateUtill.convertToDate(request.getParameter("commentdate"));
		String product_name = request.getParameter("product_name");
		String promotion = request.getParameter("promotion");
	
		String brand = request.getParameter("brand");
		int price = Integer.parseInt(request.getParameter("price"));
		System.out.println("writeCommentContr "+price);
		String email = request.getParameter("email");
		System.out.println(email);
		
		CommentVO comment = new CommentVO();
//		comment.setCommentId(comment_id);
		comment.setContent(content);
//		comment.setCommentDate(comment_date);
		comment.setProductName(product_name);
		comment.setPromotion(promotion);
		comment.setBrand(brand);
		comment.setPrice(price);
		comment.setEmail(email);
		
		return comment;
	}

}
