package kr.co.kitri.member.service;

import org.springframework.stereotype.Service;

import kr.co.kitri.member.vo.MemberVO;

@Service
public interface MemberSvc {
	public boolean idCheck(String id);
	public boolean signIn(MemberVO mvo);
	public boolean signUp(MemberVO mvo);


}
