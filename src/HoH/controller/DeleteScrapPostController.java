package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.MemberDAO;
import HoH.model.MemberVO;
import HoH.model.ScrapDAO;
import oracle.net.aso.s;

public class DeleteScrapPostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		//로그인 세션 가져오기
		HttpSession session = request.getSession(false);
        MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
       
        //세션에서 id가져오기
        String loginId = memberVO.getId();
        //my-scrap-list에서 postNo가져오기
        String DeleteScrapPostNo = request.getParameter("postNo");
        String id=ScrapDAO.getInstance().ScrapPostDetailByNo(DeleteScrapPostNo).getMemberVO().getId();
        
        //delete 진행
        //return : true - 잘 작동 / return :false - 잘 작동 X
        boolean flag 
        	= ScrapDAO.getInstance().deleteScrapPostByPostNo(DeleteScrapPostNo, loginId);
        
		// 결과값 
		String result = "fail";
		
		// flag
		if (flag) {
			result = "ok";
			MemberDAO.getInstance().UpdateMinusPoint(id, MemberVO.scrapPoint);
			memberVO =MemberDAO.getInstance().getPoint(id);
			session.setAttribute("memberVO", memberVO);
		}
		request.setAttribute("responsebody", result);
		
		return "AjaxView";
	}

}
