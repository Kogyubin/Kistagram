//package kr.co.kitri.profileImg.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//
//import kr.co.kitri.profileImg.vo.ProfileImgVO;
//
//
//	@Autowired
//	private ProfileImgDAO pfDao;
//
//
//
//	@Service
//	public class ProfileImgSvcImpl implements ProfileImgSvc {
//		@Override
//		public boolean insertImgFile(ProfileImgVO pfvo) {
//			int result = pfDao.insertImgFile(pfvo);
//			boolean flag = false;
//			if(result != 0) {
//				flag=true;
//			}
//			return flag;
//		}
//		
//	}
