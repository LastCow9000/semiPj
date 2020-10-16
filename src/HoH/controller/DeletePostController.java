package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.MemberVO;

//게시글 삭제 기능
public class DeletePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		String url="/front?command=home"; //로그인 풀렸을 경우 홈으로 이동
		MemberVO memberVO=(MemberVO)session.getAttribute("memberVO"); //로그인 정보 받음
		if(session!=null && session.getAttribute("memberVO")!=null) { //로그인 체크
			BoardDAO.getInstance().deletePost(request.getParameter("no")); //postDetail.jsp에서 postNo를 받아와 매개변수로 설정하고 삭제메서드 호출
			String ageName=memberVO.getAgeName(); //시대명을 받아옴
			url="/front?command=agelist&agename="+ageName; //시대명으로 시대게시판을 받아옴
		}
		return url;
	}

}
