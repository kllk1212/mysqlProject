package com.projectJ.domain;

import lombok.Data;

@Data
public class UserInfoDTO {
	
	private String m_id;		// 아이디
	private String m_pw;		// 비밀번호
	private String m_email;		// 이메일
	private int m_num;			// 연락처
	private int m_ping;			// 광고수신체크
	private int m_status;		// 회원 상태 1활동 0 정지

}
