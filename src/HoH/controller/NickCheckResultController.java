package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.MemberDAO;

public class NickCheckResultController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nickname= request.getParameter("nickname");
		boolean flag = MemberDAO.getInstance().checkNick(nickname);
		String result="fail";
		if(flag==false) {
			result="ok";
		}
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
