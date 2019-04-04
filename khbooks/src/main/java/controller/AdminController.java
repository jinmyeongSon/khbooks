package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.AdminPageDTO;
import dto.AuthorDTO;
import dto.BookDTO;
import dto.GenreDTO;
import dto.SerialDTO;
import dto.UserDTO;
import service.AdminService;

//http://localhost:8090/khbook/adminLogin.kh
//http://localhost:8090/khbook/adminMain.kh

@Controller
public class AdminController {
	private AdminService service;
	
	public void setService(AdminService service) {
		this.service = service;
	}

	// 관리자 로그인 페이지로 이동
	@RequestMapping("adminLogin.kh")
	public String adminLogin() {
		return "adminLogin";
	}

	// 관리자 메인 페이지로 이동
	@RequestMapping("adminMain.kh")
	public String adminMain(HttpSession session) {
		String id = (String) session.getAttribute("admin");
		if(id != null) {
			return "adminMain";
		}else {
			return "redirect:/adminLogin.kh";
		}
	}
	
	// 관리자 로그인 시도 시 체크
	@RequestMapping("adminLoginCheck.kh")
	public String adminLoginCheck(String id, String pass, HttpSession session) {
		int count = service.adminLoginCheckProcess(id, pass);
		
		if(count == 1) {
			session.setAttribute("admin", id);
			return "redirect:/adminMain.kh";
		}else {
			return "redirect:/adminLogin.kh";
		}
	}
	
	// book insert form
	@RequestMapping("bookInsertForm.kh")
	public ModelAndView bookInsertForm() {
		ModelAndView mav = new ModelAndView();
		List<GenreDTO> gList = service.getGenreListProcess();
		mav.addObject("gList", gList);
		mav.setViewName("bookInsertForm");
		return mav;
	}
	
	// book insert form
	@RequestMapping("authorInsertForm.kh")
	public String authorInsertForm() {
		return "authorInsertForm";
	}
	
