package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.ReviewCommentDTO;
import service.SerialService;

@Controller
public class SerialController {
	SerialService service;
	
	public void setService(SerialService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/serialView.kh")
	public ModelAndView serialView(int bno, int upno, int rm) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		String fileName = "";
		int myCount = 0;
		int newno = 0;
		map.put("bno", bno);
		if(rm != 0) {
			map.put("rm", rm);
			newno = service.getUpnoProcess(map);
			map.put("upno", newno);
			fileName = service.getSerialContentProcess(newno);
			myCount = service.getSerialMyCountProcess(map);
		}else {
			newno = upno;
			map.put("upno", upno);
			fileName = service.getSerialContentProcess(upno);
			myCount = service.getSerialMyCountProcess(map);
		}
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
		int totalCount = service.getSerialCountProcess(bno);
		List<ReviewCommentDTO> rcdto = service.getReviewCommentProcess(newno);
		mav.addObject("bno", bno);
		mav.addObject("upno", newno);
		mav.addObject("text", text);
		mav.addObject("totalCount", totalCount);
		mav.addObject("myCount", myCount);
		mav.addObject("review", rcdto);
		mav.setViewName("serialView");
		return mav;
	}

}
