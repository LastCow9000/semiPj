package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.MemberVO;
import HoH.model.PostVO;
import HoH.model.ReplyVO;

public class replyWriteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		String url = "/front?command=home"; // 로그인 안되어있을 경우 home으로
		if (session != null && session.getAttribute("memberVO") != null) { // 세션이 있고, 세션 객체가 있을 때
			String nick = request.getParameter("nick");
			String password = request.getParameter("password");
			String postNo = request.getParameter("postNo");
			String content = request.getParameter("replyContent");
			ReplyVO replyVO = new ReplyVO();
			PostVO postVO = new PostVO();
			postVO.setPostNo(postNo);
			replyVO.setContent(content);
			replyVO.setNick(nick);
			replyVO.setPassword(password);
			replyVO.setPostVO(postVO);
			BoardDAO.getInstance().writeReply(replyVO);
			url = "redirect:front?command=detailpost&postNo=" + postNo; // 값이 다시 넘어감을 방지하기 위한 redirect
		}
		return url;
	}
}
