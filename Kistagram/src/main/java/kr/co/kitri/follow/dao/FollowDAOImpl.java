package kr.co.kitri.follow.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kitri.follow.vo.FollowMemberProfileVO;
import kr.co.kitri.follow.vo.FollowVO;

@Repository
public class FollowDAOImpl implements FollowDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertFollow(FollowVO folvo) {
		
		return sqlSession.insert("follow.insertFollow", folvo);
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

	@Override
	public List<FollowMemberProfileVO> selectFollower(String id) {
		
		return sqlSession.selectList("follow.selectFollower", id);
	}

	@Override
	public List<FollowMemberProfileVO> selectFollowing(String id) {
		
		return sqlSession.selectList("follow.selectFollowing", id);
	}

	@Override
	public int deleteFollowing(HashMap<String, String> folmap) {
		return sqlSession.delete("follow.deleteFollowing", folmap);
	}

}
