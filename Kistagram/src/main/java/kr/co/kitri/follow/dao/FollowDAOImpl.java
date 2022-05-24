package kr.co.kitri.follow.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kitri.follow.vo.FollowVO;

@Repository
public class FollowDAOImpl implements FollowDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertFollow(FollowVO folvo) {
		
		return sqlSession.insert("follow", folvo);
	}

	@Override
	public int selectFollowerCount(String id) {
		
		return sqlSession.selectOne("follow.selectFollowerCount",id);
	}

	@Override
	public int selectFollowCount(String id) {
		
		return  sqlSession.selectOne("follow.selectFollowCount",id);
	}

	@Override
	public int selectFollowState(HashMap<String, String> folmap) {
		
		return sqlSession.selectOne("follow.selectFollowState",folmap);
	}

}
