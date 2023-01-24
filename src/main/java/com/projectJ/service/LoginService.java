package com.projectJ.service;

import com.projectJ.domain.MemberInfoDTO;

public interface LoginService {
	
	public int insertUserData(MemberInfoDTO userDTO); // 회원가입기능
	
	public int idPwChk(MemberInfoDTO dto);

	public int getIdx(MemberInfoDTO dto);
	
	public int updateRtokenAndfailCnt(MemberInfoDTO dto);
	
}
