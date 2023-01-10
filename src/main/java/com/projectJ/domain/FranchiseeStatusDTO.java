package com.projectJ.domain;

import lombok.Data;

@Data
public class FranchiseeStatusDTO {

	

	private String f_areaName;		// 지역이름
	private String f_year;			// 년도
	private String f_comName;		// 상호명
	private int f_totalEa;			// 대리점수 + 직영점수
	private int f_franchiseeEa;		// 대리점수
	private int f_directEa;			// 직영점수
	private String f_type;			// 회사분류


	
}
