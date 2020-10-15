package HoH.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.MemberDAO;
import HoH.model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String id = request.getParameter("id");
		String password = request.getParameter("Password");
		
		MemberVO memberVO = MemberDAO.getInstance().login(id, password);
		
		if (memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memberVO", memberVO);	
			return "redirect:index.jsp";
		} else {
			return "/member/login-fail.jsp";
		}
	}

}
