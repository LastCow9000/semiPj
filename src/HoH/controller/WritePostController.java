package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.MemberVO;
import HoH.model.PostVO;

public class WritePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		String url = "/front?command=home";
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		if (session != null && session.getAttribute("memberVO") != null) {
			PostVO postVO = new PostVO();
			postVO.setTitle(title);
			postVO.setContent(content);
			postVO.setMemberVO(memberVO);
			int postNo = BoardDAO.getInstance().writePost(postVO);
			url = "redirect:front?command=detailpost&postNo=" + postNo;
		}
		return url;
	}
}
