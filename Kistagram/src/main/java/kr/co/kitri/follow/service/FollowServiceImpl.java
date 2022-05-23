package kr.co.kitri.follow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kitri.follow.dao.FollowDAO;
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
	public List<FollowVO> getFollow(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FollowVO> getFollower(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getFollowerCount(String id) {
		
		return fdao.selectFollowerCount(id);
	}

	@Override
	public int getFollowCount(String id) {
		
		return fdao.selectFollowCount(id);
	}

}
