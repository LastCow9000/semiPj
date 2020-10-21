package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;

public class DeleteNoticePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		String url="/front?command=home"; //로그인 풀렸을 경우 홈으로 이동
		if(session!=null && session.getAttribute("memberVO")!=null) {
			BoardDAO.getInstance().deleteNoticePost(request.getParameter("no"));
			String ageName = "공지사항";
			url="/front?command=noticeList&agename="+ageName; 
		}
		return url;
	}

}
