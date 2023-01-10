package com.projectJ.domain;

import java.util.Date;

import lombok.Data;

@Data
public class StarUserDTO {
	
	private String s_comTitle;	// 상호명
	private String s_comName;	// 영업표지
	private String s_id;		// 별점남긴 유저의 아이디
	private int s_savePoint;	// 유저가 준 별점
	private String s_comment;		// 유저가 쓴 리뷰
	private Date s_time;		// 리뷰남긴 시간

}
