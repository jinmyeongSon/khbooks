package controller;

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
	
	public void setService (BoardService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/boardList.kh", method=RequestMethod.GET)
	public ModelAndView list(PageDTO pdto, ReplyDTO rdto) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.countProcess();
		//System.out.println("totalRecord : " + totalRecord);
		
		if(totalRecord >= 1) {
			if(pdto.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pdto.getCurrentPage();
			} 
			pdto = new PageDTO(currentPage, totalRecord);
			
			List<BoardDTO> aList = service.listProcess(pdto); //BoardDTO
			for(int i=aList.size(); i>0; i--) {
				aList.get(aList.size()-i).setReplyCount(service.replyCountProcess(aList.get(aList.size()-i).getBonum()));
			}
			
			mav.addObject("currentPage", currentPage);
			mav.addObject("pdto", pdto);
			mav.addObject("aList", aList);
			mav.addObject("popular", service.popularPost());
			mav.addObject("reply", service.replyRecent());
			
		}
		mav.setViewName("boardList");
		
		return mav;
	}//end list()
	
	@RequestMapping(value="/boardList.kh", method=RequestMethod.POST) //제목 검색 메소드
	public ModelAndView list(PageDTO pv, String bname) {
		ModelAndView mav = new ModelAndView();
		
		if(bname == null) {
			bname = "";
		}
		
		int totalRecord = service.SearchTotalRecord(bname);
		
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			
			pdto = new PageDTO(currentPage, totalRecord);
			List<BoardDTO> aList = service.getSearchList(bname, pdto);
			for(int i=aList.size(); i>0; i--) {
				aList.get(aList.size()-i).setReplyCount(service.replyCountProcess(aList.get(aList.size()-i).getBonum()));
				//System.out.println(service.replyCountProcess(i) + "    " + i);
			}
		
			mav.addObject("currentPage", currentPage);
			mav.addObject("pdto", pdto);
			mav.addObject("aList", aList);
			mav.addObject("popular", service.popularPost());
			mav.addObject("reply", service.replyRecent());
		}
		
		mav.setViewName("boardList");
		
		return mav;
	}
	
	
	@RequestMapping("/boardView.kh")
	public ModelAndView view(int currentPage, int bonum, ReplyDTO rdto) {
		ModelAndView mav = new ModelAndView();
		int commentRecord = service.replyCountProcess(bonum);
		
		mav.addObject("commentRecord", commentRecord);
		mav.addObject("bdto", service.contentProcess(bonum)); //BoardDTO
		mav.addObject("currentPage", currentPage);
		mav.addObject("ReplyDTO", service.replyListProcess(rdto)); //댓글 리스트 ReplyDTO
		mav.addObject("popular", service.popularPost());
		mav.addObject("reply", service.replyRecent());
		mav.setViewName("boardView");
		
		return mav;
	}
	
	@RequestMapping("/boardWrite.kh")
	public ModelAndView boardWrite() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("popular", service.popularPost());
		mav.addObject("reply", service.replyRecent());
		mav.setViewName("boardWrite");
		
		return mav;
	}
	
	@RequestMapping("/boardWritePro.kh")
	public String boardWritePro(BoardDTO dto) {
		service.insertProcess(dto);
		
		return "redirect:/boardList.kh";
	}
	
	@RequestMapping("/boardDelete.kh")
	public @ResponseBody List<BoardDTO> boardDelete(int bonum, PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		
		service.deleteProcess(bonum);
		
		pv = new PageDTO(bonum, service.countProcess());
		if(pv.getTotalPage() < currentPage) {
			mav.addObject("currentPage", pv.getTotalPage());
		} else {
			mav.addObject("currentPage", currentPage);
		}
		
		//mav.setViewName("redirect:/boardList.kh");
		
		return service.listProcess(pv);
	}//end boardDelete()
	
	
	@RequestMapping("/boardUpdate.kh")
	public ModelAndView boardUpdate(int bonum, ReplyDTO rdto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", service.updateSelectProcess(bonum));
		mav.addObject("ReplyDTO", service.replyListProcess(rdto));
		mav.addObject("currentPage", currentPage);
		mav.addObject("popular", service.popularPost());
		mav.addObject("reply", service.replyRecent());
		mav.setViewName("boardUpdateForm");
		return mav;
	}
	
	@RequestMapping("/boardUpdatePro.kh")
	public ModelAndView boardUpdatePro(int currentPage, BoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		service.updateProcess(dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/boardList.kh");
		
		return mav;
	}
	
	@RequestMapping(value="/commentInsert.kh", method=RequestMethod.GET)
	public @ResponseBody List<ReplyDTO> commentInsert(ReplyDTO rdto) {
		return service.replyInsertProcess(rdto);
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
