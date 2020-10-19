package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.ListVO;
import HoH.model.PagingBean;
import HoH.model.PostVO;

public class SearchAllController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String option=(String) request.getParameter("option");
		String word = request.getParameter("word");
		
		int totalPostCount=BoardDAO.getInstance().getListCountByWriter(option, word);
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		ArrayList<PostVO> list=new ArrayList<PostVO>();
		
		//pageNo가 없으면 pagingbean 만들어서 totalpostcount 만 넣어준다
		if(pageNo==null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount,Integer.parseInt(pageNo));
		}
	
		//객체생성
		ListVO lvo=new ListVO(list, pagingBean);
		
		if(option.contentEquals("작성자")) {
			//option,word 값 보내주기
			list=BoardDAO.getInstance().getListByOption(option,word);
			lvo.setList(list);
		//그렇지 않을경우 
		} else if(option.contentEquals("제목")) {
			list=BoardDAO.getInstance().getListByOption(option,word);
			lvo.setList(list);
		}
		request.setAttribute("listvo", lvo);
		request.setAttribute("totalPostCount", totalPostCount);
		return "/board/postListByAge.jsp";
	}

}
