package kr.co.kitri.main;


import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.kitri.comment.service.CommentService;
import kr.co.kitri.comment.vo.CommentVO;
import kr.co.kitri.img.service.ImgService;
import kr.co.kitri.img.vo.ImgVO;
import kr.co.kitri.post.service.PostService;
import kr.co.kitri.post.vo.PostImgVO;
import kr.co.kitri.post.vo.PostVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	@Autowired
	private PostService pservice;
	@Autowired 
	private ImgService iservice;
	@Autowired
	private CommentService cservice;
	

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, HttpSession session, Model model) {

		String session_id = (String)session.getAttribute("session_id");
		if (session_id == null) {
			return "redirect:/sign-in";
		}
		List<PostImgVO> pilist = pservice.getPostImgs();
		
		System.out.println(session_id);
		
		model.addAttribute("session_id", session_id);
		model.addAttribute("pilist", pilist);
		

		return "index";
	}

	@RequestMapping("/detail")
	@ResponseBody
	public PostImgVO detail(int post_no, Model model) {
		
		PostImgVO pivo = pservice.getPost(post_no);
		model.addAttribute("pivo", pivo);
		
		return pivo;
	}
	
	

//댓글 등록	
	@ResponseBody
	@RequestMapping(value = "/write-comment-action", method = RequestMethod.GET)
	public String writeComment(MultipartHttpServletRequest multiPart,
			HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("session_id");
		String comment_content = multiPart.getParameter("comment_content");
		
		CommentVO cvo = new CommentVO();
		cvo.setId(id);
		cvo.setComment_content(comment_content);
		
		int result = cservice.writeComment(cvo);
		
		
		return "success";
	}
	
	@RequestMapping("/write-action")
	@ResponseBody
	public String writeAction(MultipartHttpServletRequest multiPart,
			HttpSession session, Model model) {
		
		List<MultipartFile> fileList =  multiPart.getFiles("uploadfile");
		
		String id = (String)session.getAttribute("session_id");
		String content = multiPart.getParameter("content");
		
		
		PostVO pvo = new PostVO();
		pvo.setId(id);
		pvo.setContent(content);
		
		boolean result = pservice.writePostImg(pvo, fileList);
		
		return "redirect:main";


	}
	
}
