package com.projectJ.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.projectJ.dao.Encryption;
import com.projectJ.dao.Jwt;
import com.projectJ.dao.JwtFix;
import com.projectJ.domain.LoginDTO;
import com.projectJ.domain.MemberInfoDTO;
import com.projectJ.service.LoginService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/Member/*")
@Log4j
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	Encryption dao = new Encryption();

	@PostMapping(value = "/actLogin",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_XML_VALUE})
	public LoginDTO login(@RequestParam String token,Model model) {
		System.out.println("로그인 컨트롤러 진입");
		System.out.println("넘어온 데이터 : " + token);
		String decrypt = dao.decrypt(token);
		System.out.println("decrypt : " + decrypt);
		JSONObject json = new JSONObject(decrypt);
		String m_id = json.getString("id");
		String m_pw = json.getString("pw");		
		MemberInfoDTO dto = new MemberInfoDTO();
		dto.setM_id(m_id);
		dto.setM_pw(m_pw);		
		int code = loginService.idPwChk(dto);
		System.out.println("code : " + code);
		if(code == 200) { // 아이디 비밀번호 맞을시 엑세스토큰 리플레시 토큰 발행
			Jwt jwt = new Jwt();
			int m_idx = loginService.getIdx(dto);
			
			String accessToken = jwt.createAccessToken(m_idx);
			String refreshToken = jwt.createRefreshToken(m_idx);
			
			String text = "{"+"\"" + "accessToken" + "\":\"" + accessToken +"\"" 
			+ "," + "\"" + "refreshToken" + "\":\"" + refreshToken + "\"" + "}";

			// 엑세스 토큰 안에 리플레쉬 토큰도 같이 있음
			//String text = "{"+"\"" + "accessToken" + "\":\"" + jwt.createAccessToken(m_idx,jwt.createRefreshToken()) +"\"" + "}";	
			System.out.println("text : " + text);
			String tokens = dao.encrypt(text);
			// 리플레시 토큰 디비에 저장하기 
			// 로그인 성공시 로그인실패카운트 초기화 0
			dto.setM_idx(m_idx);// 유저 고유번호
			dto.setM_refreshToken(refreshToken); // 리플래쉬 토큰
			int updateRtokenAndfailCnt = loginService.updateRtokenAndfailCnt(dto);
			return new LoginDTO(tokens,code);
			
		}else {
			// 로그인 실패시 보낼 코드
			String tokens = "";
			return new LoginDTO("로그인실패",code);
		}		
	};
	
	@PostMapping("/signup") 			// 회원가입 정보 입력 후 
	public ModelAndView signupPost(@RequestParam String token) {
		ModelAndView mav = new ModelAndView("jsonView");
		log.info("*********signupPost 진입");
		log.info("암호화된 넘어온 데이터  : " + token);
		String decrypt = dao.decrypt(token);
		System.out.println("decrypt : " + decrypt);
		
		JSONObject json = new JSONObject(decrypt);
		
		String m_id = json.getString("id");
		String m_pw = json.getString("pw");
		String m_email = json.getString("email");
		String m_phone = json.getString("phone");
		String m_ping = json.getString("ping");
		MemberInfoDTO dto = new MemberInfoDTO();
		dto.setM_id(m_id);
		dto.setM_pw(m_pw);
		dto.setM_email(m_email);
		dto.setM_phone(Integer.parseInt(m_phone));
		dto.setM_ping(Integer.parseInt(m_ping));
		loginService.insertUserData(dto);
		
		mav.setViewName("redirect:/main/signupComplete");
		
		
		return mav;
	}
	
	@PostMapping("mypage")
	public ModelAndView mypageGet(@RequestParam String token) {
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println("token : " + token);
		String decrypt = dao.decrypt(token);
		System.out.println("decrypt : " + decrypt);
		JSONObject json = new JSONObject(decrypt);
		System.out.println("json : " + json);
		String m_refreshToken = json.getString("refreshToken");
		System.out.println("m_refreshToken : " + m_refreshToken);
		
		
		return mav;
	}
	
}
