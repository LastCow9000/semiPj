package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.MemberVO;
import HoH.model.PostVO;

// 시대 별 게시글 상세보기 기능
public class DetailPostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {

		String postNo = request.getParameter("postNo");
		String rnum = request.getParameter("rnum");
		
		// 로그인 유무 확인
		HttpSession session = request.getSession(false);
		if(session.getAttribute("memberVO") != null) {
				MemberVO membervo = (MemberVO)session.getAttribute("memberVO");
				String loginId = membervo.getId();
				int likeCheck = BoardDAO.getInstance().likeCheck(loginId, postNo);
				request.setAttribute("likeCheck", likeCheck);
		}
		
		// PostVO 객체 만들기 전에 조회수 증가하는 dao다녀옴
		BoardDAO.getInstance().updateview_count(postNo);
		
		//BoardDAO와 연결해서 PostVO 객체 만들기
		PostVO postVO = BoardDAO.getInstance().postDetailByNo(postNo);
		
		//PostVO 객체 보내주기
		request.setAttribute("postVO", postVO);
		//rnum 변수 보내주기
		request.setAttribute("rnum", rnum);
		
		//url 보내주기
		request.setAttribute("url", "/board/postDetail.jsp");
		
		return "/template/layout.jsp";
	}

}
