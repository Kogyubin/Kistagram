package kr.co.kitri.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kitri.comment.dao.CommentDAO;
import kr.co.kitri.comment.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO cdao;
	
	@Autowired
	private CommentService cservice;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int writeComment(CommentVO cvo) {
		
		int result=0;
		 try {
		    	result = cservice.writeComment(cvo);
		    	
		    } catch (Exception e) {
		    	e.printStackTrace();
		        result = -1;
		    }
		
		return cdao.insertComment(cvo);
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
