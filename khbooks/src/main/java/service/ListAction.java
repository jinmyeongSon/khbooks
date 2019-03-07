package boarddemo.action;

import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boarddemo.dao.BoardDAO;
import boarddemo.dto.PageDTO;

public class ListAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null || pageNum.equals("null")) {  //처음 실행했을 때
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);  //pageDTO에서 값을 받기위해 int값으로 변환해 준다			
		BoardDAO dao = BoardDAO.getInstance();
		
		//searchKey=subject&searchWord=test ( 검색!! 제목 카테고리에 test로 검색했을 때 넘어오는 파라미터값
		String searchKey = req.getParameter("searchKey");
		String searchWord = req.getParameter("searchWord");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchKey", searchKey);
		map.put("searchWord", searchWord);
		
		
		int totalCnt = dao.rowTotalCount(map);
		if(totalCnt>0) {
		PageDTO pdto = new PageDTO(currentPage,totalCnt,searchKey,searchWord);
		req.setAttribute("pdto", pdto);
		req.setAttribute("aList", dao.listMethod(pdto));
		}
	}//end execute()
}//end class
