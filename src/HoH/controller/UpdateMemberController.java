package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.MemberDAO;
import HoH.model.MemberVO;

public class UpdateMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		String ageName = request.getParameter("ageName");
		int point = Integer.parseInt(request.getParameter("point"));
		
		MemberVO memberVO = new MemberVO(id, password, nickname, ageName, point, null);
		MemberDAO.getInstance().update(memberVO);
		
		HttpSession session = request.getSession(false);
		
		//로그인 상태가 아니면
		if(session == null || session.getAttribute("memberVO") == null) {
			return "redirect:front?command=home";
		} else {
			//새로 업데이트 된 member정보 담기
			session.setAttribute("memberVO", memberVO);
			//update-ok로 alert띄우기
			return "/member/update-ok.jsp";
		}
	}

}
