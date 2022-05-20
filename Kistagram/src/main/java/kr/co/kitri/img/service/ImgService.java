package kr.co.kitri.img.service;

import java.util.List;

import kr.co.kitri.img.vo.ImgVO;
import kr.co.kitri.post.vo.PostImgVO;


public interface ImgService {
	public boolean writeImgFile(ImgVO ivo);
	public List<ImgVO> getImgFiles(int post_no);
	public ImgVO getImgFile(int img_no);
	public boolean removeImgFile(int img_no);
	public List<ImgVO> getImgFiles();
}
