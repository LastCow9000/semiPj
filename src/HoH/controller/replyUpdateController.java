package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;

public class replyUpdateController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String repNo=request.getParameter("repNo");
		String content=request.getParameter("content");
		String password=request.getParameter("password");
		boolean flag=BoardDAO.getInstance().updateReply(repNo, content, password);
		String result="fail";
		if(flag==true) {
			result="ok";
		}
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
