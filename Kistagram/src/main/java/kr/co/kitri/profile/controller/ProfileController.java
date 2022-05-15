package kr.co.kitri.profile.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.kitri.member.dao.MemberDAO;
import kr.co.kitri.member.service.MemberSvc;
import kr.co.kitri.member.vo.MemberVO;



@Controller
public class ProfileController {

	@Autowired
	private MemberSvc msvc;

	@Autowired
	private MemberDAO mdao;
	 /**
     * 프로필 수정 화면.
     */

	
	@RequestMapping(value = "/profile" )
	public String profile(Locale locale, HttpSession session, Model model) {
		MemberVO mvo = new MemberVO();
		String session_id = (String)session.getAttribute("session_id");
		mvo.setId(session_id);
		mvo = mdao.selectUser(mvo);
		String member_md = mvo.getId();
		String member_mn = mvo.getName();
		String member_ph = mvo.getPhone();
		String member_itd = mvo.getIntroduce();
		
		model.addAttribute("id", member_md);
		model.addAttribute("name", member_mn);
		model.addAttribute("phone", member_ph);
		model.addAttribute("introduce", member_itd);
	

		return "profile/profile";
	}
	
	
	@RequestMapping(value = "/profile-up")
	public String profileup(MemberVO mvo, HttpSession session, Model model) {
		
		boolean flag = msvc.updateUser(mvo);
		
		if(flag) {
			model.addAttribute("msg","수정완료");
		} 
		

		return "profile/profile-up";
	}
	

}
