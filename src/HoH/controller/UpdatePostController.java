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
		String url = "/front?command=home"; // 로그인 풀리면 홈으로
		if (session != null && session.getAttribute("memberVO") != null) { //로그인 체크
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String postNo = request.getParameter("postNo");
			PostVO postVO = new PostVO();
			postVO.setPostNo(postNo);
			postVO.setTitle(title);
			postVO.setContent(content);
			BoardDAO.getInstance().updatePost(postVO); //업데이트 메서드 호출
			url = "redirect:front?command=detailpost&postNo=" + postNo; //업데이트 후 게시물 상세정보 받아오기
		}
		return url;
	}

}
