package blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.PageDTO;
import service.BoardService;


//http://localhost:8090/khbook/boardList.kh

@Controller
public class BoardController {
	private BoardService service;
	private int currentPage;
	private PageDTO pdto;
	
	public BoardController() {
		
	}
	
	public void setService(BoardService service) {
		this.service = service;
	}
	
	@RequestMapping("/boardList.kh")
	public ModelAndView list(PageDTO pdto) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.countProcess();
		System.out.println("totalRecord : " + totalRecord);
		
		if(totalRecord >= 1) {
			if(pdto.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pdto.getCurrentPage();
			} 
			pdto = new PageDTO(currentPage, totalRecord);
		
			mav.addObject("pdto", pdto);
			mav.addObject("aList", service.listProcess(pdto));
		}
		mav.setViewName("boardList");
		
		return mav;
	}//end list()
	
	
	@RequestMapping("/boardView.kh")
	public ModelAndView view(int currentPage, int bonum) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bdto", service.contentProcess(bonum));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("boardView");
		
		return mav;
	}
	
}//end class
