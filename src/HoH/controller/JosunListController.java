package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.PostVO;

public class JosunListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String ageName = request.getParameter("agename");
		ArrayList<PostVO> list = BoardDAO.getInstance().getListByAge(ageName);
		request.setAttribute("josunlist", list);
		request.setAttribute("url", "/board/josun-list.jsp");
		return "/template/layout.jsp";
	}

}
