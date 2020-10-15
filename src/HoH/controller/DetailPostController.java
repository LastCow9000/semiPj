package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.PostVO;

// 시대 별 게시글 상세보기 기능
public class DetailPostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		//로그인 유무 확인
//		HttpSession session = request.getSession(false);
//		if(session == null || session.getAttribute("memberVO") == null) {
//			return "redirect:index.jsp";
//		}
		
		//list에서 제목을 통해 postNo 받아옴
		String postNo = request.getParameter("postNo");
		
		//BoardDAO와 연결해서 PostVO 객체 만들기
		PostVO postVO = BoardDAO.getInstance().postDetailByNo(postNo);
		
		//PostVO 객체 보내주기
		request.setAttribute("postVO", postVO);
		
		//url 보내주기
		request.setAttribute("url", "/board/postDetail.jsp");
		
		return "/template/layout.jsp";
	}

}
