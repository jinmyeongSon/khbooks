package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.BookService;

//http://localhost:8090/khbook/bookMain.kh


@Controller
public class BookListController {
	BookService service;
	
	public void setService(BookService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/bookMain.kh", method=RequestMethod.GET)
	public ModelAndView bookMain() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bList", service.bookListProcess());
		mav.addObject("gList", service.genreListProcess());
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
