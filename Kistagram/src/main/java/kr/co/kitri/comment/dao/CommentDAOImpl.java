package kr.co.kitri.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kitri.comment.vo.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertComment(CommentVO cvo) {
		return sqlSession.insert("comment.insertComment", cvo);
	}

	@Override
	public List<CommentVO> selectCommenst(int post_no) {
		return sqlSession.selectList("comment.selectComments");
	}

	@Override
	public List<CommentVO> selectChildComment(int post_no) {
		return sqlSession.selectList("comment.selectChildComment");
	}

}