	@RequestMapping(value="bookInsert.kh", method=RequestMethod.POST)
	public String bookInsert(BookDTO dto) {
		MultipartFile file = dto.getFile();
		// 첨부파일 경로 수정 필요
		if(file != null) {
			String fileName = file.getOriginalFilename();
			// 중복파일명 방지 위한 난수 발생
			UUID random = UUID.randomUUID();
			// 파일 저장될 경로만들기
			String root = "C:\\temp\\test";
			//root + "temp/"와 같음
			String saveDirectory = root+File.separator;
			// 위의 경로를 갖은 파일 클래스 생성
			File fe = new File(saveDirectory);
			if(!fe.exists())
				fe.mkdir();
			// 경로와 파일명 갖는 파일 생성
			File ff = new File(saveDirectory, random + "_" + fileName);
			try {
				// 위 파일 위치에 실제 파일 붙여넣기
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 파일이름저장
			dto.setBthumb(random + "_" + fileName);
		}
		
		service.bookInsertProcess(dto);
		
		return "redirect:/bookList.kh";
	}
	
	@RequestMapping("authorInsert.kh")
	public String authorInsert(AuthorDTO adto) {
		service.authorInsertProcess(adto);
		return "redirect:/authorList.kh";
	}
	
	// 유저 리스트 띄워줌
	@RequestMapping("userList.kh")
	public ModelAndView userList(AdminPageDTO adto) {
		AdminPageDTO dto = null;
		int totalCount = 0;
		int currentPage = 1;
		List<UserDTO> uList = null;
		
		if(adto.getCurrentPage() != 0) {
			currentPage = adto.getCurrentPage();
		}
		
		if(adto.getSearchWord() != null && !adto.getSearchWord().equals("")) {
			totalCount = service.getUserSearchCountProcess(adto);
			dto = new AdminPageDTO(currentPage, totalCount, adto.getSearchKey(), adto.getSearchWord());
			uList = service.getUserSearchProcess(dto);
		} else {
			totalCount = service.getUserListCountProcess();
			dto = new AdminPageDTO(currentPage, totalCount);
			uList = service.getUserListProcess(dto);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("uList", uList);
		mav.addObject("adto", dto);
		mav.setViewName("userListForm");
		return mav;
	}
	
	// 책 리스트 띄워줌
	@RequestMapping("bookList.kh")
	public ModelAndView bookList(AdminPageDTO adto) {
		AdminPageDTO dto = null;
		int totalCount = 0;
		int currentPage = 1;
		List<BookDTO> bList = null;
		
		if(adto.getCurrentPage() != 0) {
			currentPage = adto.getCurrentPage();
		}
		
		if(adto.getSearchWord() != null && !adto.getSearchWord().equals("")) {
			System.out.println(adto.getSearchKey());
			System.out.println(adto.getSearchWord());
			totalCount = service.getBookSearchCountProcess(adto);
			System.out.println(totalCount);
			dto = new AdminPageDTO(currentPage, totalCount, adto.getSearchKey(), adto.getSearchWord());
			bList = service.getBookSearchProcess(dto);
		} else {
			totalCount = service.getBookListCountProcess();
			dto = new AdminPageDTO(currentPage, totalCount);
			bList = service.getBookListProcess(dto);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("bList", bList);
		mav.addObject("adto", dto);
		mav.setViewName("bookListForm");
		return mav;
	}
	
	// 책 리스트 띄워줌
	@RequestMapping("authorList.kh")
	public ModelAndView authorList(AdminPageDTO adto) {
		AdminPageDTO dto = null;
		int totalCount = 0;
		int currentPage = 1;
		List<BookDTO> bList = null;
		
		if(adto.getCurrentPage() != 0) {
			currentPage = adto.getCurrentPage();
		}
		
		if(adto.getSearchWord() != null && !adto.getSearchWord().equals("")) {
			totalCount = service.getAuthorSearchCountProcess(adto);
			dto = new AdminPageDTO(currentPage, totalCount, adto.getSearchKey(), adto.getSearchWord());
			bList = service.getAuthorSearchProcess(dto);
		} else {
			totalCount = service.getAuthorListCountProcess();
			dto = new AdminPageDTO(currentPage, totalCount);
			bList = service.getAuthorListProcess(dto);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", bList);
		mav.addObject("adto", dto);
		mav.setViewName("authorListForm");
		return mav;
	}
	
	// 책 상세정보
	@RequestMapping("bookDetailForm.kh")
	public ModelAndView bookDetailForm(int bno) {
		ModelAndView mav = new ModelAndView();
		List<GenreDTO> gList = service.getGenreListProcess();
		mav.addObject("gList", gList);
		mav.addObject("sList", service.getSerialListProcess(bno));
		mav.addObject("book", service.getBookOneProcess(bno));
		mav.setViewName("bookDetailForm");
		return mav;
	}
	
	// 유저 상세정보
	@RequestMapping("userUpdateForm.kh")
	public ModelAndView userUpdateForm(String id, AdminPageDTO adto) {
		ModelAndView mav = new ModelAndView();
		UserDTO udto = service.getUserOneProcess(id);
		mav.addObject("udto", udto);
		mav.addObject("adto", adto);
		mav.setViewName("userUpdateForm");
		return mav;
	}
	
	// 유저 상세정보
	@RequestMapping("authorUpdateForm.kh")
	public ModelAndView authorUpdateForm(int auno, AdminPageDTO adto) {
		ModelAndView mav = new ModelAndView();
		AuthorDTO dto = service.getAuthorOneProcess(auno);
		mav.addObject("dto", dto);
		mav.addObject("adto", adto);
		mav.setViewName("authorUpdateForm");
		return mav;
	}
	
	// 유저 업데이트
	@RequestMapping("userUpdate.kh")
	public String userUpdate(UserDTO udto) {
		service.userUpdateProcess(udto);
		return "redirect:/userList.kh";
	}
	
	// author 업데이트
	@RequestMapping("authorUpdate.kh")
	public String authorUpdate(AuthorDTO adto) {
		service.authorUpdateProcess(adto);
		return "redirect:/authorList.kh";
	}
	
	// book 업데이트
	@RequestMapping("bookUpdate.kh")
	public String bookUpdate(BookDTO bdto) {
		MultipartFile file = bdto.getFile();
		// 첨부파일 경로 수정 필요
		if(file != null) {
			String fileName = file.getOriginalFilename();
			// 중복파일명 방지 위한 난수 발생
			UUID random = UUID.randomUUID();
			// 파일 저장될 경로만들기
			String root = "C:\\temp\\test";
			//root + "temp/"와 같음
			String saveDirectory = root+File.separator;
			// 위의 경로를 갖은 파일 클래스 생성
			File fe = new File(saveDirectory);
			if(!fe.exists())
				fe.mkdir();
			// 경로와 파일명 갖는 파일 생성
			File ff = new File(saveDirectory, random + "_" + fileName);
			try {
				// 위 파일 위치에 실제 파일 붙여넣기
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 파일이름저장
			bdto.setBthumb(random + "_" + fileName);
		}
		service.bookUpdateProcess(bdto);
		return "redirect:/bookDetailForm.kh?bno="+bdto.getBno();
	}

	// serial 업데이트
	@RequestMapping("serialUpdate.kh")
	public String serialUpdate(SerialDTO sdto) {
		MultipartFile file = sdto.getFilename();
		// 첨부파일 경로 수정 필요
		if(file != null) {
			String fileName = file.getOriginalFilename();
			// 중복파일명 방지 위한 난수 발생
			UUID random = UUID.randomUUID();
			// 파일 저장될 경로만들기
			String root = "C:\\temp\\test";
			//root + "temp/"와 같음
			String saveDirectory = root+File.separator;
			// 위의 경로를 갖은 파일 클래스 생성
			File fe = new File(saveDirectory);
			if(!fe.exists())
				fe.mkdir();
			// 경로와 파일명 갖는 파일 생성
			File ff = new File(saveDirectory, random + "_" + fileName);
			try {
				// 위 파일 위치에 실제 파일 붙여넣기
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 파일이름저장
			sdto.setScontent(random + "_" + fileName);
		}
		service.serialUpdateProcess(sdto);
		return "redirect:/bookDetailForm.kh?bno="+sdto.getBno();
	}

	// 유저 delete
	@RequestMapping("userDelete.kh")
	public String userDelete(String id) {
		service.userDeleteProcess(id);
		return "redirect:/userList.kh";
	}

	// book delete
	@RequestMapping("bookDelete.kh")
	public String bookDelete(int bno) {
		service.bookDeleteProcess(bno);
		return "redirect:/bookList.kh";
	}

	// author delete
	@RequestMapping("authorDelete.kh")
	public String authorDelete(int auno) {
		service.authorDeleteProcess(auno);
		return "redirect:/authorList.kh";
	}

	// serial delete
	@RequestMapping("serialDelete.kh")
	public String serialDelete(int bno, int upno) {
		service.serialDeleteProcess(upno);
		return "redirect:/bookDetailForm.kh?bno="+bno;
	}
	
	// bookAuthor insert
	@RequestMapping("bookAuthorInsert.kh")
	public String bookAuthorInsert(int bno, int auno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("auno", auno);
		service.bookAuthorInsertProcess(map);
		return "redirect:/bookDetailForm.kh?bno="+bno;
	}
	
	// bookAuthor delete
	@RequestMapping("bookAuthorDelete.kh")
	public String bookAuthorDelete(int bno, int auno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("auno", auno);
		service.bookAuthorDeleteProcess(map);
		return "redirect:/bookDetailForm.kh?bno="+bno;
	}
	
	// bookAuthor search
		@RequestMapping("bookAuthorSearch.kh")
		public ModelAndView bookAuthorSearch(int bno, String searchWord) {
			ModelAndView mav = new ModelAndView();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bno", bno);
			map.put("searchWord", searchWord);
			mav.addObject("aList", service.bookAuthorSearchProcess(map));
			mav.setViewName("authorSearchResultForm");
			return mav;
		}
	
}
