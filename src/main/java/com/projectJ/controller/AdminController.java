package com.projectJ.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.projectJ.domain.DbTypeDTO;
import com.projectJ.service.AdminService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@Autowired
	private AdminService service;
	
	
	@GetMapping("dbPlus")
	public void dbPlusGet(Model model,DbTypeDTO dbTypeDTO) {
		log.info("************dbPlusGet 진입함***********");
		
		// 무슨 type 들어가있는지 가져오는거 list로 
		List<DbTypeDTO> type = service.getType(dbTypeDTO);
		log.info("*********type : " + type);
		model.addAttribute("typeList", type);
	}
	@GetMapping("dbPlusPro")
	public void dbPlusPost(@RequestParam("type")String type,Model model) {
		log.info("************dbPlusPost 진입함***********");
		model.addAttribute("type", type);
		log.info("admin이 고른 type : " + type);
		service.addDb(type);
		
	}
	
	@GetMapping("dbPlusOne")
	public void dbPlusOne(String url, Model model) {
		
		service.addOne(url);
		
	}
	
	
}
