package kr.co.kitri.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kitri.member.dao.MemberDAO;
import kr.co.kitri.member.dao.MemberDAOImpl;
import kr.co.kitri.member.vo.MemberVO;
import kr.co.kitri.search.vo.SearchVO;

@Service
public class MemberSvcImpl implements MemberSvc {


	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private MemberSvc msvc;
	
	@Autowired
	private MemberDAOImpl mdpl;

	@Override
	public boolean signIn(MemberVO mvo) {

		int result = mdao.selectSigninMember(mvo);

		boolean flag = false;
		if(result==0) {//로그인 실패
			flag=false;
		}else {//로그인 성공
			flag=true;
		}

		return flag;
	}

	@Override
	public boolean idCheck(String id) {
		mdao.selectIdofMember(id);
		int result = mdao.selectIdofMember(id);
		if(result==0) {
			return true;
		}else {
			return false;
		}
		
		
		
	}
	
	@Override
	public boolean signUp(MemberVO mvo) {
		
		int result = mdao.insertMember(mvo);
		boolean flag = false;
		
		if(result==0) {
			flag= false;
		}else {
			flag= true;
		}
		
		return flag;
	}
	
	@Override
	public MemberVO selectUser(MemberVO mvo) {
		
		MemberVO result = mdao.selectUser(mvo);
		
		return result;

	}
	
	@Override
	public boolean updateUser(MemberVO mvo) {
		
		int result = mdao.updateUser(mvo);
		
		boolean flag = false;
		
		if(result==0) {
			flag= false;
		}else {
			flag= true;
		}
		
		return flag;
		
	}
	
	@Override
	public String[] selectSearchMember(MemberVO mvo) {
		ArrayList<String> list = (ArrayList<String>) mdao.selectSearchMember(mvo);
		
		System.out.println(list);
		
		
		String[] result = list.toArray(new String[list.size()]);
		
		return result;

	}

	@Override
	public List<SearchVO> SearchProfile(SearchVO svo) {
				
		List<SearchVO> result = mdao.selectSearchProfile(svo);
				
		return result;
		
		}
	
}


