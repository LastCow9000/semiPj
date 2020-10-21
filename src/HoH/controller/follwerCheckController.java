package HoH.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import HoH.model.FollowDAO;

public class follwerCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nickname = request.getParameter("nickname");
		String id = request.getParameter("id");
		boolean flag = FollowDAO.getInstance().follwerCheck(id, nickname);
		String result ="fail";
		if(flag == false) {
			result ="ok";
		}
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
