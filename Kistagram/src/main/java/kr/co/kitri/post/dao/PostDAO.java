package kr.co.kitri.post.dao;

import java.util.List;

import kr.co.kitri.post.vo.PostImgMemberProfileVO;
import kr.co.kitri.post.vo.PostImgVO;
import kr.co.kitri.post.vo.PostVO;


public interface PostDAO {
	
	public List<PostVO> selectPosts();
	public int insertPost(PostVO pvo);
	public int updatePost(PostVO pvo);
	public int deletePost(int post_no);
	public List<PostImgVO> selectPostJoinImgs(String id);
	public List<PostImgMemberProfileVO> selectPost(int post_no);
	
}