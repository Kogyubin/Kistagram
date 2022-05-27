package kr.co.kitri.likes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kitri.likes.dao.LikesDAO;
import kr.co.kitri.likes.vo.LikesVO;

@Service
public class LikesServiceImpl implements LikesService {
	@Autowired
	private LikesDAO ldao;

	@Override
	public boolean checkLike(LikesVO lvo) {
		int result = ldao.insertLike(lvo);
		boolean flag = false;
		
		if(result==1) {
			flag=true;
		}
		
		return flag;
	}

	@Override
	public int uncheckLike(LikesVO lvo) {
		return ldao.deleteLike(lvo);
	}

	@Override
	public int getLike(LikesVO lvo) {
		return ldao.selectLike(lvo);
	}

}
