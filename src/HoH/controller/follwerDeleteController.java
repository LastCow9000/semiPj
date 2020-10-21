package HoH.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import HoH.model.FollowDAO;

public class follwerDeleteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nickname= request.getParameter("nickname");
		FollowDAO.getInstance().followDelete(nickname);
		String result = "fail";
		if(result =="ok") {
		request.setAttribute("responsebody", result);
		}
		return "AjaxView";
	}

}
