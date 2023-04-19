package com.pyeoni.model;

import com.pyeoni.vo.MemberVO;

public class MemberServices {
	MemberDAO dao = new MemberDAO();
	
	/* 회원가입 */
	public int insertMem(MemberVO mem) {
		return dao.insertMem(mem);
	}
	
	/* 중복체크 */
	public int dupCheck(String email) {
		return dao.dupCheck(email);
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
}