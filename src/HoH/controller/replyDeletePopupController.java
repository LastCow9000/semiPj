package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class replyDeletePopupController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String repNo=request.getParameter("repNo");
		request.setAttribute("repNo", repNo);
		return "/board/repDeleteConfirm.jsp";
	}

}
