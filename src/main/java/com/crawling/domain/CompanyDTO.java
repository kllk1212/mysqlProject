package com.crawling.domain;

import lombok.Data;


@Data
public class CompanyDTO {
	
	private String c_comNo;			// 회사번호
	private String c_comTitle;		// 상호명
	private String c_comName;		// 영업표지
	private String c_type;			// 회사분류
	private int c_storeCount;		// 총 점포수
	private int c_memberFee;		// 가입비
	private int c_eduFee;			// 교육비
	private int c_deposit;			// 보증금
	private int c_etcFee;			// 기타비용
	private int c_totalFee;			// 부담금 총액
	private Long c_tAvgSales;		// 평균 매출액
	private int c_tSquareSales;		// 면적당 평균 매출액
	private String c_comBoss;		// 회사대표
	private String c_comBm;			// 사업자유형
	private String c_comAddr;		// 회사주소
	private String c_comNum;		// 대표번호
	private String c_comImg;		// 회사이미지
	
	

	
	

}
