package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.BookDTO;
import dto.ReviewCommentDTO;
import dto.SerialDTO;
import service.SerialService;

@Controller
public class SerialController {
	SerialService service;
	
	public void setService(SerialService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/getComment.kh")
	public @ResponseBody List<ReviewCommentDTO> getComment(int upno){
		return service.getReviewCommentProcess(upno);
	}
	
	@RequestMapping(value="/insertComment.kh")
	public @ResponseBody List<ReviewCommentDTO> insertComment(ReviewCommentDTO rdto){
		service.insertReviewCommentProcess(rdto);
		return service.getReviewCommentProcess(rdto.getUpno());
	}
	
	@RequestMapping(value="/deleteComment.kh")
	public @ResponseBody List<ReviewCommentDTO> deleteComment(ReviewCommentDTO rdto){
		service.deleteReviewCommentProcess(rdto);
		return service.getReviewCommentProcess(rdto.getUpno());
	}
	
	@RequestMapping(value="/serialMove.kh")
	public @ResponseBody SerialDTO serialMove(int bno, int rm){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("rm", rm);
		SerialDTO sdto = service.getSerialProcess(map);
		String fileName = sdto.getScontent();
		/*파일 내용 가져오기*/

		String text = "";
		try{
            //파일 객체 생성
            File file = new File("C:\\temp\\test\\" + fileName);
            //입력 스트림 생성
            FileReader filereader = new FileReader(file);
            //입력 버퍼 생성
            BufferedReader bufReader = new BufferedReader(filereader);
            String line = "";
            while((line = bufReader.readLine()) != null){
            	text += line + "<br/>";
            }
            //.readLine()은 끝에 개행문자를 읽지 않는다.
            bufReader.close();
        }catch (FileNotFoundException e) {
            System.out.println(e);
        }catch(IOException e){
            System.out.println(e);
        }
		sdto.setScontent(text);
		return sdto;
	}
	
	@RequestMapping(value="/serialView.kh")
	public ModelAndView serialView(int bno, int rm) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		String fileName = "";
		map.put("bno", bno);
		map.put("rm", rm);
		SerialDTO sdto = service.getSerialProcess(map);
		map.put("upno", sdto.getUpno());
		fileName = sdto.getScontent();
		/*파일 내용 가져오기*/

		String text = "";
		try{
            //파일 객체 생성
            File file = new File("C:\\temp\\test\\" + fileName);
            //입력 스트림 생성
            FileReader filereader = new FileReader(file);
            //입력 버퍼 생성
            BufferedReader bufReader = new BufferedReader(filereader);
            String line = "";
            while((line = bufReader.readLine()) != null){
            	text += line + "<br/>";
            }
            //.readLine()은 끝에 개행문자를 읽지 않는다.
            bufReader.close();
        }catch (FileNotFoundException e) {
            System.out.println(e);
        }catch(IOException e){
            System.out.println(e);
        }
		sdto.setScontent(text);
		int totalCount = service.getSerialCountProcess(bno);
		List<ReviewCommentDTO> rcdto = service.getReviewCommentProcess(sdto.getUpno());
		mav.addObject("bno", bno);
		mav.addObject("rm", rm);
		mav.addObject("sdto", sdto);
		mav.addObject("totalCount", totalCount);
		mav.addObject("myCount", service.getSerialMyCountProcess(map));
		mav.addObject("review", rcdto);
		mav.setViewName("serialView");
		return mav;
	}
	
	@RequestMapping("gradeCheck.kh")
	public @ResponseBody int gradeCheck(int bno, int rm, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("rm", rm);
		SerialDTO sdto = service.getSerialProcess(map);
		map.put("upno", sdto.getUpno());
		map.put("id", session.getAttribute("id"));
		return service.gradeCheckProcess(map);
	}
	
	@RequestMapping("gradeInsert.kh")
	public void gradeInsert(int bno, int rm, int grade, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("rm", rm);
		SerialDTO sdto = service.getSerialProcess(map);
		map.put("upno", sdto.getUpno());
		map.put("id", session.getAttribute("id"));
		map.put("grade", grade);
		service.gradeInsertProcess(map);
	}
	
	@RequestMapping("gradeUpdate.kh")
	public void gradeUpdate(int bno, int rm, int grade, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("rm", rm);
		SerialDTO sdto = service.getSerialProcess(map);
		map.put("upno", sdto.getUpno());
		map.put("id", session.getAttribute("id"));
		map.put("grade", grade);
		service.gradeUpdateProcess(map);
	}
	
	@RequestMapping("bookInfo.kh")
	public @ResponseBody BookDTO bookInfo(int bno) {
		return service.bookInfoProcess(bno);
	}
	
	@RequestMapping("authorBook.kh")
	public @ResponseBody List<BookDTO> authorBook(int auno) {
		return service.authorBookProcess(auno);
	}
	
	@RequestMapping(value="/serialNumGet.kh")
	public @ResponseBody int serialNumGet(int bno, int upno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("upno", upno);

		return service.getSerialMyCountProcess(map);
	}
	

}
