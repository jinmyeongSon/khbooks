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
	
	@RequestMapping(value="/bookMain", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bList", service.bookListProcess());
		mav.addObject("gList", service.genreListProcess());
		mav.setViewName("bookMain");
		return mav;
	}
	

}
