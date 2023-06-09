package com.pyeoni.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pyeoni.util.DateUtill;
import com.pyeoni.util.OracleUtill;
import com.pyeoni.vo.CommentVO;
import com.pyeoni.vo.MemberVO;

public class CommentDAO {
	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet re;
	
	// 전체 댓글 조회
	public List<CommentVO> selectAllComment(){
		List<CommentVO> commentList = new ArrayList<>();
		String sql = """
				SELECT c.comment_id, c.content, 
				TO_CHAR(c.comment_date, 'YYYY-MM-DD HH24:MI:SS') as created_datetime, 
				c.product_name, c.promotion, c.brand, c.price, c.email, m.username 
				FROM comments c 
				LEFT JOIN member m 
				ON c.email = m.email 
				ORDER BY c.comment_id asc 
				""";
		
		conn = OracleUtill.getConnection();
		
		try {
			pst = conn.prepareStatement(sql);
			re=pst.executeQuery();
			while(re.next()) {
				CommentVO comment = makeComment(re);
				commentList.add(comment);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, pst);
		}
		
		return commentList;
	}
	
	// 댓글 조회
	public List<CommentVO> selectComment(String product_name, String promotion, String brand, int price) {
		System.out.println(product_name + "/n" + promotion + "\n" + brand + "\n" +  price);
		List<CommentVO> commentList = new ArrayList<>();
		String sql = """
				SELECT c.comment_id, c.content, 
				TO_CHAR(c.comment_date, 'YYYY-MM-DD HH24:MI:SS') as created_datetime, 
				c.product_name, c.promotion, c.brand, c.price, c.email, m.username as username
				FROM comments c 
				LEFT JOIN member m 
				ON c.email = m.email 
				WHERE c.brand = ? AND c.price = ? AND c.product_name = ? 
				AND c.promotion = ? 
				ORDER BY c.comment_id asc 
				""";
		conn = OracleUtill.getConnection();
		
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, brand);
			pst.setInt(2, price);
			pst.setString(3, product_name);
			pst.setString(4, promotion);

			re=pst.executeQuery();
		
			while(re.next()) {
				
				CommentVO comment = makeComment(re);
				
				commentList.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(re, conn, pst);
		}
		
		return commentList;
	}
	
	// 댓글 삭제
	public int deleteComment(int commentId) {
		int result=0;
		String sql="""
				DELETE FROM comments WHERE COMMENT_ID = ?
				""";
		
		conn = OracleUtill.getConnection();
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, commentId);
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	
	// 댓글 작성
	public int writeComment(CommentVO comment) {

		int result=0;
		String sql="""
				insert into comments VALUES(SEQ_COMMENT_ID.nextval, ?, SYSDATE, ?, ?, ?, ?, ?)
				""";
		
		conn = OracleUtill.getConnection();
		
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, comment.getContent());
			pst.setString(2, comment.getProductName());
			pst.setString(3, comment.getPromotion());
			pst.setString(4, comment.getBrand());
			pst.setInt(5, comment.getPrice());
			pst.setString(6, comment.getEmail());
			
			result=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	/* 댓글 수정 */
	public int updateComment(String content, int id) {
		int result = 0;
		String sql="""
				update comments 
				set content = ? 
				where comment_id = ? 
				""";
		conn = OracleUtill.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, content);
			pst.setInt(2, id);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			OracleUtill.dbDisconnection(null, conn, pst);
		}
		
		return result;
	}
	
	// 댓글 객체 생성
	private CommentVO makeComment(ResultSet re) throws SQLException {
		
		CommentVO comment = new CommentVO();
		
		comment.setCommentId(re.getInt("COMMENT_ID"));
		comment.setContent(re.getString("CONTENT"));
		comment.setCommentDate(re.getString("created_datetime"));
		comment.setProductName(re.getString("PRODUCT_NAME"));
		comment.setPromotion(re.getString("PROMOTION"));
		comment.setBrand(re.getString("BRAND"));
		comment.setPrice(re.getInt("PRICE"));
		comment.setEmail(re.getString("username"));
		
		
		
		return comment;
	}
}
