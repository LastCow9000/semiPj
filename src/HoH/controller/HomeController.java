package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.PostVO;

public class HomeController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url=null;
		ArrayList<PostVO> list=BoardDAO.getInstance().getListByLike();
		ArrayList<PostVO> gojosunList = new ArrayList<PostVO>();
		ArrayList<PostVO> threeKingdomList = new ArrayList<PostVO>();
		ArrayList<PostVO> goryeoList = new ArrayList<PostVO>();
		ArrayList<PostVO> josunList = new ArrayList<PostVO>();
		
		/*
		 * for (int i = 0; i < list.size(); i++) {
		 * if(list[i].memberVO.ageName.equals("고조선시대"))
		 * 
		 * 
		 * }
		 */
		
		request.setAttribute("hohlist", list);
		
		request.setAttribute("url", "/template/home.jsp");
		url="/template/layout.jsp";
		return url;
	}

}
