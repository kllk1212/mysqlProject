package com.crawling.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crawling.domain.CompanyDTO;
import com.crawling.domain.FranchiseeStatusDTO;
import com.crawling.domain.LocalSalesDTO;
import com.crawling.service.CrawlingService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class CrawlingController {
	
	@Autowired
	private CrawlingService service;
	
	private static final String WEB_DRIVER_ID = "webdriver.chrome.driver"; 
	private static final String WEB_DRIVER_PATH = "C:\\chromedriver\\chromedriver.exe";	
	
	@GetMapping("crawling")
	public void crawlingGet() {
		
		
	}
	
	@RequestMapping("crawlingPro")
	public String crawlingPost(String url,Model model,HttpServletResponse response) throws Exception{

		
		
		return "redirect:/test/crawling";
	}
	

}
