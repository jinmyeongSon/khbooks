package board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;
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
		int commentRecord = service.replyCountProcess();
		System.out.println("totalRecord : " + totalRecord);
		
		
		if(totalRecord >= 1) {
			if(pdto.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pdto.getCurrentPage();
			} 
			pdto = new PageDTO(currentPage, totalRecord);
		
			mav.addObject("pdto", pdto);
			mav.addObject("commentRecord", commentRecord);
			mav.addObject("aList", service.listProcess(pdto));
		}
		mav.setViewName("boardList");
		
		return mav;
	}//end list()
	
	
	@RequestMapping("/boardView.kh")
	public ModelAndView view(int currentPage, int bonum, ReplyDTO rdto) {
		ModelAndView mav = new ModelAndView();
		int commentRecord = service.replyCountProcess();
		System.out.println("commentRecord : " + commentRecord);
		
		mav.addObject("bdto", service.contentProcess(bonum)); //BoardDTO
		mav.addObject("currentPage", currentPage);
		mav.addObject("commentRecord", commentRecord);
		mav.addObject("ReplyDTO", service.replyListProcess(rdto)); //댓글 리스트 ReplyDTO
		
		mav.setViewName("boardView");
		
		return mav;
	}
	
	@RequestMapping("/commentInsert.kh")
	public @ResponseBody ModelAndView commentInsert(ReplyDTO rdto) {
		ModelAndView mav = new ModelAndView();
		System.out.println("commentInsert");
		System.out.println(rdto.getId());
		service.replyInsertProcess(rdto);
		mav.addObject("ReplyDTO", service.replyListProcess(rdto));
		System.out.println(rdto.getBctext());
		System.out.println("commentInsert");
		return mav;
	}
	
	
}//end class
