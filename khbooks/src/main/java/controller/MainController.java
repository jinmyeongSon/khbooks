package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.BookPageDTO;
import dto.NoticeDTO;
import dto.PageDTO;
import service.BookService;
import service.NoticeService;
import twitter4j.Paging;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterFactory;

//http://localhost:8090/khbook/mainpage.kh

@Controller
public class MainController {
	private NoticeService nservice;
	private PageDTO pdto2;
	private String path;
	private int currentPage;
	private BookService service;
	
	public void setNservice(NoticeService nservice) {
		this.nservice = nservice;
	}
	public void setService(BookService service) {
		this.service = service;
	}
	
	@RequestMapping("/mainpage.kh")
	public ModelAndView main(PageDTO pv,BookPageDTO pdto) {
		ModelAndView mav = new ModelAndView();
		BookPageDTO dto = null;
		int genreCount = 0;
		int sortKey = 1;
		int currentPage = 1;
		int totalRecord = nservice.noticeCountPro();
		int totalCount = 0;
		
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			if(pdto.getSortgenre() != 0) {
				genreCount = service.getBookGenreCountProcess(pdto.getSortgenre());
				dto = new BookPageDTO(currentPage, genreCount, pdto.getSortgenre(), sortKey, "", 9);
			} else {
				totalCount = service.getBookCountProcess();
				dto = new BookPageDTO(currentPage, totalCount, 0, sortKey, "", 9);
			}
			
			pdto2 = new PageDTO(currentPage, totalRecord);
			List<NoticeDTO> aList = nservice.noticeListPro(pdto2);
			mav.addObject("currentPage", currentPage);
			mav.addObject("pdto", pdto2);
			mav.addObject("bList", service.bookListProcess(dto));
			mav.addObject("noticeList", aList);
		 try {
		        Twitter twitter = TwitterFactory.getSingleton();
		        Paging page = new Paging (1, 5);
		        List<Status> tweet = twitter.getUserTimeline(page);
				mav.addObject("tweet", tweet);
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		mav.setViewName("main");
		
	}
		return mav;
}
}
