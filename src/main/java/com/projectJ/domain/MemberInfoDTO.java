package com.projectJ.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberInfoDTO {
	
	private int m_idx;
	private String m_id;		// 아이디
	private String m_pw;		// 비밀번호
	private String m_email;		// 이메일
	private int m_phone;		// 연락처
	private int m_ping;			// 광고수신체크
	private int m_status;		// 회원 상태 1활동 0 정지
	private int m_failCnt;		// 로그인 실패 횟수
	private Date m_regDate;		// 회원가입일
	private Date m_fixDate;		// 정보수정일
	private Date m_lastDate;	// 마지막 접속일
	private String m_refreshToken; // 리플레쉬 토큰
}
