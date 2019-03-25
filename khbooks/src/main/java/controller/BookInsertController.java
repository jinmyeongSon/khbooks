package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.BUploadDAO;
import dto.BookDTO;
import service.BUploadService;


//http://localhost:8090/khbook/bList.kh


@Controller
public class BookInsertController {
	private BUploadService bservice;
	private BUploadDAO bdao;
	private String path;
	
	
	public BookInsertController() {
	
	}
	
	public void setService(BUploadService service) {
		this.bservice = service;
	}
	
	public void setDao(BUploadDAO dao) {
		this.bdao = dao;
	}
	
	/*@RequestMapping("/bList.kh")
	public ModelAndView bookListPage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.bookViewList());
		mav.setViewName("bookList");
		return mav;
	}*/
	// 홈
	@RequestMapping(value = "/bList.kh", method = RequestMethod.GET)
	public String index() {
		return "bookList";
	}
	
	
	@RequestMapping("/binsert.kh")
	public String insertPage() {
		return "bookInsertForm";
	}
	
	@RequestMapping(value="/bookInsertList.kh", method=RequestMethod.POST)
	public @ResponseBody List<BookDTO> replyListPage(BookDTO bdto, HttpServletRequest request){
		MultipartFile file = bdto.getFilename();
		if(!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			UUID random =UUID.randomUUID(); 
			String root= request.getSession().getServletContext().getRealPath("/");
		
			//root+"temp/"
			String saveDirectory = root + "temp" + File.separator;
			File fe = new File(saveDirectory);
			if(!fe.exists())
				fe.mkdir();
			
			File ff= new File(saveDirectory, random + "_" + fileName);
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			bdto.setBthumb(random + "_" + fileName);
			
		}
		
		
		return bservice.bookList(bdto);
	}
	
}//end class
