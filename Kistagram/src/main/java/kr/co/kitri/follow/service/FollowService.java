package kr.co.kitri.follow.service;

import java.util.HashMap;
import java.util.List;

import kr.co.kitri.follow.vo.FollowMemberProfileVO;
import kr.co.kitri.follow.vo.FollowVO;

public interface FollowService {
	
	public boolean requestFollow(FollowVO folvo);
	public List<FollowMemberProfileVO> getFollow(String id);
	public List<FollowMemberProfileVO> getFollower(String id);
	public int getFollowerCount(String id);
	public int getFollowCount(String id);
	public int getFollowState(HashMap<String, String> folmap);
	public boolean cancelFollowing(HashMap<String, String> folmap);

}
