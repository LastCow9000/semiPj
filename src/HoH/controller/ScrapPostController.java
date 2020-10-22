package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.MemberDAO;
import HoH.model.MemberVO;
import HoH.model.ScrapDAO;

public class ScrapPostController implements Controller {

	// 스크랩 동작 Controller
	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		// 로그인 세션 가져오기
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

		// 세션에서 id가져오기
		String loginId = memberVO.getId();
		// postDetail에서 postNo가져오기
		String ScrapPostNo = request.getParameter("postNo");
		
		//scrap 진행
		// return : true - 잘 작동 / return :false - 잘 작동 X
		boolean flag = ScrapDAO.getInstance().scrapPost(ScrapPostNo, loginId);

		// 결과값 
		String result = "fail";
		String id=ScrapDAO.getInstance().ScrapPostDetailByNo(ScrapPostNo).getMemberVO().getId();
		// flag
		if (flag) {
			result = "ok";
			MemberDAO.getInstance().UpdatePlusPoint(id, MemberVO.scrapPoint);
			//포인트 받아오기
			memberVO =MemberDAO.getInstance().getPoint(id);
			session.setAttribute("memberVO", memberVO);
		}
		
		request.setAttribute("responsebody", result);
		
		return "AjaxView";
	}

}
