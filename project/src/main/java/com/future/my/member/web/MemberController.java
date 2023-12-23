package com.future.my.member.web;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.future.my.member.service.MemberService;
import com.future.my.member.vo.memberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping("/loginView")
	public String loginMember(HttpServletRequest request,Model model) {
		
		String requestUrl = request.getHeader("Referer");
				
		model.addAttribute("fromUrl",requestUrl);
		return "member/loginView";
	}
	

	@RequestMapping("/loginDo")
	public String loginDo(memberVO member, HttpSession session
			   ,boolean remember, String fromUrl, Model model
			   ,HttpServletResponse response) {
		
		System.out.println(member.getUserNm());
		System.out.println("333");
		memberVO login = memberService.loginMember(member);
		boolean match = passwordEncoder.matches(member.getUserPw(), login.getUserPw());
		if(login == null || !match) {
			return "redirect:/loginView?msg=N";
		}
		session.setAttribute("login", login);
		if(remember) {
			//true 쿠기 생성
			Cookie cookie = new Cookie("rememberId", member.getUserId());
			response.addCookie(cookie); //응답하는 객체에 담아서 전달
		}else {
			// 쿠키 삭제
			Cookie cookie = new Cookie("rememberId","");
			cookie.setMaxAge(0);
			response.addCookie(cookie); //응답하는 객체에 담아서 전달
		}
		System.out.println(login);
		List<memberVO> LobbyList = memberService.getMemberList(login);
		model.addAttribute("LobbyList", LobbyList);
		
		return "member/lobbyView";
	}
	
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request) {
		String id = request.getParameter("userId");
		String pw = passwordEncoder.encode(request.getParameter("userPw"));
		String nm = request.getParameter("userNm");
		String tier = request.getParameter("userTier");
		String wins = request.getParameter("userWins");
		String losses = request.getParameter("userLosses");
		System.out.println(nm);
		memberVO member = new memberVO(id,pw,nm,tier,wins,losses);
		System.out.println(member);
		System.out.println("dasdsad");
		try {
			memberService.registMember(member);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/loginView";
	}
	
	
	
}
