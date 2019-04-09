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


	@RequestMapping("login.kh")
	public String user() {
		return "user/page-double-sidebar2";
	}


	@RequestMapping("blog/*.kh")
	public ModelAndView blog1(HttpServletRequest req) {
		String uri = req.getRequestURI();
		System.out.println("uri : " + uri);
		
		String action = uri.substring(uri.lastIndexOf("/"));
		System.out.println("action : " + action);
		
		ModelAndView mav = new ModelAndView();
		
		if(action.equals("*.kh") || action.equals("1.kh")) {
			mav.setViewName("blog-style1");
		}
		
		return mav;
	}
}

