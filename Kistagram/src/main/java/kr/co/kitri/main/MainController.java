package kr.co.kitri.main;


import java.text.DateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.kitri.comment.service.CommentService;
import kr.co.kitri.comment.vo.CommentVO;
import kr.co.kitri.img.service.ImgService;
import kr.co.kitri.member.dao.MemberDAO;
import kr.co.kitri.member.service.MemberSvc;
import kr.co.kitri.member.vo.MemberVO;
import kr.co.kitri.post.service.PostService;
import kr.co.kitri.post.vo.PostImgVO;
import kr.co.kitri.post.vo.PostVO;
import kr.co.kitri.profileimg.dao.ProfileImgDAO;
import kr.co.kitri.profileimg.service.ProfileImgSvc;
import kr.co.kitri.profileimg.vo.ProfileImgVO;

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
	private MemberSvc msvc;
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private ProfileImgSvc pfsvc;

	@Autowired
	private ProfileImgDAO pfdao;
	

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, HttpSession session, Model model) {
		MemberVO mvo = new MemberVO();
		
		String session_id = (String)session.getAttribute("session_id");
		if (session_id == null) {
			return "redirect:/sign-in";
		}
		List<PostImgVO> pilist = pservice.getPostImgs();
		
		mvo.setId(session_id);
		mvo = mdao.selectUser(mvo);
		String member_md = mvo.getId();
		String member_itd = mvo.getIntroduce();
		
		System.out.println(session_id);
		
		
		ProfileImgVO pfvo = new ProfileImgVO();
		
		pfvo.setId(session_id);
		ProfileImgVO pfvo2 = pfdao.selectProfileImg(pfvo);
		
		String profile_name = pfvo2.getProfile_name();
	
		
		
		
		model.addAttribute("profile_name", profile_name);
		model.addAttribute("id", member_md);
		model.addAttribute("introduce", member_itd);
		model.addAttribute("session_id", session_id);
		model.addAttribute("pilist", pilist);
		
		
		
		
		
		return "index";
	}

	@RequestMapping("/detail")
	@ResponseBody
	public PostVO detail(int post_no) {
		
		PostVO pvo = pservice.getPost(post_no);
	
		return pvo;
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/addComment", method = RequestMethod.GET)
//	public String addComment(Locale locale, HttpSession session, Model model, CommentVO cvo) {
//		
//		int result=0;
//		 try {
//		    	result = cservice.writeComment(cvo);
//		    } catch (Exception e) {
//		    	e.printStackTrace();
//		        result = -1;
//		    }
//		
//		return result;
//	}

	
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
