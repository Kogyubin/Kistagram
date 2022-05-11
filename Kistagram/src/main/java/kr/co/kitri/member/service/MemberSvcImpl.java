package kr.co.kitri.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kitri.member.dao.MemberDAO;
import kr.co.kitri.member.vo.MemberVO;

@Service
public class MemberSvcImpl implements MemberSvc {


	@Autowired
	private MemberDAO mdao;


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
	

}


