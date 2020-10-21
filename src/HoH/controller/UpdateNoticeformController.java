package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.PostVO;

public class UpdateNoticeformController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		String url = "/front?command=home"; // 로그인 풀리면 홈으로
		if (session != null && session.getAttribute("memberVO") != null) { //로그인 체크
			url = "/template/layout.jsp";
			String postNo = request.getParameter("no");
			String rnum = request.getParameter("rnum");
			PostVO postVO = BoardDAO.getInstance().noticeDetailByNo(postNo); // 게시물 정보를 받아와서 수정폼에 다시 넘겨주기 위해 호출
			request.setAttribute("postVO", postVO);
			request.setAttribute("rnum", rnum);
			request.setAttribute("url", "/board/updateNotice.jsp");
		}
		return url;
	}

}
