package com.projectJ.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.projectJ.domain.CompanyDTO;
import com.projectJ.domain.IncomeCalcDataDTO;
import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.service.DiagnosisService;
import com.projectJ.service.FranchiseService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/search/*")
@Log4j
public class SearchController {

	@Autowired
	private FranchiseService service;

	@Autowired
	private DiagnosisService serviceDia;
	
	@RequestMapping(value = "/searchData",method = RequestMethod.GET, produces = "application/json")
	@ResponseBody // 계산기 상호명검색할때씀!!
	public ResponseEntity<List<StarInfoDTO>> searchData(@RequestParam("comName") String comName) throws Exception{
		
		log.info("************comName  : " + comName); // ajax로 보낸 comName 잘가져옴
		
		List<StarInfoDTO> result = service.searchResultAjax(comName);
		
		
		log.info("리스트 **********"+result);
		
		return new ResponseEntity<List<StarInfoDTO>>(result,HttpStatus.OK);
		
	}
	@RequestMapping(value = "/getResultSales",method = RequestMethod.GET, produces = "application/json")
	@ResponseBody // 계산기 - 회사명 + 지역명 가지고 와서 1평당 총매출 가져온 후 평수랑 곱해서 리턴해주기
	public ResponseEntity<IncomeCalcDataDTO> getResultSales(@RequestParam("comName") String comName,
			@RequestParam("areaName") String areaName,@RequestParam("size")int size) throws Exception{
		log.info("************comName  : " + comName); // ajax로 보낸 comName 잘가져옴
		LocalSalesDTO resultSales = service.getCalcDB(comName, areaName); //companyInfo DB 에서 1평당매출 가져오기!!!!
		// 희망평수 size 희망지역 areaName 검색한프랜차이즈 comName  -> 이건 DB에 넣기위한거임~
		// 원가 payRatio 인건비 workPayMonth  임대료 monthlyRent 관리비 ectPay 판매 수수료 salesFee
		
		int resultSalesSize = resultSales.getL_areaAvgSales() * size /120; // 평수 * 1평당매출 / 12개월
		IncomeCalcDataDTO incomeCalcData = service.getIncomeCalcDB(resultSales.getL_type()); // 타입명(치킨) 주고  원가 인건비 임대료... 등 가져오기
		incomeCalcData.setResultSalesSize(resultSalesSize);
		
		
		//return new ResponseEntity<Integer>(resultSalesSize,HttpStatus.OK);
		return new ResponseEntity<IncomeCalcDataDTO>(incomeCalcData,HttpStatus.OK);
		
	}
	
	
	
	
	
	
	@RequestMapping(value = "/searchDataConstraint",method = RequestMethod.GET, produces = "application/json")
	@ResponseBody // 조건검색 할때씀!!
	public ResponseEntity<List<LocalSalesDTO>> searchDataConstraint(@RequestParam("type") String type,@RequestParam("areaName") String areaName
			,@RequestParam("constraint") String constraint) throws Exception{
		
		log.info("************type  : " + type); 
		log.info("************areaName  : " + areaName); 
		log.info("************constraint 매출 1 , 점포수 2 : " + constraint);
		
		if(constraint.equals("매출높은순")) {
			List<LocalSalesDTO> result = serviceDia.searchResultAjaxSales(type,areaName); // 매출
			return new ResponseEntity<List<LocalSalesDTO>>(result,HttpStatus.OK);
		//log.info("리스트 **********"+result);
		}else {
			List<LocalSalesDTO> result = serviceDia.searchResultAjaxEa(type,areaName); // 점포수
			return new ResponseEntity<List<LocalSalesDTO>>(result,HttpStatus.OK);
			
		}
	}
	
}
