package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.MemberDAO;
import HoH.model.MemberVO;

public class follwerAddController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//HttpSession session = request.getSession(false);
		//MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		String id = request.getParameter("id");//세션아이디를 보냈음
		String nickname = request.getParameter("nickname");//게시물의 닉네임을 전송
		MemberDAO.getInstance().follwerAdd(id, nickname);
		String result= "fail";
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
