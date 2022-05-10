package kr.co.kitri.post.dao;

import java.util.List;

import kr.co.kitri.post.vo.PostImgVO;
import kr.co.kitri.post.vo.PostVO;


public interface PostDAO {
	
	public int insertPost(PostVO pvo);
	public int updatePost(PostVO pvo);
	public int deletePost(int post_no);
	public List<PostImgVO> selectPostJoinImg();
	public PostVO selectImgBoard(int post_no);

}
