package com.projectJ.persistence;

import com.projectJ.domain.UserInfoDTO;

public interface MainMapper {
	
	
	public int idCheck(UserInfoDTO dto);				// 회원 가입할때 ! 아이디 중복체크 중복이면 1리턴 아니면 0리턴
	public void insertUserData(UserInfoDTO userDTO); // 회원가입기능
	
	public int idPwCheck(UserInfoDTO dto);		// 로그인 할때 아이디 비번체크 아이디 비번 둘다 맞으면 1리턴  아니면 0리턴
	
}
