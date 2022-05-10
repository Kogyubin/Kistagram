package kr.co.kitri.post.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kitri.post.vo.PostImgVO;
import kr.co.kitri.post.vo.PostVO;

@Repository
public class PostDAOImpl implements PostDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertPost(PostVO pvo) {
		return sqlSession.insert("post.insertPost", pvo);
	}

	@Override
	public int updatePost(PostVO pvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePost(int post_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PostImgVO> selectPostJoinImg() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PostVO selectImgBoard(int post_no) {
		// TODO Auto-generated method stub
		return null;
	}

}