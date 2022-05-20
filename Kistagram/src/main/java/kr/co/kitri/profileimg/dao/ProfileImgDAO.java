package kr.co.kitri.profileimg.dao;

import java.util.List;


import kr.co.kitri.profileimg.vo.ProfileImgVO;



public interface ProfileImgDAO {
	public int insertImgFile(ProfileImgVO pfvo); 
	public ProfileImgVO selectProfileImg(ProfileImgVO pfvo);
	public int updateProfileImg(ProfileImgVO pfvo);


}
