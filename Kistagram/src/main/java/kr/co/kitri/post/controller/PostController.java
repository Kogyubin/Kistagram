package kr.co.kitri.post.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class PostController {
	
	@RequestMapping("write-action")
	public String writeAction(MultipartHttpServletRequest multiPart,
			HttpSession session, Model model) {
		
		
		return "index";
	}
	
}
