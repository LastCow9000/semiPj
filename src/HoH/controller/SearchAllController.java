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
		boolean flag=false;
		String ageName = "전체 검색";
		String option=request.getParameter("option");
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
			list=BoardDAO.getInstance().getListByOption(option,word,pagingBean);
			lvo.setList(list);
			flag=true;
			ArrayList<PostVO> noticeList = BoardDAO.getInstance().getNoticeList();
			request.setAttribute("noticeList", noticeList);
		request.setAttribute("ageName", ageName);
		request.setAttribute("noticeNumber", BoardDAO.getInstance().totalNoticeCount());
		request.setAttribute("listvo", lvo);
		request.setAttribute("totalPostCount", totalPostCount);
		request.setAttribute("url", "/board/postListByAge.jsp");
		request.setAttribute("flag",flag);
		request.setAttribute("option",option);
		request.setAttribute("word",word);
		return "/template/layout.jsp";
	}

}
