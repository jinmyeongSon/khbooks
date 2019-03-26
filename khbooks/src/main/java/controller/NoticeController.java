package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.NoticeDTO;
import dto.PageDTO;
import dto.UploadDTO;
import service.NoticeService;

//http://localhost:8090/khbook/noticeList.kh

@Controller
public class NoticeController {
	private NoticeService nservice;
	private PageDTO pdto;
	private String path;
	private int currentPage;
	
	public NoticeController() {
		
	}
	
	public void setNservice(NoticeService nservice) {
		this.nservice = nservice;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
	
	@RequestMapping("/noticeList.kh")
	public ModelAndView noticeList(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = nservice.noticeCountPro();
		System.out.println("공지사항 총 갯수 : " + totalRecord);
		
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			
			pdto = new PageDTO(currentPage, totalRecord);
			List<NoticeDTO> aList = nservice.noticeListPro(pdto);
			
			for(NoticeDTO dto : aList) {
				System.out.println("제목 : " + dto.getBname());
			}
			
			mav.addObject("currentPage", currentPage);
			mav.addObject("pdto", pdto);
			mav.addObject("noticeList", aList);
		}
		
		mav.setViewName("noticeList");

		return mav;
	}//end noticeList()
	
	@RequestMapping("/noticeGet.kh")
	public @ResponseBody List<NoticeDTO> noticeGet() {
		int totalRecord = nservice.noticeCountPro();
		pdto = new PageDTO(1,totalRecord);
		List<NoticeDTO> aList = nservice.noticeListPro(pdto);
		return aList;
	}//end noticeList()
	
	
	@RequestMapping("/noticeView.kh")
	public ModelAndView noticeView(int nnum, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("currentPage", currentPage);
		mav.addObject("noticeView", nservice.noticeViewPro(nnum)); //List<NoticeDTO>
		mav.setViewName("noticeView");
		return mav;
	}//end noticeView()
	
	@RequestMapping("/noticeWrite.kh")
	public ModelAndView noticeWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeWrite");
		return mav;
	}
	
	@RequestMapping("/noticeWritePro.kh")
	public @ResponseBody List<NoticeDTO> noticeWritePro(NoticeDTO ndto, HttpServletRequest req, PageDTO pv) {
		
		List<MultipartFile> files = ndto.getFilename();
		List<UploadDTO> uList = new ArrayList<UploadDTO>();
		
		if(files != null) {
			for(MultipartFile file : files) {
				String fileName = file.getOriginalFilename();
				UUID random = UUID.randomUUID();
				File fe = new File(path);
				if(!fe.exists()) {
					fe.mkdirs();
				}
				File ff = new File(path, random + "_" + fileName);
				
				try {
					FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				uList.add(new UploadDTO(random+"_"+fileName));
			}
			
			ndto.setuList(uList);
			
		}
		
		nservice.noticeInsertPro(ndto);
		
		
		
		return nservice.noticeListPro(pv);
		
	}//end noticeWritePro()
	
	
	@RequestMapping("/noticeDelete.kh")
	public @ResponseBody List<NoticeDTO> noticeDelete(int nnum, PageDTO pv) {
		ModelAndView mav = new ModelAndView();

		
		nservice.noticeDeletePro(nnum);
		
		
		pv = new PageDTO(nnum, nservice.noticeCountPro());
		if(pv.getTotalPage() < currentPage) {
			mav.addObject("currentPage", pv.getTotalPage());
		} else {
			mav.addObject("currentPage", currentPage);
		}
		
		return nservice.noticeListPro(pv);
		
	}//end noticeDelete()
	
	
	//@RequestMapping("/noticeUpdate.kh")
	

}//end class
