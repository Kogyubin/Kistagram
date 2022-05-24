package kr.co.kitri.follow.service;

import java.util.List;

import kr.co.kitri.follow.vo.FollowVO;

public interface FollowService {
	
	public boolean requestFollow(FollowVO folvo);
	public List<FollowVO> getFollow(String id);
	public List<FollowVO> getFollower(String id);
	public int getFollowerCount(String id);
	public int getFollowCount(String id);
	

}
