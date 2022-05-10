package kr.co.kitri.img.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.kitri.img.vo.ImgVO;
import kr.co.kitri.post.vo.PostImgVO;

@Service
public class ImgServiceImpl implements ImgService {

	@Override
	public boolean writeImgFile(ImgVO ivo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ImgVO> getImgFiles(int post_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ImgVO getImgFile(int img_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeImgFile(int img_no) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ImgVO> getImgFiles() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
