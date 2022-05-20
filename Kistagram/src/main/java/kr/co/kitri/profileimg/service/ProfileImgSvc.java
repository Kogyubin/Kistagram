package kr.co.kitri.profileimg.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.kitri.member.vo.MemberVO;
import kr.co.kitri.profileimg.vo.ProfileImgVO;


public interface ProfileImgSvc {

	public boolean insertProfileImg(String id,  List<MultipartFile> fileList, Model model );

	public boolean writeProfileImg(ProfileImgVO pfvo);

	public ProfileImgVO selectProfileImg(ProfileImgVO pfvo);

	
}
