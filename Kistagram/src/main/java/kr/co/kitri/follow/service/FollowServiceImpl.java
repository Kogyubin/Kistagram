package kr.co.kitri.follow.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kitri.follow.dao.FollowDAO;
import kr.co.kitri.follow.vo.FollowMemberProfileVO;
import kr.co.kitri.follow.vo.FollowVO;

@Service
public class FollowServiceImpl implements FollowService {
	@Autowired
	private FollowDAO fdao;
	
	@Autowired FollowService fservice;
	
	@Override
	public boolean requestFollow(FollowVO folvo) {
		int result = fdao.insertFollow(folvo);
		boolean flag = false;
		
		if(result==1) {
			flag=true;
		}
		
		return flag;
	}

	@Override
	public List<FollowMemberProfileVO> getFollow(String id) {
		
		return fdao.selectFollowing(id);
	}

	@Override
	public List<FollowMemberProfileVO> getFollower(String id) {
		
		return fdao.selectFollower(id);
	}

	@Override
	public int getFollowerCount(String id) {
		
		return fdao.selectFollowerCount(id);
	}

	@Override
	public int getFollowCount(String id) {
		
		return fdao.selectFollowCount(id);
	}

	@Override
	public int getFollowState(HashMap<String, String> folmap) {
		
		int result = fdao.selectFollowState(folmap);
		
		return result;
	}

	@Override
	public boolean cancelFollowing(HashMap<String, String> folmap) {
		
		int result = fdao.deleteFollowing(folmap);
		
		boolean flag = false;
		
		if(result==1) {
			flag=true;
		}
		
		return flag;
	}

}
