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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.projectJ.domain.MemberInfoDTO;
import com.projectJ.domain.SciptUtils;
import com.projectJ.service.LoginService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main/*")
@Log4j
public class MainController {
	
	
	@Autowired
	private LoginService loginService;

	
	@GetMapping("main")				// 메인
	public void mainGet() {
		log.info("**********mainGet 진입");
		//123
	}
	
	@GetMapping("mypage")
	@ResponseBody
	public void mypage() {
		
	}
	
	@GetMapping("siteInfo") 		// 사이트 소개
	public void siteInfoGet() {
		log.info("**********siteInfoGet 진입");
		
	}
	
	@GetMapping("login") 			// 로그인창
	public void loginGet() {
		log.info("*********loginGet 진입");
	}


	
	@GetMapping("signup") 			// 회원가입 창
	public void signupGet() {
		log.info("*********signupGet 진입");
	}
	

	
	
	@GetMapping("signupComplete")
	public void signupCompleteGet() {
		log.info("signupComplete ***** 진입");
	}
	
	
	
}
