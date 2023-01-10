package com.projectJ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectJ.domain.CompanyDTO;
import com.projectJ.domain.FranchiseeStatusDTO;
import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.domain.StarUserDTO;
import com.projectJ.persistence.DiagnosisMapper;

@Service
public class DiagnosisServiceImpl implements DiagnosisService{
	
	@Autowired
	private DiagnosisMapper mapper;

	@Override
	public List<LocalSalesDTO> searchResultAjaxSales(String type, String areaName) {
		return mapper.searchResultAjaxSales(type,areaName);
	}

	@Override
	public List<LocalSalesDTO> searchResultAjaxEa(String type, String areaName) {
		return mapper.searchResultAjaxEa(type,areaName);
	}

	@Override
	public CompanyDTO companyInfoOne(String comName) {
		return mapper.companyInfoOne(comName);
	}

	@Override
	public LocalSalesDTO localSalesOne(String comName, String areaName) {
		return mapper.localSalesOne(comName,areaName);
	}

	@Override
	public List<FranchiseeStatusDTO> franchiseeStatusOne(String comName, String areaName) {
		// TODO Auto-generated method stub
		return mapper.franchiseeStatusOne(comName, areaName);
	}

	@Override
	public int allFchaEA(String type, String areaName) {
		// TODO Auto-generated method stub
		return mapper.allFchaEA(type,areaName);
	}

	@Override
	public int avgSales(String type, String areaName) {
		// TODO Auto-generated method stub
		return mapper.avgSales(type, areaName);
	}

	@Override
	public int avgSalesAll(String type) {
		// TODO Auto-generated method stub
		return mapper.avgSalesAll(type);
	}
	

	/* 별점 정보
	@Override
	public StarInfoDTO starInfoOne(String comName) {
		return mapper.starInfoOne(comName);
	}

	@Override
	public StarUserDTO starUserOne(String comName) {
		return mapper.starUserOne(comName);
	}
	*/
	
	
}
