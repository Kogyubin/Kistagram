package kr.co.kitri.profileimg.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.kitri.img.vo.ImgVO;
import kr.co.kitri.member.dao.MemberDAO;
import kr.co.kitri.member.vo.MemberVO;
import kr.co.kitri.post.vo.PostVO;
import kr.co.kitri.profileimg.dao.ProfileImgDAO;
import kr.co.kitri.profileimg.vo.ProfileImgVO;


	
	@Service
	public class ProfileImgSvcImpl implements ProfileImgSvc {
		
		
		@Autowired
		private ProfileImgDAO pfdao;
		
		@Autowired
		private MemberDAO mdao;
		
		
		@Override
		public boolean writeProfileImg(ProfileImgVO pfvo, MemberVO mvo) {
			
			ProfileImgVO profile_name = pfdao.selectProfileImg(pfvo);
			
			int result=0;
			if(profile_name==null) {
				result = pfdao.insertImgFile(pfvo);
				mdao.updateProfileNo(mvo);
				
			} else {
				result = pfdao.updateProfileImg(pfvo);
			} 
			
			
			boolean flag = false;
			if(result==1) {
				flag = true;
			}

			
			return flag;
		}
		
			
		
		@Override
		@Transactional(rollbackFor=Exception.class)
		public boolean insertProfileImg(String id, List<MultipartFile> fileList, Model model, HttpServletRequest req) {
			
			String upLoadPath = req.getSession().getServletContext().getRealPath("resources/profileimg-uploadfolder");
						
			
			//upload경로
			File folder = new File(upLoadPath+File.separator+id);
			if(!folder.exists()) {//folder가 존재하는지 여부
				folder.mkdir();//폴더 생성
			}
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String millisDate = sdf.format(now);
			
			
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
				
				File upLoadFile = null;
				
				try {
					upLoadFile = new File(folder.getAbsolutePath()+File.separator+safeFileName);
					mf.transferTo(upLoadFile);
					
					ProfileImgVO pfvo = new ProfileImgVO();
					pfvo.setProfile_path(folder.getAbsolutePath());
					pfvo.setProfile_name(safeFileName);
					pfvo.setProfile_size(upLoadFile.length());
					pfvo.setOri_profile_name(oriFileName);
					pfvo.setId(id);
					
					MemberVO mvo = new MemberVO();
					mvo.setId(id);
					
//					int i= 1/0;//에러
						
					
						boolean fileFlag = writeProfileImg(pfvo, mvo);
						if(fileFlag) {
							result=true;
							
						}else {
							result=false;
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
		
		@Override
		public ProfileImgVO selectProfileImg(ProfileImgVO pfvo) {
			
			ProfileImgVO result = pfdao.selectProfileImg(pfvo);
			
			return result;

		}
		
		
		
	}

