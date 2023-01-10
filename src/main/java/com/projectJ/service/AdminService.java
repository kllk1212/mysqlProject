package com.projectJ.service;

import java.util.List;

import com.projectJ.domain.DbTypeDTO;
import com.projectJ.domain.StarInfoDTO;

public interface AdminService {

	
	public void addDb(String type); // 크롤링해서 DB에 넣기!!
	
	public void addOne(String url); // url 받고 하나 추가
	
	public int check(String comName);
	
	public List<DbTypeDTO> getType(DbTypeDTO dbTypeDTO); // db에서 타입만 가져오기

	

	
	
}
