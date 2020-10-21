package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteMemberFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("url", "/member/deletemember-form.jsp");
		
		return "/template/layout.jsp";
	}

}
