package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.MemberDAO;
import HoH.model.MemberVO;

public class LikeCountController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		String loginId = request.getParameter("loginId");
		String postNo = request.getParameter("postNo");
		String postId = request.getParameter("postId");
		String result=null;
		int likeCheck = BoardDAO.getInstance().likeCheck(loginId, postNo);
		if(likeCheck==1) {
			result="좋아요한 게시물";
		} else if(likeCheck==0) {
			BoardDAO.getInstance().likePlus(loginId, postNo);
			BoardDAO.getInstance().boardLikePlusUpdate(postNo);
			MemberDAO.getInstance().UpdatePlusPoint(postId, MemberVO.likePoint);
			MemberVO memberVO= MemberDAO.getInstance().getPoint(postId);
			session.setAttribute("memberVO", memberVO);
			result="좋아요를 눌렀습니다.";
		}
		request.setAttribute("responsebody", result);
		
		return "AjaxView";
	}

}
