package com.projectJ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.projectJ.service.MapService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/map/*")
@Log4j
public class MapController {
	
	@Autowired
	private MapService service;
	
	
	@GetMapping("mapSearchMain")
	public void mapSearchMainGet() {
		log.info("mapSearchMain ************** 진입");
	}

}
