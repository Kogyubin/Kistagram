package kr.co.kitri.post.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.kitri.post.vo.PostImgVO;
import kr.co.kitri.post.vo.PostVO;

public interface PostService {
	
	public List<PostVO> getPosts();
	public PostVO getPost(int post_no);
	public boolean writePost(PostVO pvo);
	public boolean updatePost(PostVO pvo);
	public boolean deletePost(int post_no);
	public List<PostImgVO> getPostImgs();
	public boolean writePostImg(PostVO pvo, List<MultipartFile> fileList);

}
