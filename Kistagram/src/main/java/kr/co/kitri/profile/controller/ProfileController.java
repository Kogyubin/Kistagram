package kr.co.kitri.profile.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.kitri.member.service.MemberSvc;
import kr.co.kitri.member.vo.MemberVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class ProfileController {

	@Autowired
	private MemberSvc msvc;

	 /**
     * 프로필 수정 화면.
     */
	@RequestMapping("/profile")
	public String profile() {

		return "profile/profile";
	}


}
