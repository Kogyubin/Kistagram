package kr.co.kitri.member.dao;

import java.util.List;

import kr.co.kitri.member.vo.MemberVO;

public interface MemberDAO {

	public int selectSigninMember(MemberVO mvo); //로그인
	public int selectIdofMember(String id); //id 조회
	public int insertMember(MemberVO mvo); //등록
	public int updateUser(MemberVO mvo); // 프로필 수정
	public MemberVO selectUser(MemberVO mvo); //login id 정보 불러오기
	public List<String> selectSearchMember(MemberVO mvo); //검색시 id 정보 불러오기
	public int updateProfileNo(MemberVO mvo); // 프로필 사진 등록시 member테이블 no값


}
