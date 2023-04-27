package com.pyeoni.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.MemberServices;
import com.pyeoni.vo.MemberVO;

public class AdminMemberController implements CommonControllerInterface {

	@Override
	public String execute(Map<String, Object> data) throws Exception {
		String page = "manageMember.jsp";
		
		MemberServices services = new MemberServices();
		
		List<MemberVO> memList = services.selectAll();
		
		HttpServletRequest req = (HttpServletRequest)data.get("request");
		req.setAttribute("MemList", memList);

		return page;
	}

}
