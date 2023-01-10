package com.projectJ.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.projectJ.domain.CompanyDTO;
import com.projectJ.domain.FranchiseeStatusDTO;
import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.domain.StarUserDTO;

public interface DiagnosisMapper {
	
	// ajax 검색용 조건검색 창에서	쓰는 검색기능 
	public List<LocalSalesDTO> searchResultAjaxSales(@Param("type") String type,@Param("areaName") String areaName); //매출높은순
	public List<LocalSalesDTO> searchResultAjaxEa(@Param("type") String type,@Param("areaName") String areaName); //점포 많은 순
	
	
	// 검색 후 결과 페이지에 쏴줄 데이터들!!!!!!!!!!!!!!!!
	//Param 어노테이션은 xml에 해당 데이터를 보내기위한 거라 xml이랑 이름같아야함
	
	public CompanyDTO companyInfoOne(@Param("comName") String comName);
	public LocalSalesDTO localSalesOne(@Param("comName") String comName,@Param("areaName") String areaName);
	public List<FranchiseeStatusDTO> franchiseeStatusOne(@Param("comName") String comName,@Param("areaName") String areaName);
	public int allFchaEA(@Param("type") String type,@Param("areaName") String areaName); 
	public int avgSales(@Param("type") String type,@Param("areaName") String areaName); // 테마(치킨)의 선택지역 평균 매출
	public int avgSalesAll(@Param("type")String type);	// 테마(치킨)의 전국 평균 매출 
	
	/* 별점 정보
	public StarInfoDTO starInfoOne(@Param("comName")String comName);
	public StarUserDTO starUserOne(@Param("comName") String comName);
	*/

	
	
	
}
