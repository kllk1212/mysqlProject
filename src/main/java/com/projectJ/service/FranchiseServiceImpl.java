package com.projectJ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectJ.domain.IncomeCalcDataDTO;
import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.PagingVO;
import com.projectJ.domain.ReviewSearchDTO;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.domain.StarUserDTO;
import com.projectJ.persistence.FranchiseMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FranchiseServiceImpl implements FranchiseService{
	
	@Autowired
	private FranchiseMapper mapper;
	
	@Override
	public List<StarInfoDTO> searchResult(String comName) {
		return mapper.searchResult(comName);
	}
	@Override
	public int countSearch(String comName) {	// 검색된 결과수 가져오기
		return mapper.countSearch(comName);
	}
	@Override
	public List<StarInfoDTO> searchResultTest(PagingVO vo) {	// 검색결과 전부 리스트에 담아 가져오기
		// TODO Auto-generated method stub
		return mapper.searchResultTest(vo);
	}
	@Override
	public StarInfoDTO starInfoRead(String comName) { // 게시글 하나 정보 가져오기
		// TODO Auto-generated method stub
		return mapper.starInfoRead(comName);
	}
	@Override
	public Double starAvg(String comName) { // 별점 평균 구하기
		
		return mapper.starAvg(comName);
	}
	@Override
	public int starCount(String comName) {
		return mapper.starCount(comName);
	}
	@Override
	public int starWriteCheck(StarUserDTO dto) {
		return mapper.starWriteCheck(dto);
	}
	@Override
	public void insertStarReview(StarUserDTO dto) {
		mapper.insertStarReview(dto);
	}
	@Override
	public void starPointPlus(int point, String comName) {
		
		if(point==1) {mapper.starPointPlus1(point, comName);}
		if(point==2) {mapper.starPointPlus2(point, comName);}
		if(point==3) {mapper.starPointPlus3(point, comName);}
		if(point==4) {mapper.starPointPlus4(point, comName);}
		if(point==5) {mapper.starPointPlus5(point, comName);}
	}
	@Override
	public List<StarInfoDTO> searchResultAjax(String comName) { // 계산기 창에서 쓰는 !!!
		
		//return mapper.searchResultAjax(comName); // 오라클
		return mapper.searchResultAjax("%" + comName+"%"); // mysql
	}
	
	@Override
	public LocalSalesDTO getCalcDB(String comName ,String areaName) { // 계산기 결과 가져오기

		return mapper.getCalcDB(comName,areaName);
	}
	@Override
	public IncomeCalcDataDTO getIncomeCalcDB(String type) {
		
		return mapper.getIncomeCalcDB(type);
	}
	
	

	
}
