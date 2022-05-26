package kr.co.kitri.follow.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.kitri.follow.vo.FollowMemberProfileVO;
import kr.co.kitri.follow.vo.FollowVO;

public interface FollowDAO {
	
	public int insertFollow(FollowVO folvo);
	public int selectFollowerCount(String id);
	public int selectFollowCount(String id);
	public int selectFollowState(HashMap<String, String> folmap);
	public List<FollowMemberProfileVO> selectFollower(String id);
	public List<FollowMemberProfileVO> selectFollowing(String id);
	

}
