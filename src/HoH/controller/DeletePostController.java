package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.MemberVO;

public class DeletePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		String url="/front?command=home"; //로그인 풀렸을 경우 홈으로 이동
		MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
		if(session!=null && session.getAttribute("memberVO")!=null) {
			BoardDAO.getInstance().deletePost(request.getParameter("no")); //postDetail.jsp에서 postNo를 받아와 매개변수로 설정하고 삭제메서드 호출
			String ageName=memberVO.getAgeName();
			url="/front?command=agelist&agename="+ageName; //
		}
		return url;
	}

}
