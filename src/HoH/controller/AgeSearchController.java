package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.ListVO;
import HoH.model.PagingBean;
import HoH.model.PostVO;

public class AgeSearchController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean flag =false;
		StringBuilder sql = new StringBuilder();
		String ageName = request.getParameter("agename");
		String option = request.getParameter("option");
		String word = request.getParameter("word");
		sql.append(word);
		int ageTotalPostCount = BoardDAO.getInstance().totalAgePostCount(ageName, option, sql.toString());
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		if(pageNo==null) {
			pagingBean = new PagingBean(ageTotalPostCount);
		} else {
			pagingBean = new PagingBean(ageTotalPostCount,Integer.parseInt(pageNo));
		}
		ListVO lvo=new ListVO(list, pagingBean);
		if(ageName.contentEquals("고조선시대")) {
			list = BoardDAO.getInstance().getSearchListByAge(ageName,pagingBean, option,word);
			lvo.setList(list);
			flag =true;
		} else if(ageName.contentEquals("삼국시대")) {
			list = BoardDAO.getInstance().getSearchListByAge(ageName,pagingBean, option,word);
			lvo.setList(list);
			flag =true;
		} else if(ageName.contentEquals("고려시대")) {
			list = BoardDAO.getInstance().getSearchListByAge(ageName,pagingBean, option,word);
			lvo.setList(list);
			flag =true;
		} else if(ageName.contentEquals("조선시대")) {
			list = BoardDAO.getInstance().getSearchListByAge(ageName,pagingBean, option,word);
			lvo.setList(list);
			flag =true;
		}
		
		ArrayList<PostVO> noticeList = BoardDAO.getInstance().getNoticeList();
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("noticeNumber", BoardDAO.getInstance().totalNoticeCount());
		request.setAttribute("listvo", lvo);
		request.setAttribute("ageName", ageName);
		request.setAttribute("totalPostCount", ageTotalPostCount);
		request.setAttribute("url", "/board/postListByAge.jsp");
		request.setAttribute("flag", flag);
		request.setAttribute("ageName", ageName);
		request.setAttribute("option", option);
		request.setAttribute("word", word	);
		return "/template/layout.jsp";
	}

}
