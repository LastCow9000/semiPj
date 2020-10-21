package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.ListVO;
import HoH.model.PagingBean;
import HoH.model.PostVO;

public class NoticeListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ageName = request.getParameter("agename");
		int totalPostCount = BoardDAO.getInstance().totalNoticeCount();
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		if(pageNo==null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount,Integer.parseInt(pageNo));
		}
		list = BoardDAO.getInstance().getAllNoticeList(pagingBean);
		ListVO lvo=new ListVO(list, pagingBean);
		lvo.setList(list);
		
		request.setAttribute("listvo", lvo);
		request.setAttribute("ageName", ageName);
		request.setAttribute("totalPostCount", totalPostCount);
		request.setAttribute("url", "/board/noticePostListByAge.jsp");
		return "/template/layout.jsp";
	}

}
