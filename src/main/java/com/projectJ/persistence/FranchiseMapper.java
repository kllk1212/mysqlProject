package com.projectJ.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.projectJ.domain.IncomeCalcDataDTO;
import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.PagingVO;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.domain.StarUserDTO;

public interface FranchiseMapper {


	public List<StarInfoDTO> searchResult(String comName); 
	public List<StarInfoDTO> searchResultTest(PagingVO vo); // 검색결과 리스트에 담기 대소문자 기능
	
	
	public int countSearch(String comName);	// 검색결과의 수 가져오기
	
	public StarInfoDTO starInfoRead(String comName); // 검색결과 전부가져와 리스트에담기

	public Double starAvg(String comName); // 별점 평균 구하기
	public int starCount(String comName);	// 별점 준 인원수 구하기
	
	public int starWriteCheck(StarUserDTO dto);	// 같은기업 같은아이디 글썼는지 중복체크 (별점글쓰기전 체크)
	public void insertStarReview(StarUserDTO dto); // 별점리뷰 글작성
	public void starPointPlus1(@Param("point") int point, @Param("comName") String comName);
	public void starPointPlus2(int point,String comName);
	public void starPointPlus3(int point,String comName);
	public void starPointPlus4(int point,String comName);
	public void starPointPlus5(int point,String comName);
	
	public List<StarInfoDTO> searchResultAjax(String comName);  // ajax용
	
	public LocalSalesDTO getCalcDB(@Param("comName") String comName,@Param("areaName") String areaName); // 계산기 결과 가져오기
	
	public IncomeCalcDataDTO getIncomeCalcDB(String type);	// 업종(치킨) 주면 계산기데이터 DB에서 원가율 같은거 가져오기
	
}
