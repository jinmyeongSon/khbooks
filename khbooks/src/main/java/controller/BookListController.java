package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.PageDTO;
import service.BookService;

//http://localhost:8090/khbook/bookMain.kh


@Controller
public class BookListController {
	BookService service;
	
	public void setService(BookService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/bookMain.kh", method=RequestMethod.GET)
	public ModelAndView bookMain(PageDTO pdto) {
		ModelAndView mav = new ModelAndView();
		PageDTO dto = null;
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
			dto = new PageDTO(currentPage, genreCount, pdto.getSortgenre(), sortKey, "");
		} else {
			totalCount = service.getBookCountProcess();
			dto = new PageDTO(currentPage, totalCount, sortKey, "");
		}
		
/*		if(pdto.getSearchWord() != null || !pdto.getSearchWord().equals("")) {
			if(pdto.getSortgenre() == 0) {
				dto = new PageDTO(1, totalCount, sortKey, pdto.getSearchWord());
			} else {
				dto = new PageDTO(1, genreCount, pdto.getSortgenre(), sortKey, pdto.getSearchWord());
			}
			
		}*/
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
		mav.setViewName("bookDetail");
		return mav;
	}
	

}
