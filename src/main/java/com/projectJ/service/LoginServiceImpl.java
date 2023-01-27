package com.projectJ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectJ.domain.MemberInfoDTO;
import com.projectJ.persistence.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService{
	
	
	@Autowired
	LoginMapper mapper;

	@Override
	public int insertUserData(MemberInfoDTO userDTO) {
		
		return mapper.insertUserData(userDTO);
	}

	@Override
	public int idPwChk(MemberInfoDTO dto) {
		int idChk = mapper.idChk(dto);
		
		int code = 0;
		int idPwChk = 0; // 아이디 비번 둘다 맞으면 1 하나라도 틀리면 0
		int failCnt = 0; // 실패횟수
		

		if(idChk == 1) {
			idPwChk = mapper.idPwChk(dto);
			// 로그인 실패 횟수
			failCnt = mapper.getFailCnt(dto);
			System.out.println("로그인 실패 횟수 : " + failCnt);
		}
		
		if(idChk == 0) {
			// 아이디 틀림 
			code = 400;
			System.out.println("아이디 틀림");
		}else if(idChk == 1){
			if(idPwChk == 1 && failCnt < 5) {
				// 아이디 맞고 비번 맞고 로그인 실패횟수 5회 미만
				code = 200;
				System.out.println("아이디 맞고 비번 맞고 로그인 실패횟수 5회 미만");
			}else if(idPwChk == 1 && failCnt >= 5) {
				// 아이디 맞고 비번 맞고 로그인 실패횟수 5회 이상
				// 로그인 실패 카운트 + 1
				mapper.failCntPlus(dto);
				code = 401;
				System.out.println("아이디 맞고 비번 맞고 로그인 실패횟수 5회 이상");
			}else if(idPwChk == 0 && failCnt < 5) {
				// 아이디 맞고 비밀번호 틀리고 실패횟수 5회 미만
				// 로그인 실패 카운트 + 1
				mapper.failCntPlus(dto);
				code = 400;
				System.out.println("아이디 맞고 비밀번호 틀리고 실패횟수 5회 미만");
			}else if(idPwChk == 0 && failCnt >= 5) {
				// 아이디 맞고 비밀번호 틀리고 실패횟수 5회 이상
				// 로그인 실패 카운트 + 1
				mapper.failCntPlus(dto);
				code = 401;
				System.out.println("아이디 맞고 비밀번호 틀리고 실패횟수 5회 이상");
			}
		}

		return code;
	}

	@Override
	public int getIdx(MemberInfoDTO dto) {
		return mapper.getIdx(dto);
	}

	@Override
	public int updateRtokenAndfailCnt(MemberInfoDTO dto) {
		return mapper.updateRtokenAndfailCnt(dto);
	}

	@Override
	public MemberInfoDTO getOneUserData(String m_refreshToken) {
		return mapper.getOneUserData(m_refreshToken);
	}

	@Override
	public void updateUserData(MemberInfoDTO dto) {
		mapper.updateUserData(dto);
	}
	


}
