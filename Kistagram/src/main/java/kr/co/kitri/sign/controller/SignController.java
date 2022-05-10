package kr.co.kitri.sign.controller;

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
	public String singIn() {
		System.out.println("/signin");
		return "member/sign-in";
	}
	
	 /**
     * 로그인처리.
     */
	@RequestMapping("/sign-in")
	public String signIn(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model,
			HttpSession session) {
		
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setPw(pw);
		
		boolean flag = msvc.signIn(mvo);
		
		if(flag) {//로그인 성공
			session.setAttribute("session_id", id);
			
		}
		model.addAttribute("flag", flag);
		
		return "member/sign-in-ok";
		
	}
	
}
