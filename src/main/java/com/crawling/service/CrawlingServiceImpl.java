package com.crawling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crawling.domain.CompanyDTO;
import com.crawling.domain.FranchiseeStatusDTO;
import com.crawling.domain.LocalSalesDTO;
import com.crawling.persistence.CrawlingMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CrawlingServiceImpl implements CrawlingService{

	@Autowired
	private CrawlingMapper mapper;

	@Override
	public void insert(CompanyDTO dto) {
		
		
		
		log.info("********* 크롤링서비스 임플까지옴");
		mapper.insert(dto);
	}

	@Override
	public void insertLocalSales(LocalSalesDTO salesDTO) {
	
		
		mapper.insertLocalSales(salesDTO);
	}

	@Override
	public void insertFranchiseeStatus(FranchiseeStatusDTO statusDTO) {
		
		mapper.insertFranchiseeStatus(statusDTO);
	}
	
	
}
