package com.crawling.persistence;

import com.crawling.domain.CompanyDTO;
import com.crawling.domain.FranchiseeStatusDTO;
import com.crawling.domain.LocalSalesDTO;
import com.projectJ.domain.StarInfoDTO;

public interface CrawlingMapper {

	public void insert(CompanyDTO dto);
	
	
	public void insertLocalSales(LocalSalesDTO salesDTO);
	
	public void insertFranchiseeStatus(FranchiseeStatusDTO statusDTO);
	
	public void inserStarInfo(StarInfoDTO starDTO);
	
	// 테스트 테이블 인서트 4개
	public void insertTest(CompanyDTO dto);
	public void insertLocalSalesTest(LocalSalesDTO salesDTO);
	public void insertFranchiseeStatusTest(FranchiseeStatusDTO statusDTO);
	public void inserStarInfoTest(StarInfoDTO starDTO);
	
	
	
	
	// 크롤링 할때 4개에 들어가는 테이블 -> 상호명 탭/줄바꿈/띄여쓰기 삭제
	public void deleteTapCompanyInfo(); // 탭 삭제
	public void deleteTapLocalSales(); // 탭 삭제
	public void deleteTapFranchiseeStatus(); // 탭 삭제
	public void deleteTapStarinfo(); // 탭 삭제
	
	public void deleteEnterCompanyInfo();	// 줄바꿈 삭제
	public void deleteEnterTapLocalSales();	// 줄바꿈 삭제
	public void deleteEnterFranchiseeStatus();	// 줄바꿈 삭제
	public void deleteEnterStarinfo();	// 줄바꿈 삭제
	
	public void deleteSpaceCompanyInfo();	// 띄어쓰기 삭제
	public void deleteSpaceTapLocalSales();	// 띄어쓰기 삭제
	public void deleteSpaceFranchiseeStatus();	// 띄어쓰기 삭제
	public void deleteSpaceStarinfo();	// 띄어쓰기 삭제
	
	
}
