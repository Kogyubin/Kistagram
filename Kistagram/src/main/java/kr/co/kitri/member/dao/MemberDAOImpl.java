package kr.co.kitri.member.dao;

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


	@Override
	public int insertMember(MemberVO mvo) {

		return sqlSession.insert("member.insertMember", mvo);
		
	}

	@Override
	public int selectIdofMember(String id) {
		
		return sqlSession.selectOne("member.selectIdofMember", id);
		
	}

	@Override
	public int updateUser(MemberVO mvo) {
		
		return sqlSession.update("member.updateUser", mvo);
	}
	
	@Override
	public MemberVO selectUser(MemberVO mvo) {
		
		return sqlSession.selectOne("member.selectUser", mvo);
	}
}
