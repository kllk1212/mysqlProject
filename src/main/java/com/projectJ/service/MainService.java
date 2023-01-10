package com.projectJ.service;

import com.projectJ.domain.UserInfoDTO;

public interface MainService {
	
	
	public int idCheck(UserInfoDTO dto);				// 회원 가입할때 ! 아이디 중복체크
	public void insertUserData(UserInfoDTO userDTO); // 회원가입기능
	
	public int idPwCheck(UserInfoDTO dto);		// 로그인 할때 아이디 비번체크 


}
