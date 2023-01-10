package com.projectJ.domain;

import lombok.Data;

@Data
public class ReviewSearchDTO {
	
	// 리뷰 검색에서 가져올 데이터만 모아논 DTO
	
	private String c_comName; 	// 상호명 
	private String c_img;		// 이미지
	private int s_avgStar;		// 별점 평균

}
