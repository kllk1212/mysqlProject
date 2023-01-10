package com.projectJ.persistence;

import java.util.List;

import com.projectJ.domain.CompanyDTO;
import com.projectJ.domain.DbTypeDTO;
import com.projectJ.domain.FranchiseeStatusDTO;
import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.StarInfoDTO;

public interface AdminMapper {

	
	public void insertCompanyInfo(CompanyDTO dto);
	
	public void insertLocalSales(LocalSalesDTO salesDTO);
	
	public void insertFranchiseeStatus(FranchiseeStatusDTO statusDTO);
	
	public int check(String comName);
	
	public void inserStarInfo(StarInfoDTO starDTO); // 별점테이블 상호명 넣기 (디폴트 000000)
	
	
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
	
	
	public List<DbTypeDTO> getType(DbTypeDTO dbTypeDTO);
	
	
}
