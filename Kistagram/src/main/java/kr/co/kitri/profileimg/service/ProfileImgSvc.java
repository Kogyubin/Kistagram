package kr.co.kitri.profileimg.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.kitri.member.vo.MemberVO;
import kr.co.kitri.profileimg.vo.ProfileImgVO;


public interface ProfileImgSvc {

	public boolean insertProfileImg(String id,  List<MultipartFile> fileList, Model model, HttpServletRequest re  );

	public boolean writeProfileImg(ProfileImgVO pfvo,MemberVO mvo);

	public ProfileImgVO selectProfileImg(ProfileImgVO pfvo);



	
}
