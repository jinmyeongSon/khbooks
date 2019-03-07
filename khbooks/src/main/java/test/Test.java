package test;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


//http://localhost:8090/khbook/index.kh

@Controller
public class Test {
	
	@RequestMapping("index.kh")
	public String index() {
		return "index";
	}
}
