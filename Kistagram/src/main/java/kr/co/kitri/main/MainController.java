package kr.co.kitri.main;


import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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

import com.fasterxml.jackson.databind.util.JSONPObject;

import kr.co.kitri.comment.service.CommentService;
import kr.co.kitri.comment.vo.CommentVO;
import kr.co.kitri.img.service.ImgService;
import kr.co.kitri.likes.vo.LikesVO;
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
	
	@Autowired
	private CommentService cservice;
	

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
		
		List<PostImgVO> pilist = pservice.getPostImgs(session_id);
		
		mvo.setId(session_id);
		mvo = mdao.selectUser(mvo);
		String member_md = mvo.getId();
		String member_itd = mvo.getIntroduce();
		
		System.out.println(session_id);
		
		
		ProfileImgVO pfvo = new ProfileImgVO();
		pfvo.setId(session_id);
		ProfileImgVO pfvo2 = pfdao.selectProfileImg(pfvo);
		String profile_name="";
		if(pfvo2 != null) {
			profile_name = pfvo2.getProfile_name();
		}
		model.addAttribute("profile_name", profile_name);
		model.addAttribute("id", member_md);
		model.addAttribute("introduce", member_itd);
		model.addAttribute("session_id", session_id);
		model.addAttribute("pilist", pilist);
		
		
		return "index";
	}

	@RequestMapping("/detail")
	@ResponseBody
	public List<PostImgVO> detail(int post_no, Model model) {
		
		List<PostImgVO> pivo = pservice.getPost(post_no);
		model.addAttribute("pivo", pivo);
		
		return pivo;
	}
	
//좋아요
//	@ResponseBody
//	  @RequestMapping(value="/like-action", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
//	  public String likeAction(int post_no, HttpSession session){
//	    //System.out.println("--> like() created");
//		String session_id = (String)session.getAttribute("session_id");
//	    JSONPObject obj = new JSONPObject();
//	    
//	    ArrayList<String> msgs = new ArrayList<String>();
//	    HashMap <String, Object> hashMap = new HashMap<String, Object>();
//	    hashMap.put("post_no", post_no);
//	    hashMap.put("session_id", session_id);
//	    LikesVO likesvo = likesProc.read(hashMap);
//	    
//	    PostVO pvo = postProc.read(post_no);
//	    int like_cnt = pvo.getLike_cnt();     //게시판의 좋아요 카운트
//	    int like_check = 0;
//	    like_check = likesvo.getLike_check();   //좋아요 체크 값
//	    
//	    if(likesProc.countbyLike(hashMap)==0){
//	      likesProc.create(hashMap);
//	    }
//	      
//	    if(like_check == 0) {
//	      msgs.add("좋아요!");
//	      likesProc.like_check(hashMap);
//	      like_check++;
//	      like_cnt++;
//	      postProc.like_cnt_up(post_no);   //좋아요 갯수 증가
//	    } else {
//	      msgs.add("좋아요 취소");
//	      likesProc.like_check_cancel(hashMap);
//	      like_check--;
//	      like_cnt--;
//	      postProc.like_cnt_down(post_no);   //좋아요 갯수 감소
//	    }
//	    obj.put("post_no", likesvo.getPost_no());
//	    obj.put("like_check", like_check);
//	    obj.put("like_cnt", like_cnt);
//	    obj.put("msg", msgs);
//	    
//	    return obj.toJSONString();
//	  }

	
	@RequestMapping(value ="/commentList", method = RequestMethod.GET)
	@ResponseBody
	public List<CommentVO> commentList(int post_no, Model model) {
		
		List<CommentVO> clist = cservice.getComments(post_no);
				
		model.addAttribute("clist", clist);
		
		return clist;
	}
	
	@ResponseBody
	@RequestMapping(value = "/write-comment-action")
	public boolean writeCommentAction(Locale locale, HttpSession session, Model model, CommentVO cvo) {
		
		boolean result = cservice.writeComment(cvo);
		
		return result;
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
