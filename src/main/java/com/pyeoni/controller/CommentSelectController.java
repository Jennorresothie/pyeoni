package com.pyeoni.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.pyeoni.model.CommentService;
import com.pyeoni.vo.CommentVO;

public class CommentSelectController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {

		CommentService service = new CommentService();
		HttpServletRequest request = (HttpServletRequest) data.get("request");
		String method = (String) data.get("method");

		JSONObject commentsObj = new JSONObject();

		String productName = request.getParameter("product_name");
		String promotion = request.getParameter("promotion");
		String brand = request.getParameter("brand");

		int price = Integer.parseInt(request.getParameter("price"));

		List<CommentVO> commentList = service.selectComment(productName, promotion, brand, price);
		System.out.println(commentList);

		JSONArray arr = new JSONArray();
		for (CommentVO comment : commentList) {
			JSONObject obj = new JSONObject();
			obj.put("commentId", comment.getCommentId());
			obj.put("content", comment.getContent());
			obj.put("commentDate", comment.getCommentDate());
			obj.put("productName", comment.getProductName());
			obj.put("promotion", comment.getPromotion());
			obj.put("brand", comment.getBrand());
			obj.put("price", comment.getPrice());
			obj.put("email", comment.getEmail());
			arr.add(obj);
		}

		commentsObj.put("commentList", arr);

		return "responseBody:" + commentsObj.toJSONString();
	}

}
