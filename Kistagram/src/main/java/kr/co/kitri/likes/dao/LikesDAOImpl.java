package kr.co.kitri.likes.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kitri.likes.vo.LikesVO;

@Repository
public class LikesDAOImpl implements LikesDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertLike(LikesVO lvo) {
		return sqlSession.insert("likes.insertLike", lvo);
	}

	@Override
	public int deleteLike(LikesVO lvo) {
		return sqlSession.delete("likes.deleteLike", lvo);
	}

	@Override
	public int selectLike(LikesVO lvo) {
		return sqlSession.selectOne("likes.selectLike", lvo);
	}

	

}
