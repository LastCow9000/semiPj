package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.MemberDAO;
import HoH.model.MemberVO;
import HoH.model.PostVO;

public class WritePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		int postNo = -1;
		String url = "/front?command=home"; //로그인 안되어있을 경우 home으로
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO"); //세션 객체를 받아옴
		
		String title = request.getParameter("title"); //제목을 받아옴
		String content = request.getParameter("content"); //내용을 받아옴
		
		if (session != null && session.getAttribute("memberVO") != null) { //세션이 있고, 세션 객체가 있을 때
			PostVO postVO = new PostVO(); //매개변수로 넘겨줄 새 객체 생성 및 set
			postVO.setTitle(title);
			postVO.setContent(content);
			postVO.setMemberVO(memberVO);
			String id = memberVO.getId();
			
			
			MemberDAO.getInstance().UpdatePlusPoint(id, MemberVO.postPoint);
			//포인트 받아오기
			memberVO = MemberDAO.getInstance().getPoint(id);
			
			if(memberVO.getId().contentEquals("adminmts")) {
				postNo = BoardDAO.getInstance().wirteNoticePost(postVO);
				url = "redirect:front?command=noticeDetailpost&postNo=" + postNo; //값이 다시 넘어감을 방지하기 위한 redirect
			} else {
				postNo = BoardDAO.getInstance().writePost(postVO); //글 작성 DAO메서드 호출하여 postNo를 받아옴 
				url = "redirect:front?command=detailpost&postNo=" + postNo; //값이 다시 넘어감을 방지하기 위한 redirect
			}
			//반환받은 postNo를 이용하여 게시물상세정보 페이지로 이동
			//세션다시보내주기
			session.setAttribute("memberVO", memberVO);
		}
		return url;
	}
}
