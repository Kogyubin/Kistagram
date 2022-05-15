package kr.co.kitri.comment.service;

import java.util.List;

import kr.co.kitri.comment.vo.CommentVO;


public interface CommentService {
	
	public int writeComment(CommentVO cvo);
	public List<CommentVO> getComments(int post_no);
	public List<CommentVO> getChildComment(int post_no);

}
