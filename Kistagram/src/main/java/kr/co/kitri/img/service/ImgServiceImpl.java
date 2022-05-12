package kr.co.kitri.img.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kitri.img.dao.ImgDAO;
import kr.co.kitri.img.vo.ImgVO;
import kr.co.kitri.post.vo.PostImgVO;

@Service
public class ImgServiceImpl implements ImgService {
	
	@Autowired
	private ImgDAO idao;
	
	@Override
	public boolean writeImgFile(ImgVO ivo) {
		int result = idao.insertImg(ivo);
		boolean flag = false;
		if(result !=0) {
			flag= true;
		}
		return flag;
	}

	@Override
	public List<ImgVO> getImgFiles(int post_no) {
		
		return idao.selectImgs(post_no);
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
		
		return idao.selectImgs();
	}

	
}
