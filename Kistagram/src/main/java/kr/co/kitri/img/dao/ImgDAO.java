package kr.co.kitri.img.dao;

import java.util.List;

import kr.co.kitri.img.vo.ImgVO;

public interface ImgDAO {
	
	public int insertImg(ImgVO ivo);
	public List<ImgVO> selectImgs(int post_no);
	public ImgVO selectImg(int img_no);
	public int deleteImg(int img_no);
	public List<ImgVO> selectImgs();

}
