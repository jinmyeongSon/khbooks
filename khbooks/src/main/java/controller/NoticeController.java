package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//http://localhost:8090/khbook/noticeList.kh

@Controller
public class NoticeController {
	
	public NoticeController() {
		
	}
	
	@RequestMapping("/noticeList.kh")
	public String index() {
		return "noticeList";
	}

}
