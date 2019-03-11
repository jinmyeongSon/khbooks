package board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		List<BoardDTO> aList = service.listProcess(pdto);
		int totalRecord = service.countProcess();
		System.out.println("totalRecord : " + totalRecord);
		
		for(int i=totalRecord; i>0; i--) {
			aList.get(totalRecord-i).setReplyCount(service.replyCountProcess(i));
			System.out.println(service.replyCountProcess(i) + "    " + i);
		}
		
		if(totalRecord >= 1) {
			if(pdto.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pdto.getCurrentPage();
			} 
			pdto = new PageDTO(currentPage, totalRecord);
			System.out.println("현재 페이지 : " + currentPage);
			mav.addObject("pdto", pdto);
			mav.addObject("aList", aList);	
		}
		mav.setViewName("boardList");
		
		return mav;
	}//end list()
	
	
	@RequestMapping("/boardView.kh")
	public ModelAndView view(int currentPage, int bonum, ReplyDTO rdto) {
		ModelAndView mav = new ModelAndView();
		int commentRecord = service.replyCountProcess(bonum);
		System.out.println("commentRecord : " + commentRecord);
		
		mav.addObject("bdto", service.contentProcess(bonum)); //BoardDTO
		mav.addObject("currentPage", currentPage);
		mav.addObject("commentRecord", commentRecord);
		mav.addObject("ReplyDTO", service.replyListProcess(rdto)); //댓글 리스트 ReplyDTO
		
		mav.setViewName("boardView");
		
		return mav;
	}
	
	@RequestMapping("/commentInsert.kh")
	public @ResponseBody List<ReplyDTO> commentInsert(ReplyDTO rdto) {
		service.replyInsertProcess(rdto);
		return service.replyListProcess(rdto);
	}
	
	@RequestMapping(value="/commentUpdate.kh", method=RequestMethod.GET)
	public @ResponseBody List<ReplyDTO> commentUpdate(ReplyDTO rdto) {
		return service.replyUpdateProcess(rdto);
	}
	
	@RequestMapping(value="/commentDelete.kh", method=RequestMethod.GET)
	public @ResponseBody List<ReplyDTO> commentDelete(ReplyDTO rdto) {
		return service.replyDeleteProcess(rdto);
	}
	
	
	
}//end class
