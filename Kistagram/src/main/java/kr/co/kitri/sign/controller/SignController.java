package kr.co.kitri.sign.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.kitri.member.service.MemberSvc;
import kr.co.kitri.member.vo.MemberVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class SignController {

	@Autowired
	private MemberSvc msvc;

	 /**
     * 로그인화면.
     */
	@RequestMapping("/")
	public String redirectSignIn(HttpSession session) {
		String session_id = (String)session.getAttribute("session_id");
		if (session_id == null) {
			return "redirect:/sign-in";
		} else {
			return "redirect:/main";
		}
	}
	
	@RequestMapping(value = "/sign-in", method = RequestMethod.GET)
	public String signInPage(HttpSession session) {
		return "member/sign-in";
		
	}

	 /**
     * 로그인처리.
     */
	@RequestMapping(value = "/sign-in", method = RequestMethod.POST)
	public String signIn(@RequestParam("username") String id, @RequestParam("password") String pw, Model model, HttpSession session) {

		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setPw(pw);

		boolean flag = msvc.signIn(mvo);

		if(flag) {//로그인 성공
			session.setAttribute("session_id", id);
			
		}
		String session_id = (String)session.getAttribute("session_id");
		
		model.addAttribute("flag", flag);
		model.addAttribute("session_id", session_id);
		
		return "member/sign-in-ok";

	}
	
	/**
     * 로그아웃.
     */
	@RequestMapping("/sign-out")
	public String signOut(HttpSession session, Model model) {
		
		System.out.println("/signout");
		
		if(session.getAttribute("session_id")!=null) {
			session.removeAttribute("session_id");
		}
		
		return "redirect:/sign-in";
	}
	
	/**
	 * 회원가입.
	 */
	@RequestMapping("/sign-up") 
	public String signUp() {

		return "member/sign-up";
	}
	
	
	
	
	
	@RequestMapping("/sign-up-ok") 
	public String signUpok(MemberVO mvo, Model model) {
		boolean flag = msvc.signUp(mvo);
		
		if(flag) {
			model.addAttribute("msg","가입에 성공하였습니다.");
		} else {
			model.addAttribute("msg","가입에 실패하였습니다.");
		}
		
		return "member/sign-up-ok";
	}
	
	
	/**
	 * 중복체크.
	 */
	
	
	@RequestMapping("/id-check")
	public void idCheck(String id, HttpServletResponse res) {

		boolean flag = msvc.idCheck(id);
		System.out.println("아이디 존재여부 : "+flag);
		
		try {
			PrintWriter out = res.getWriter();
			out.print(flag);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
}
