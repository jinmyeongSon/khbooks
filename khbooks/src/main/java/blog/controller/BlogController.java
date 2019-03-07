package blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.BoardService;


//http://localhost:8090/khbook/blog1.kh

@Controller
public class BlogController {
	private BoardService service;
	

	@RequestMapping(value="/blog1.kh")
	public String list(){
		return "blog-style1";
	}
	
}
