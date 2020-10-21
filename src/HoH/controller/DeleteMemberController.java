package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.MemberDAO;
import HoH.model.MemberVO;

public class DeleteMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인 세션 가져오기
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

		// 세션에서 id가져오기
		String sessionid = memberVO.getId();
		// 폼에서 password가져오기
		String password = request.getParameter("password");
		boolean result=MemberDAO.getInstance().DeleteMember(sessionid,password);
		if(result==true) {
			session.invalidate();
			return "/member/deletemember-ok.jsp";
		}
		return "/member/deletemember-fail.jsp";
	}

}
