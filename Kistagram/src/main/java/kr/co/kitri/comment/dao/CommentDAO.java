package kr.co.kitri.comment.dao;

import java.util.List;

import kr.co.kitri.comment.vo.CommentVO;

public interface CommentDAO {
	public int insertComment(CommentVO cvo);
	public List<CommentVO> selectCommenst(int post_no);
	public List<CommentVO> selectChildComment(int post_no);

}
