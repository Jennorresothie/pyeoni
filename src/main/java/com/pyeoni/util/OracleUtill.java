package com.pyeoni.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OracleUtill {
	
	public static Connection getConnection() {
		Connection conn = null;
		
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}

//	public static Connection getConnection() {
//		Connection conn = null;
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String userid = "hr", pass="hr";
//		
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");// 구현체 불러옴
//			conn=DriverManager.getConnection(url, userid, pass);// 연결
//			
//			
//		} catch (ClassNotFoundException | SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		
//		return conn;
//	}
//	
	public static void dbDisconnection(ResultSet rs, Connection conn, Statement st) {
		try {
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
