package kr.co.kitri.member.dao;

import kr.co.kitri.member.vo.MemberVO;

public interface MemberDAO {

	public int selectSigninMember(MemberVO mvo); //로그인
//	public int selectIdofMember(String id); //id 조회
//	public int insertMember(MemberVO mvo); //등록

}
