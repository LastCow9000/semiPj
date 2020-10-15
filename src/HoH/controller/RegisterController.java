package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.MemberDAO;
import HoH.model.MemberVO;

public class RegisterController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password=request.getParameter("password");
		String nickName = request.getParameter("nickname");
		String ageName = request.getParameter("checkbox1");
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setNickName(nickName);
		memberVO.setPassword(password);
		memberVO.setAgeName(ageName);
		MemberDAO.getInstance().registerMember(memberVO);
		
		request.setAttribute("nickName", nickName);
		
		return "/member/register-ok.jsp";
	}

}
