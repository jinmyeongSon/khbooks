package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.BookPageDTO;
import service.BookService;
import twitter4j.*;
//http://localhost:8090/khbook/bookMain.kh


@Controller
public class BookListController {
	BookService service;
	
	public void setService(BookService service) {
		this.service = service;
	}
	
	
	
	@RequestMapping(value="/bookMain.kh", method=RequestMethod.GET)
	public ModelAndView bookMain(BookPageDTO pdto) {
		ModelAndView mav = new ModelAndView();
		BookPageDTO dto = null;
		int totalCount = 0;
		int genreCount = 0;
		int sortKey = 1;
		int currentPage = 1;
		
		if(pdto.getCurrentPage() != 0) {
			currentPage = pdto.getCurrentPage();
		}
		
		if(pdto.getSortkey() != 0) {
			sortKey = pdto.getSortkey();
		}
		
		if(pdto.getSortgenre() != 0) {
			genreCount = service.getBookGenreCountProcess(pdto.getSortgenre());
			dto = new BookPageDTO(currentPage, genreCount, pdto.getSortgenre(), sortKey, "", 9);
		} else {
			totalCount = service.getBookCountProcess();
			dto = new BookPageDTO(currentPage, totalCount, 0, sortKey, "", 9);
		}
		
	    try {
	        Twitter twitter = TwitterFactory.getSingleton();
	        Paging page = new Paging (1, 5);
	        List<Status> tweet = twitter.getUserTimeline(page);
			mav.addObject("tweet", tweet);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		mav.addObject("bList", service.bookListProcess(dto));
		mav.addObject("gList", service.genreListProcess());
		mav.addObject("pdto", dto);
		mav.setViewName("bookMain");
		return mav;
	}
	
	@RequestMapping(value="/bookDetail.kh", method=RequestMethod.GET)
	public ModelAndView bookDetail(int bno) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("book", service.bookDetailProcess(bno));
		mav.addObject("genre", service.getBookGenreProcess(bno));
		mav.addObject("serial", service.getSerialListProcess(bno));
		mav.setViewName("bookDetail");
		return mav;
	}
	
	@RequestMapping(value="/bookSearch.kh")
	public ModelAndView bookSearch(BookPageDTO pdto) {
		ModelAndView mav = new ModelAndView();
		BookPageDTO dto = null;
		int totalCount = 0;
		int genreCount = 0;
		int sortKey = 1;
		int currentPage = 1;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(pdto.getCurrentPage() != 0) {
			currentPage = pdto.getCurrentPage();
		}
		
		if(pdto.getSortkey() != 0) {
			sortKey = pdto.getSortkey();
		}
		
		if(pdto.getSortgenre() != 0) {
			map.put("sortgenre", pdto.getSortgenre());
			map.put("searchWord", pdto.getSearchWord());
			genreCount = service.getBookSearchCountProcess(map);
			dto = new BookPageDTO(currentPage, genreCount, pdto.getSortgenre(), sortKey, pdto.getSearchWord(), 8);
		} else {
			map.put("sortgenre", 0);
			map.put("searchWord", pdto.getSearchWord());
			totalCount = service.getBookSearchCountProcess(map);
			dto = new BookPageDTO(currentPage, totalCount, 0, sortKey, pdto.getSearchWord(), 8);
		}
		
		mav.addObject("bList", service.bookSearchProcess(dto));
		mav.addObject("pdto", dto);
		mav.setViewName("bookSearch");
		return mav;
	}

}
