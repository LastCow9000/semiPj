package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.PostVO;
import HoH.model.ReplyVO;

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
		String rnum = request.getParameter("rnum");
		
		// PostVO 객체 만들기 전에 조회수 증가하는 dao다녀옴
		BoardDAO.getInstance().updateview_count(postNo);
		
		//BoardDAO와 연결해서 PostVO 객체 만들기
		PostVO postVO = BoardDAO.getInstance().postDetailByNo(postNo);
		
		//댓글 리스트를 db로부터 가져옴
		ArrayList<ReplyVO> replyList=BoardDAO.getInstance().getReplyList(postNo);
		
		//댓글 갯수를 db로부터 가져옴
		int replyCount=BoardDAO.getInstance().getReplyListCount(postNo);
		
		//PostVO 객체 보내주기
		request.setAttribute("postVO", postVO);
		//rnum 변수 보내주기
		request.setAttribute("rnum", rnum);
		//댓글관련 정보 전송
		request.setAttribute("replyList", replyList);
		request.setAttribute("replyCount", replyCount);
		
		//url 보내주기
		request.setAttribute("url", "/board/postDetail.jsp");
		
		return "/template/layout.jsp";
	}

}
