package com.pyeoni.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.view")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		CommonControllerInterface controll = null;
		Map<String, Object> data = new HashMap<>();
		data.put("method", request.getMethod());
		data.put("request", request);
		
		System.out.println("프론트 컨트롤러에서 "+path);
		
		switch (path) {
		case "/page/main.view":
			controll = new MainpageController();
			break;
		case "/auth/login.view":
			controll = new LoginController();
			break;
		case "/auth/logout.view":
			controll = new LogoutController();
			break;
		case "/auth/signup.view":
			controll = new SignUpController();
			break;
		case "/auth/emailDupCheck.view":
			controll = new EmailDupController();
			break;
		case "/auth/usernameDupCheck.view":
			controll = new UserNameController();
			break;
		case "/memeber/memberDetail.view":
			controll = new MemberDetailController();
			break;
		case "/memeber/memberSignout.view":
			controll = new MemberSignOutController();
			break;
		case "/page/cu.view":
			controll = new CuController();
			break;
			
		default:
			throw new IllegalArgumentException("Unexpected value: " + path);
		}
		
		
		String page = null;
		try {
			page = controll.execute(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("return : "+page);
		HttpSession session = request.getSession();
		for(String key : data.keySet()) {
			if(key.equals("loginUser")) {
				session.setAttribute(key, data.get(key));
			}
		}
		
		// 리다이렉트 처리
		if(page.indexOf("redirect:")>=0) {
			response.sendRedirect(page.substring(9));
		}
		else if(page.indexOf("download")>=0) {
			
		}
		else if(page.indexOf("responseBody:")>=0) {
			response.setContentType("text/html;charset=UTF-8"); //한글 깨짐 방지
			response.getWriter().append(page.substring(13));
		}
		// forward 처리
		else {
			System.out.println("포워드 함");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}
		

}