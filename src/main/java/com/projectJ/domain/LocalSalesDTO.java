package com.projectJ.domain;

import lombok.Data;

@Data
public class LocalSalesDTO {
	
	private String l_year; 		// 년도
	private String l_comName;	// 상호명
	private String l_areaName;	// 지역명
	private int l_franchiseeEa; // 가맹점수
	private int l_avgSales;		// 평균매출
	private int l_areaAvgSales;	// 면적당 평균매출
	private String l_type;		// 회사분류
	
}
