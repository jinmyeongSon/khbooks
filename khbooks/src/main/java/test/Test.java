package test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
