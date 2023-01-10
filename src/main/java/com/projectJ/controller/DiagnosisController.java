package com.projectJ.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.projectJ.domain.CompanyDTO;
import com.projectJ.domain.FranchiseeStatusDTO;
import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.domain.StarUserDTO;
import com.projectJ.service.DiagnosisService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/diagnosis/*")
@Log4j
public class DiagnosisController {
	
	@Autowired
	private DiagnosisService service;
	
	@GetMapping("diagnosisMain")
	public void diagnosisMainGet() {
		log.info("diagnosisMainGet 진입 ***********");
	}
	@GetMapping("diagnosisMainTest")
	public void diagnosisMainTest() {
		log.info("diagnosisMainGet 진입 ***********");
	}
	@GetMapping("diagnosisResult")
	public void diagnosisResultGet(@RequestParam("comName") String comName,@RequestParam("areaName") String areaName,Model model) {
		log.info("diagnosisResultGet 진입 ***********");
		log.info("**********************************comName : "+comName);
		log.info("**********************************areaName : "+areaName);
		model.addAttribute("areaName", areaName);
		model.addAttribute("comName", comName);
		CompanyDTO cDTO = service.companyInfoOne(comName);
		LocalSalesDTO lDTO = service.localSalesOne(comName,areaName);
		List<FranchiseeStatusDTO> fDTO = service.franchiseeStatusOne(comName,areaName);

		// 동종업계 해당지역의 총 매장수
		int allFchaEA = service.allFchaEA(cDTO.getC_type(),lDTO.getL_areaName()); 
		model.addAttribute("allFchaEA", allFchaEA);
		// 동종업계 해당지역의 평균 매출 !
		int avgSales = service.avgSales(cDTO.getC_type(),lDTO.getL_areaName());
		model.addAttribute("avgSales", avgSales);
		// 동종업계 전국기준 평균 매출 !
		int avgSalesAll = service.avgSalesAll(cDTO.getC_type());
		model.addAttribute("avgSalesAll", avgSalesAll);
		/* 별점 
		StarInfoDTO siDTO = service.starInfoOne(comName);
		StarUserDTO suDTO = service.starUserOne(comName);
		*/
		model.addAttribute("cDTO",cDTO);
		model.addAttribute("lDTO",lDTO);
		model.addAttribute("fDTO",fDTO);
		/* 별점 
		model.addAttribute("siDTO",siDTO);
		model.addAttribute("suDTO",suDTO);
		*/

	}
	@GetMapping("diagnosisResultTest")
	public void diagnosisResultTest(@RequestParam("comName") String comName,@RequestParam("areaName") String areaName,Model model) {
		log.info("diagnosisResultGet 진입 ***********");
		log.info("**********************************comName : "+comName);
		log.info("**********************************areaName : "+areaName);
		model.addAttribute("areaName", areaName);
		model.addAttribute("comName", comName);
		CompanyDTO cDTO = service.companyInfoOne(comName);
		LocalSalesDTO lDTO = service.localSalesOne(comName,areaName);
		List<FranchiseeStatusDTO> fDTO = service.franchiseeStatusOne(comName,areaName);
		
		// 동종업계 해당지역의 총 매장수
		int allFchaEA = service.allFchaEA(cDTO.getC_type(),lDTO.getL_areaName()); 
		model.addAttribute("allFchaEA", allFchaEA);
		// 동종업계 해당지역의 평균 매출 !
		int avgSales = service.avgSales(cDTO.getC_type(),lDTO.getL_areaName());
		model.addAttribute("avgSales", avgSales);
		// 동종업계 전국기준 평균 매출 !
		int avgSalesAll = service.avgSalesAll(cDTO.getC_type());
		model.addAttribute("avgSalesAll", avgSalesAll);
		/* 별점 
		StarInfoDTO siDTO = service.starInfoOne(comName);
		StarUserDTO suDTO = service.starUserOne(comName);
		 */
		model.addAttribute("cDTO",cDTO);
		model.addAttribute("lDTO",lDTO);
		model.addAttribute("fDTO",fDTO);
		/* 별점 
		model.addAttribute("siDTO",siDTO);
		model.addAttribute("suDTO",suDTO);
		 */
		
	}
	@GetMapping("searchPro")
	public void testGet() {
		
		
		
	}
	
	

}
