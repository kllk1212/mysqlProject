package com.projectJ.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.PagingVO;
import com.projectJ.domain.SciptUtils;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.domain.StarUserDTO;
import com.projectJ.service.FranchiseService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/franchise/*")
@Log4j
public class FranchiseController {
	
	@Autowired
	private FranchiseService service;
	
	@GetMapping("reviewMain")
	public void reviewMain() {
		log.info("reviewMain get방식 진입");
	}
	@GetMapping("reviewSearch")//@RequestParam("comName") String
	public void reviewSearchGet(PagingVO vo,@RequestParam("comName") String comName,Model model
			, @RequestParam(value = "nowPage" ,required = false)String nowPage
			,@RequestParam(value = "cntPerPage" ,required = false)String cntPerPage) throws Exception{
		log.info("reviewSerach get방식 진입");

		//검색한 결과를 담은 dto 리스트 
		int total = service.countSearch(comName);
		log.info("****************total : " + total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),comName);
		log.info("*****************vo : " + vo);
		model.addAttribute("paging", vo);
		//List<StarInfoDTO> result = service.searchResult(comName);
		List<StarInfoDTO> resultTest = service.searchResultTest(vo);
		//List<ReviewSearchDTO> result2 = service.searchResult2(comName);

		model.addAttribute("comName", comName);

		model.addAttribute("resultList", resultTest);
	

	}
	
	@GetMapping("reviewDetail")
	public void reviewDetailGet(String comName, Model model) {
		log.info("reviewDetail comName : " + comName);
		
		StarInfoDTO starInfoOne = service.starInfoRead(comName);	// 한개의 별점기업정보
		Double starAvg = service.starAvg(comName);	// 별 총점평균 구하기
		int starCount = service.starCount(comName);	// 별점 남긴 인원 수 구하기
		
		model.addAttribute("starInfoOne", starInfoOne);
		model.addAttribute("starAvg", starAvg);
		model.addAttribute("starCount", starCount);
	}
	
	@GetMapping("reviewWrite")
	public void reviewWriteGet(@RequestParam("comName")String comName,Model model) {
		
		StarInfoDTO starInfoOne = service.starInfoRead(comName);	// 한개의 별점기업정보
		Double starAvg = service.starAvg(comName);	// 별 총점평균 구하기
		int starCount = service.starCount(comName);	// 별점 남긴 인원 수 구하기
		
		model.addAttribute("starInfoOne", starInfoOne);
		model.addAttribute("starAvg", starAvg);
		model.addAttribute("starCount", starCount);		
	}
	
	@PostMapping("reviewWritePro")
	public String reviewWriteProPost(StarUserDTO dto,HttpServletResponse response,HttpServletRequest request, RedirectAttributes rttr) throws IOException {
		log.info(dto);
		
		int result = service.starWriteCheck(dto);	//같은기업 같은아이디 글썼는지 중복체크 (별점글쓰기전 체크)
		log.info("writePro result : " + result);
		//String url ="?comName=" + dto.getS_comName();// 전페이지로 돌아가기 위한 url 값 저장하기
		if(result == 1) {
			
			//SciptUtils.alertAndBackPage(response, "이전페이지로 돌아갑니다");
			//한글깨짐 발생
			//SciptUtils.alertAndMovePage(response, "같은 기업엔 한번만 글을 작성할 수 있습니다.","/franchise/reviewDetail?comName="+dto.getS_comName());
			//SciptUtils.alertAndMovePage(response, "같은 기업엔 한번만 글을 작성할 수 있습니다.","/franchise/reviewMain");
			rttr.addFlashAttribute("msg","이미 해당 업체에 리뷰를 작성하셨습니다.");
			return "redirect:/franchise/reviewDetail?comName=" + URLEncoder.encode(dto.getS_comName());
		}else {
			service.insertStarReview(dto);
			
			log.info("***********dto.getS_savePoint() : " + dto.getS_savePoint());
			int point = dto.getS_savePoint(); //유저가 준점수 여깄음!!!
			service.starPointPlus(point,dto.getS_comName());             // dto에 comName이 안담김
			

			//service.starPointPlus();
			//SciptUtils.alertAndMovePage(response, "리뷰작성완료.","/franchise/reviewMain");
			//SciptUtils.alertAndMovePage(response, "리뷰작성완료.","/franchise/reviewDetail?comName="+dto.getS_comName()");
			rttr.addFlashAttribute("msg", "리뷰작성완료.");
			return "redirect:/franchise/reviewDetail?comName=" + URLEncoder.encode(dto.getS_comName());
		}
		
	}
	
	
	// 계산기 페이지
	@RequestMapping(value ="/incomeCalcMain", method = RequestMethod.GET)
	public void incomCalcMainGet() {		
		log.info("incomeCalcMain get방식 진입");
	}

	
	
	@GetMapping("rankMain")
	public void rankMainnGet() {		
		log.info("rankMain get방식 진입");
	}
	
}
