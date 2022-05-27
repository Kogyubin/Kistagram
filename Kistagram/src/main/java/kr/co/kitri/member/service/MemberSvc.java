package kr.co.kitri.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.kitri.member.vo.MemberVO;
import kr.co.kitri.post.vo.PostVO;
import kr.co.kitri.search.vo.SearchVO;

@Service
public interface MemberSvc {
	public boolean idCheck(String id);
	public boolean signIn(MemberVO mvo);
	public boolean signUp(MemberVO mvo);
	public MemberVO selectUser(MemberVO mvo);
	public boolean updateUser(MemberVO mvo);
	public String[] selectSearchMember(MemberVO mvo);
	public List<SearchVO> SearchProfile(SearchVO svo);
}
