package kr.co.kitri.member.dao;

import kr.co.kitri.member.vo.MemberVO;

public interface MemberDAO {

	public int selectSigninMember(MemberVO mvo); //로그인
	public int selectIdofMember(String id); //id 조회
	public int insertMember(MemberVO mvo); //등록
	public int updateUser(MemberVO mvo); // 프로필 수정
	public MemberVO selectUser(MemberVO mvo); //login id 정보 불러오기

}
