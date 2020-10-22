package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;

public class replyDeleteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String repNo=request.getParameter("repNo");
		String inputPassword=request.getParameter("password");
		String originalPassword=BoardDAO.getInstance().getReplyPass(repNo);
		String result = "fail";
		if(inputPassword.equals(originalPassword)) {
			boolean flag=BoardDAO.getInstance().deleteReply(repNo);
			if (flag == true) 
				result = "ok";
			request.setAttribute("responsebody", result);
		}
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
