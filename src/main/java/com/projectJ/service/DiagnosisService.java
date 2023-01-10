package com.projectJ.service;

import java.util.List;

import com.projectJ.domain.CompanyDTO;
import com.projectJ.domain.FranchiseeStatusDTO;
import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.domain.StarUserDTO;

public interface DiagnosisService {
	
	
	// 조건검색창
	public List<LocalSalesDTO> searchResultAjaxSales(String type,String areaName); // 매출높은순으로 타고들어올경우
	public List<LocalSalesDTO> searchResultAjaxEa(String type,String areaName); // 점포 많은순으로 타고들어올경우
	
	
	// 검색 후 결과 페이지에 쏴줄 데이터들!!!!!!!!!!!!!!!!
	public CompanyDTO companyInfoOne(String comName);
	public LocalSalesDTO localSalesOne(String comName,String areaName);
	public List<FranchiseeStatusDTO> franchiseeStatusOne(String comName,String areaName);
	public int allFchaEA(String type,String areaName);
	public int avgSales(String type,String areaName); 	// 테마(치킨)의 선택지역 평균 매출
	public int avgSalesAll(String type);	// 테마(치킨)의 전국 평균 매출 

	
	
	/* 별점 정보
	public StarInfoDTO starInfoOne(String comName);
	public StarUserDTO starUserOne(String comName);
	*/

	
	
}
