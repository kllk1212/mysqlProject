package com.projectJ.domain;

import lombok.Data;

@Data
public class StarInfoDTO {
	
	private String s_comTitle; // 상호명
	private String s_comName;  // 영업표지
	private int s_1point;	// 1점 default 0
	private int s_2point;	// 2점 default 0
	private int s_3point;	// 3점 default 0
	private int s_4point;	// 4점 default 0
	private int s_5point;	// 5점 default 0
	private int readCount;	// 조회수 sysdate
	private double starAvg; // 연습용 평균 구하기
	

}
