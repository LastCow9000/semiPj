package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.MemberDAO;
import HoH.model.MemberVO;

public class LikeCancelController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String loginId = request.getParameter("loginId");
		String postNo = request.getParameter("postNo");
		String postId = request.getParameter("postId");
		String result="좋아요 취소";
		BoardDAO.getInstance().likeMinus(loginId, postNo);
		BoardDAO.getInstance().boardLikeMinusUpdate(postNo);
		MemberDAO.getInstance().UpdateMinusPoint(postId, MemberVO.likePoint);
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
