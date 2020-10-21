package HoH.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import HoH.model.FollowDAO;
import HoH.model.MemberDAO;
import HoH.model.MemberVO;

public class follwerDeleteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nickName= request.getParameter("nickname");
		String result = "fail";
		result=FollowDAO.getInstance().followDelete(nickName);
		if(result =="ok") {
			String id=MemberDAO.getInstance().findIdbyNickName(nickName);
			MemberDAO.getInstance().UpdateMinusPoint(id, MemberVO.followPoint);
			request.setAttribute("responsebody", result);
		}
		return "AjaxView";
	}

}
