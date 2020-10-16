package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.PostVO;
// 시대별 게시물 받아오는 기능
public class getPostListByAgeController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ageName = request.getParameter("agename");
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		if(ageName.contentEquals("고조선시대")) {
			list = BoardDAO.getInstance().getListByAge(ageName);
		} else if(ageName.contentEquals("삼국시대")) {
			list = BoardDAO.getInstance().getListByAge(ageName);
		} else if(ageName.contentEquals("고려시대")) {
			list = BoardDAO.getInstance().getListByAge(ageName);
		} else if(ageName.contentEquals("조선시대")) {
			list = BoardDAO.getInstance().getListByAge(ageName);
		}
		request.setAttribute("list", list);
		request.setAttribute("ageName", ageName);
		request.setAttribute("url", "/board/postListByAge.jsp");
		return "/template/layout.jsp";
	}

}
