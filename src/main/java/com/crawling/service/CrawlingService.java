package com.crawling.service;

import com.crawling.domain.CompanyDTO;
import com.crawling.domain.FranchiseeStatusDTO;
import com.crawling.domain.LocalSalesDTO;

public interface CrawlingService {
	
	
	
	public void insertLocalSales(LocalSalesDTO salesDTO);
	
	public void insertFranchiseeStatus(FranchiseeStatusDTO statusDTO);
	
	public void insert(CompanyDTO dto);
	
	
}
