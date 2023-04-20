package com.pyeoni.model;

import java.util.List;

import com.pyeoni.vo.MemberVO;

public class MemberServices {
	MemberDAO dao = new MemberDAO();
	
	/* 회원가입 */
	public int insertMem(MemberVO mem) {
		return dao.insertMem(mem);
	}
	
	/* email 중복체크 */
	public int emailDupCheck(String email) {
		return dao.emailDupCheck(email);
	}
	
	/* username 중복체크 */
	public int usernameDupCheck(String username) {
		return dao.usernameDupCheck(username);
	}
	
	/* 로그인 */
	public MemberVO login(String email, String password) {
		return dao.login(email, password);
	}
	
	/* 회원탈퇴 */
	public int signout(String email, String password) {
		return dao.signout(email, password);
	}
	
	/* 회원 정보 수정 */
	public int memUpdate(MemberVO mem) {
		return dao.memUpdate(mem);
	}
	
	/* 회원 전체 정보 */
	public List<MemberVO> selectAll() {
		return dao.selectAll();
	}
}
