package kr.co.kitri.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.kitri.member.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO {
	

	@Autowired
	SqlSession sqlSession;

	
	@Override
	public int selectSigninMember(MemberVO mvo) {
		return sqlSession.selectOne("member.selectSigninMember", mvo);
	}

	
	

}
