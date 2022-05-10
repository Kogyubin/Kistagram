package kr.co.kitri.member.service;

import kr.co.kitri.member.vo.MemberVO;

public interface MemberSvc {
	public boolean idCheck(String id);
	public boolean signIn(MemberVO mvo);
	public boolean signUp(MemberVO mvo);


}
