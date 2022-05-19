package kr.co.kitri.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kitri.comment.dao.CommentDAO;
import kr.co.kitri.comment.vo.CommentVO;
import kr.co.kitri.post.vo.PostVO;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO cdao;
	
	@Override
	public boolean writeComment(CommentVO cvo) {
		
			int result = cdao.insertComment(cvo);
			boolean flag = false;
			
			if(result==1) {
				flag=true;
			}
			
			return flag;
		}
	

	@Override
	public List<CommentVO> getComments(int post_no) {
		
		return cdao.selectComments(post_no);
	}

	@Override
	public List<CommentVO> getChildComment(int post_no) {
		
		return cdao.selectChildComment(post_no);
	}

}
