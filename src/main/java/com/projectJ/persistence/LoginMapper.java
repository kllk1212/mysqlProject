package com.projectJ.persistence;

import org.apache.ibatis.annotations.Mapper;

import com.projectJ.domain.MemberInfoDTO;

@Mapper
public interface LoginMapper {

	public int insertUserData(MemberInfoDTO userDTO); // 회원가입기능
	
	public int idChk(MemberInfoDTO dto);  // 아이디 확인
	
	public int idPwChk(MemberInfoDTO dto);  // 아이디 비밀번호 확인
	
	public int getFailCnt(MemberInfoDTO dto);  // 비밀번호 틀린 횟수 확인
	
	public void failCntPlus(MemberInfoDTO dtd); // 로그인 실패 횟수 추가 
	
	public int getIdx(MemberInfoDTO dto); // 유저 고유번호 가져오기
	
	public int updateRtokenAndfailCnt(MemberInfoDTO dto); // 로그인 성공시 알토큰 저장 + fail카운트 초기화
	
	public MemberInfoDTO getOneUserData(String m_refreshToken); // 알토큰주고 회원정보 가져오기
}
