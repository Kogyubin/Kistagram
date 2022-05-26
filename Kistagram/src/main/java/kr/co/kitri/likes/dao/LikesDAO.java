package kr.co.kitri.likes.dao;


import kr.co.kitri.likes.vo.LikesVO;

public interface LikesDAO {
	public int insertLike(LikesVO lvo);
	public int deleteLike(LikesVO lvo);
	public int selectLike(LikesVO lvo);

}
