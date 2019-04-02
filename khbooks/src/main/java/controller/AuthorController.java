package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.AuthorService;

//http://localhost:8090/khbook/author.kh

@Controller
public class AuthorController {
	private AuthorService service;
	
	public AuthorController(){
		
	}
	public void setService(AuthorService service) {
		this.service = service;
	}
	@RequestMapping("/author.kh")
	public ModelAndView mak(int auno) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList",service.authorProcess(auno));
		mav.addObject("bList",service.bookListProcess(auno));
		mav.setViewName("author");
		return mav;
	}
}
