package com.projectJ.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.projectJ.domain.MemberInfoDTO;
import com.projectJ.domain.SciptUtils;
import com.projectJ.domain.UserInfoDTO;
import com.projectJ.service.LoginService;
import com.projectJ.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main/*")
@Log4j
public class MainController {
	
	@Autowired
	private MainService service;
	
	@Autowired
	private LoginService loginService;

	
	@GetMapping("main")				// 메인
	public void mainGet() {
		log.info("**********mainGet 진입");
		//123
		
	}
	
	@GetMapping("siteInfo") 		// 사이트 소개
	public void siteInfoGet() {
		log.info("**********siteInfoGet 진입");
		
	}
	
	@GetMapping("login") 			// 로그인창
	public void loginGet() {
		log.info("*********loginGet 진입");
	}
	@PostMapping("login")			// 아이디 비번 입력 후 ~~
	public void loginPost(UserInfoDTO dto,HttpServletResponse response,HttpServletRequest request)  throws IOException {
		log.info("***********loginPost 진입 ***************");
		int result = service.idPwCheck(dto); // 1이면 아디비번 맞음 0이면 틀림

		
		if(result == 1) {	// 아이디 비번 맞음
			HttpSession session = request.getSession();
			String user_id = request.getParameter("m_id");
			session.setAttribute("user_id", user_id);
			SciptUtils.alertAndMovePage(response, "로그인 성공","/main/main" );
		}else		// 아이디 비번 틀림
			
			SciptUtils.alertAndMovePage(response, "아이디나 비밀번호를 다시 확인해주세요","/main/login");
	}
	@GetMapping("logout")
	public void logoutGet(HttpServletResponse response,HttpServletRequest request) throws IOException{
		HttpSession session = request.getSession();
		session.invalidate();
		SciptUtils.alertAndMovePage(response, "안전하게 로그아웃 되었습니다 ^^","/main/main");
	}
	
	
	@GetMapping("signup") 			// 회원가입 창
	public void signupGet() {
		log.info("*********signupGet 진입");
	}
	
	@ResponseBody
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public String idCheck(UserInfoDTO dto) {
		int result = service.idCheck(dto);
		log.info("************** 중복이면 1 아니면 0 : "+result);
		String message = null;
		if(result == 1) {
			message="fail";
		}else {
			message="success";
		}
		
		return message;
	}
	
	
	
	
	@PostMapping("signup") 			// 회원가입 정보 입력 후 
	public String signupPost(MemberInfoDTO userDTO) {
		log.info("*********signupPost 진입");
		log.info("회원가입 정보 : " + userDTO);
		loginService.insertUserData(userDTO);
		
		return "redirect:/main/signupComplete";
	}
	
	
	
	
	@GetMapping("signupComplete")
	public void signupCompleteGet() {
		log.info("signupComplete ***** 진입");
	}
	
	
	
}
