package com.pyeoni.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pyeoni.model.LikeServices;
import com.pyeoni.model.ProductServices;
import com.pyeoni.vo.MemberVO;
import com.pyeoni.vo.ProductLikeVO;
import com.pyeoni.vo.ProductVO;

public class PageUpdateListController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		// 상품 더 보기를 눌렀을 때
		int start, end;

		String method = (String) data.get("method");
		System.out.println(method + " : 메소드");
		HttpServletRequest req = (HttpServletRequest) data.get("request");
		HttpSession browser = req.getSession();
		Object temploginUser =  browser.getAttribute("loginUser");
		MemberVO loginUser = null;
		String email =  null;
		if(temploginUser!=null) {
			loginUser = (MemberVO)temploginUser;
			email = loginUser.getEmail();
		} 
		
		String brandValue = req.getParameter("brand");

		String searchValue = req.getParameter("search_bar");

		String sortValue = req.getParameter("sort_type");

		String eventValue = req.getParameter("event_type");

		String kindValue = req.getParameter("product_type");

		ProductServices services = new ProductServices();
		List<ProductVO> productList = new ArrayList<>();
		List<ProductLikeVO> newproductList = new ArrayList<>();
		LikeServices ls = new LikeServices();
		start = req.getParameter("start") != null ? Integer.parseInt(req.getParameter("start")) : 1;
		end = req.getParameter("end") != null ? Integer.parseInt(req.getParameter("end")) : 20;

		productList = services.selectAdvancedProduct(start, end, searchValue, sortValue, kindValue, eventValue,
				brandValue);
		for(ProductVO pv : productList) {
			ProductLikeVO plv = new ProductLikeVO();
	
			plv.setBrand(pv.getBrand());
			plv.setKind(pv.getKind());
			plv.setPrice(pv.getPrice());
			plv.setProductImg(pv.getProductImg());
			plv.setProductName(pv.getProductName());
			plv.setPromotion(pv.getPromotion());
			int likes = ls.selectLike(pv.getBrand(), pv.getPrice(), pv.getProductName(), pv.getPromotion());
			plv.setLikenum(likes);
			int chk = 0;
			if(email!=null) {
				chk = ls.memberlike(pv.getBrand(), pv.getPrice(), pv.getProductName(), pv.getPromotion(), email);
			}
			plv.setCheck(chk);
			newproductList.add(plv);

		}

		req.setAttribute("productList", newproductList);

		return "../product/AddList.jsp";
	}

}
