package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.PostVO;

public class GojosunListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ageName = request.getParameter("agename");
		ArrayList<PostVO> list = BoardDAO.getInstance().getListByAge(ageName);
		request.setAttribute("gojosunlist", list);
		return "/board/gojosun-list.jsp";
	}

}
