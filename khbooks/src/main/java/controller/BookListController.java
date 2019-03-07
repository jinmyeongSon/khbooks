package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//http://localhost:8090/khbook/booklist.kh


@Controller
public class BookListController {
	
	@RequestMapping(value="/booklist", method=RequestMethod.GET)
	public String index() {
		return "booklist";
	}
	

}
