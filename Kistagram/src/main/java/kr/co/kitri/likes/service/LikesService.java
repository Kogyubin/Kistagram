package kr.co.kitri.likes.service;

import kr.co.kitri.likes.vo.LikesVO;

public interface LikesService {
	
	public boolean checkLike(LikesVO lvo);
	public int uncheckLike(LikesVO lvo);
	public int getLike(LikesVO lvo);

}
