package kr.co.kitri.profileimg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kitri.member.vo.MemberVO;
import kr.co.kitri.profileimg.vo.ProfileImgVO;



@Repository
public class ProfileImgDAOImpl implements ProfileImgDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertImgFile(ProfileImgVO pfvo) {
		return sqlSession.insert("profile.insertProfileFile", pfvo);
	}

	@Override
	public ProfileImgVO selectProfileImg(ProfileImgVO pfvo) {
		return sqlSession.selectOne("profile.selectProfileImg", pfvo);
	}
	
	@Override
	public int updateProfileImg(ProfileImgVO pfvo) {
		
		return sqlSession.update("profile.updateProfileImg", pfvo);
	}

}
