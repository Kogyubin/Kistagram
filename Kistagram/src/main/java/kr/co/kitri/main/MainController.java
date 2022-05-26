package kr.co.kitri.main;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.kitri.comment.service.CommentService;
import kr.co.kitri.comment.vo.CommentVO;
import kr.co.kitri.follow.service.FollowService;
import kr.co.kitri.follow.vo.FollowMemberProfileVO;
import kr.co.kitri.follow.vo.FollowVO;
import kr.co.kitri.img.service.ImgService;
import kr.co.kitri.likes.service.LikesService;
import kr.co.kitri.likes.vo.LikesVO;
import kr.co.kitri.member.dao.MemberDAO;
import kr.co.kitri.member.service.MemberSvc;
import kr.co.kitri.member.vo.MemberVO;
import kr.co.kitri.post.service.PostService;
import kr.co.kitri.post.vo.PostImgMemberProfileVO;
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
	
	@Autowired 
	private FollowService fservice;
	
	@Autowired
	private LikesService lservice;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/main/{urlId}", method = RequestMethod.GET)
	public String main(@PathVariable String urlId, Locale locale, HttpSession session, Model model) {
		
		MemberVO mvo = new MemberVO();
		
		String session_id = (String)session.getAttribute("session_id");
		if (session_id == null) {
			return "redirect:/sign-in";
		}
		
		System.out.println(session_id);
		//메인화면 이미지 리스트
		List<PostImgVO> pilist = pservice.getPostImgs(urlId);
		
		mvo.setId(urlId);
		mvo = mdao.selectUser(mvo);
		String member_md = mvo.getId();
		String member_itd = mvo.getIntroduce();
		
		//팔로우 유무
		
		HashMap<String, String> folmap = new HashMap<String, String>();
		
		folmap.put("id", session_id);
		folmap.put("id2", member_md);
		
		System.out.println(folmap);
		
		int followState = fservice.getFollowState(folmap);
		
		//팔로우, 팔로워 수
		int followerCnt = fservice.getFollowerCount(member_md);
		int followCnt = fservice.getFollowCount(member_md);
		
		
		
		
		ProfileImgVO pfvo = new ProfileImgVO();
		pfvo.setId(urlId);
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
		model.addAttribute("followerCnt", followerCnt);
		model.addAttribute("followCnt", followCnt);
		model.addAttribute("followState", followState);
		
		return "index";
	}
	
	@RequestMapping(value ="/follow-action")
	@ResponseBody
	public boolean followAction(FollowVO folvo) {
		boolean result = fservice.requestFollow(folvo);
		
		return result;
	}
	
	@RequestMapping(value ="/followerList")
	@ResponseBody
	public List<FollowMemberProfileVO> followerList(String id) {
		
		List<FollowMemberProfileVO> follist = fservice.getFollower(id);
		
		return follist;
	}
	
	@RequestMapping(value ="/followList")
	@ResponseBody
	public List<FollowMemberProfileVO> followList(String id) {
		
		List<FollowMemberProfileVO> follist2 = fservice.getFollow(id);
		
		return follist2;
	}
	
	//게시글 작성 프로필이미지 불러오기
	
	@RequestMapping("/writeUserInfo")
	@ResponseBody
	public ProfileImgVO writeUserInfo(HttpSession session, Model model) {
		
		System.out.println("writeUserInfo");
		String session_id = (String)session.getAttribute("session_id");
		
		ProfileImgVO pfvo = new ProfileImgVO();
		pfvo.setId(session_id);
		
		ProfileImgVO pfvo2 = pfsvc.selectProfileImg(pfvo);
		
		return pfvo2;
				
		
	}
	
	@RequestMapping("/write-action")
	@ResponseBody
	public String writeAction(MultipartHttpServletRequest multiPart,
			HttpSession session, Model model, HttpServletRequest req) {
		
		List<MultipartFile> fileList =  multiPart.getFiles("uploadfile");
		
		String content = multiPart.getParameter("content");
		
		
		PostVO pvo = new PostVO();
		
		pvo.setContent(content);
		
		boolean result = pservice.writePostImg(pvo, fileList, req);
		
		return "redirect:main";


	}
	

	@RequestMapping("/detail")
	@ResponseBody
	public List<PostImgMemberProfileVO> detail(int post_no, Model model) {
		
		List<PostImgMemberProfileVO> pivo = pservice.getPost(post_no);
		model.addAttribute("pivo", pivo);
		
		return pivo;
	}
	
//빈하트인지 꽉찬하트인지
	@ResponseBody
	  @RequestMapping(value="/like-state")
	public int likeState(LikesVO lvo){
		
		int result = lservice.getLike(lvo);
		
		return result;
	}
	
//좋아요 추가
	@ResponseBody
	  @RequestMapping(value="/like-action")
	  public boolean likeAction(LikesVO lvo){
	   
		boolean result = lservice.checkLike(lvo);
		
		return result;
		
	  }

//좋아요 삭제
	@ResponseBody
	  @RequestMapping(value="delete-like")
	  public int deleteLike(LikesVO lvo, HttpSession session) {
		
		int result = lservice.uncheckLike(lvo);
		
		return result;
	}
	
	
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
	
	
	//사용자가 입력한 단어의 연관 제시어 검색하여 리스트 반환
	
	public List<String> search(String userKeyword) {
			
			MemberVO mvo = new MemberVO();
			String[] keywords = msvc.selectSearchMember(mvo);
			
		
				if(userKeyword==null||userKeyword.equals("")){
					   return null;
					   //return Collections.EMPTY_LIST; 내장변수
				}
					  //userKeyword = userKeyword.toUpperCase();//대문자검사
					  List<String> lists = new ArrayList<String>();
					  for(int i=0;i<keywords.length;i++){
					   if(keywords[i].startsWith(userKeyword)){
					    lists.add(keywords[i]);
					   }
					   
					  					  
					  }
					  		return lists;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/search")
	public String search1(HttpServletRequest request){
		
			String userKeyword = request.getParameter("userKeyword");
			
			List<String> keywordList = search(userKeyword);
			
			String result="";
			for(String s : keywordList) {
				result = result + "," + s ;
			}
			
			return result;
		
	
	}
	
		
		 		
				 

	
}
