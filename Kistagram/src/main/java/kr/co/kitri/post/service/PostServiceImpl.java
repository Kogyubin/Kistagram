package kr.co.kitri.post.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.kitri.img.service.ImgService;
import kr.co.kitri.img.vo.ImgVO;
import kr.co.kitri.post.dao.PostDAO;
import kr.co.kitri.post.vo.PostImgVO;
import kr.co.kitri.post.vo.PostVO;

@Service

public class PostServiceImpl implements PostService {
	@Autowired
	private PostDAO pdao;
	
	@Autowired
	private ImgService iservice;

	@Override
	public List<PostVO> getPosts() {
		
		return pdao.selectPosts();
	}

	@Override
	public PostVO getPost(int post_no) {
		
		return pdao.selectPost(post_no);
	}

	@Override
	public boolean writePost(PostVO pvo) {
		int result = pdao.insertPost(pvo);
		boolean flag = false;
		
		if(result==1) {
			flag=true;
		}
		
		return flag;
	}

	@Override
	public boolean updatePost(PostVO pvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deletePost(int post_no) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public List<PostImgVO> getPostImgs() {
		
		return pdao.selectPostJoinImgs();
	}
	
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean writePostImg(PostVO pvo, List<MultipartFile> fileList) {
		
		String upLoadPath = "C:\\Users\\kitri\\git\\Kistagram\\Kistagram\\src\\main\\webapp\\resources\\uploadfolder";
		
		//upload경로
		File folder = new File(upLoadPath+File.separator+pvo.getId());
		if(!folder.exists()) {//folder가 존재하는지 여부
			folder.mkdir();//폴더 생성
		}
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String millisDate = sdf.format(now);
		
		boolean flag = writePost(pvo);
		
		boolean result =true;
		
		
		for(MultipartFile mf : fileList) {
			
			String oriFileName = mf.getOriginalFilename();//업로드 할때 진짜 파일 이름
			//a_20220222.txt
			
			if(oriFileName.equals("")) {
				
				break;
			}
			String fileName = oriFileName.substring(0, oriFileName.lastIndexOf("."));
			String end = oriFileName.substring(oriFileName.lastIndexOf("."), oriFileName.length());
			
			String safeFileName = fileName +"_" + millisDate + end;
			System.out.println("변경된 파일 명 : "+safeFileName);
			
			File upLoadFile = null;
			try {
				upLoadFile = new File(folder.getAbsolutePath()+File.separator+safeFileName);
				mf.transferTo(upLoadFile);
				
				ImgVO ivo = new ImgVO();
				ivo.setImg_path(folder.getAbsolutePath());
				ivo.setImg_name(safeFileName);
				ivo.setOri_img_name(oriFileName);
				
//				int i= 1/0;//에러
				if(flag) {
					boolean fileFlag = iservice.writeImgFile(ivo);
					if(fileFlag) {
						result=true;
						
					}else {
						result=false;
					}
				}
				
			} catch (IllegalStateException e) {
				
				if(upLoadFile.exists()) {
					upLoadFile.delete();
				}
				result=false;
				e.printStackTrace();
			} catch (IOException e) {
				if(upLoadFile.exists()) {
					upLoadFile.delete();
				}
				result=false;
				e.printStackTrace();
			
			} catch (Exception e) {
				if(upLoadFile.exists()) {
					upLoadFile.delete();
				}
				result=false;
				e.printStackTrace();
			}
			
		}
		
		return result;
	}


}
