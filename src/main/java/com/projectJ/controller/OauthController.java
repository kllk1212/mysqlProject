package com.projectJ.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.projectJ.dao.Encryption;
import com.projectJ.dao.OauthDAO;
import com.projectJ.domain.MemberInfoDTO;
import com.projectJ.service.LoginService;


@Controller
@RequestMapping("/login/oauth2/code")
public class OauthController {

	
	@Autowired
	private LoginService service;
	
	Encryption encryption = new Encryption();
	
	String domain = "localhost";
	//String domain = "jaehoon.co.kr";
	
	
	@GetMapping("/naver")
	public String naverOauth(@RequestParam String code, @RequestParam String state, HttpSession session,Model model,HttpServletResponse response) {
        // RestTemplate 인스턴스 생성
        RestTemplate rt = new RestTemplate();

        HttpHeaders accessTokenHeaders = new HttpHeaders();
        accessTokenHeaders.add("Content-type", "application/x-www-form-urlencoded");

        MultiValueMap<String, String> accessTokenParams = new LinkedMultiValueMap<>();
        accessTokenParams.add("grant_type", "authorization_code");
        accessTokenParams.add("client_id", "xGYVtGy2jTxj9ocjlhyj");
        accessTokenParams.add("client_secret", "SKNKkK_HDT");
        accessTokenParams.add("code" , code);	// 응답으로 받은 코드
        accessTokenParams.add("state" , state); // 응답으로 받은 상태

        HttpEntity<MultiValueMap<String, String>> accessTokenRequest = new HttpEntity<>(accessTokenParams, accessTokenHeaders);

        ResponseEntity<String> accessTokenResponse = rt.exchange(
                "https://nid.naver.com/oauth2.0/token",
                HttpMethod.POST,
                accessTokenRequest,
                String.class
        );
        String naver = accessTokenResponse.getBody();
        System.out.println("param : " + naver);
        String naverTokens[] = naver.split(",");
        
        String naverAccess_token = naverTokens[0].substring(17,naverTokens[0].length()-1);
        System.out.println(naverAccess_token);
        String naverRefresh_token = naverTokens[1].substring(17,naverTokens[1].length()-1);
        System.out.println(naverRefresh_token);
        // header를 생성해서 access token 넣기
        HttpHeaders profileRequestHeader = new HttpHeaders();
        profileRequestHeader.add("Authorization", "Bearer " + naverAccess_token);       
        HttpEntity<HttpHeaders> profileHttpEntity = new HttpEntity<>(profileRequestHeader);
        // profile api로 생성해둔 헤더를 담아서 요청을 보냅니다.
        ResponseEntity<String> profileResponse = rt.exchange(
                "https://openapi.naver.com/v1/nid/me",
                HttpMethod.POST,
                profileHttpEntity,
                String.class
        );
        OauthDAO dao = new OauthDAO();
        String userData = profileResponse.getBody().replaceAll("'", "").replaceAll("\"", "");
        System.out.println("userData : " + userData);
        String data[] = userData.split(",");	
        String id = data[2].substring(13, data[2].length()); // 성공
        String email = data[7].substring(6, data[7].length()); // 성공
        String name = data[10].substring(5, data[10].length()); // 성공
        String korName = dao.uniTokor(name); // 유니코드 -> 한글 변환
        String gender = data[6].substring(7, data[6].length());
        if(gender.equals("M")) {
        	gender = "male";
        }else if(gender.equals("F")) {
        	gender = "female";
        }
        
        System.out.println("************** 아이디 : " + id);
        System.out.println("************** 이메일 : " + email);
        System.out.println("************** 이름 : " + korName);
        System.out.println("************** 성별 : " + gender);
        int result = service.idChk(id);
        if(result == 0) { // 회원가입처리
        	MemberInfoDTO vo = new MemberInfoDTO();
        	vo.setM_id(id);
        	//vo.setM_pw(bcryptPasswordEncoder.encode(id));
        	vo.setM_email(email);
        	//vo.setUserName(korName);
        	vo.setM_gender(gender);
        	model.addAttribute("vo", vo);
        	
        	// 실명
        	model.addAttribute("name", korName);
        	return "/main/naverSignup";
        	
        }else {	// 로그인처리
        	//model.addAttribute("id", id);
        	
    		Cookie cookie = new Cookie("token",encryption.encrypt(id));
    		cookie.setDomain(domain);
    		cookie.setPath("/");
    		// 2일간 저장
    		cookie.setMaxAge(60*60*24*2);
    		cookie.setSecure(true);
    		response.addCookie(cookie);
        	return "/main/main";
        	
        }
    }
	
	@GetMapping("/kakao")
	public String kakaoOauth(@RequestParam String code,Model model,HttpSession session) {
		// 카카오에 POST방식으로 key=value 데이터를 요청함. RestTemplate를 사용하면 요청을 편하게 할 수 있다.
		RestTemplate rt = new RestTemplate();
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", "authorization_code");
			params.add("client_id", "c8b8e5a6dfb657aa30f9fbb8b1b6d5fd");
			params.add("redirect_uri", "http://localhost:8080/login/oauth2/code/kakao");
			params.add("code", code);
			params.add("client_secret", "jhg6x5SdLPCxXqtZqPxvS3DfpybT7ajr");

		// HttpHeader와 HttpBody를 HttpEntity에 담기 (why? rt.exchange에서 HttpEntity객체를 받게 되어있다.)
		HttpEntity<MultiValueMap<String, String>> kakaoRequest = new HttpEntity<>(params, headers);

		// HTTP 요청 - POST방식 - response 응답 받기
		ResponseEntity<String> response = rt.exchange(
		    "https://kauth.kakao.com/oauth/token",
		    HttpMethod.POST,
		    kakaoRequest,
		    String.class
		);		
		String kakao = response.getBody();
		System.out.println("kakao : " + kakao);
		
		String kakaoTokens[] = kakao.split(",");
		String kakaoAccess_token = kakaoTokens[0].substring(17,kakaoTokens[0].length()-1);
		System.out.println("access_token : " + kakaoAccess_token);
		String kakaoRefresh_token = kakaoTokens[2].substring(17,kakaoTokens[2].length()-1);
		System.out.println("kakaoRefresh_token : "  + kakaoRefresh_token);
		// 여기서부터, Access Token을 이용해서 사용자 정보를 응답 받는 코드이다.
		HttpHeaders headers1 = new HttpHeaders();
		headers1.add("Authorization", "Bearer " + kakaoAccess_token);
		headers1.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		HttpEntity<HttpHeaders> kakaoRequest1 = new HttpEntity<>(headers1);
		ResponseEntity<String> profileResponse = rt.exchange(
			"https://kapi.kakao.com/v2/user/me",
			HttpMethod.POST,
			kakaoRequest1,
			String.class
		);		
		String userData = profileResponse.getBody();
		String data[] = userData.split(",");
		String id = data[0].substring(6, data[0].length());
		System.out.println("*********************************id : "+id);
		
		int result = service.idChk(id);
		if(result == 0) {	//회원가입
			MemberInfoDTO vo = new MemberInfoDTO();
			vo.setM_id(id);
			//vo.setM_pw(bcryptPasswordEncoder.encode(id));
			model.addAttribute("vo", vo);
			return "/common/kakaoSignup";
			
		}else {		// 로그인처리
        	model.addAttribute("id", id);
        	return "/common/oauthLogin";
        }
		
	} // 카카오끝

}
