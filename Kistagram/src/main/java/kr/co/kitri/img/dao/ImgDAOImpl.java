package kr.co.kitri.img.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kitri.img.vo.ImgVO;

@Repository
public class ImgDAOImpl implements ImgDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertImg(ImgVO ivo) {
		return sqlSession.insert("img.insertImg", ivo);
	}

	@Override
	public List<ImgVO> selectImgs(int post_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ImgVO> selectImgs() {
		
		return sqlSession.selectList("img.selectImgs");
	}

	@Override
	public ImgVO selectImg(int img_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteImg(int img_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
