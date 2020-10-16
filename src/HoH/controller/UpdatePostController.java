package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.PostVO;

public class UpdatePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		String url="/front?command=home"; //로그인 풀리면 홈으로
		if (session != null && session.getAttribute("memberVO") != null) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String postNo = request.getParameter("postNo");
			PostVO postVO = new PostVO();
			postVO.setPostNo(postNo);
			postVO.setTitle(title);
			postVO.setContent(content);
			BoardDAO.getInstance().updatePost(postVO);
			url="redirect:front?command=detailpost&postNo=" + postNo;
		}
		return url;
	}

}
