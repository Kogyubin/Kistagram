package kr.co.kitri.follow.dao;

import kr.co.kitri.follow.vo.FollowVO;

public interface FollowDAO {
	
	public int insertFollow(FollowVO folvo);
	public int selectFollowerCount(String id);
	public int selectFollowCount(String id);

}
