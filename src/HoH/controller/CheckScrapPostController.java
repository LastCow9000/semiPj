package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.MemberVO;
import HoH.model.ScrapDAO;

public class CheckScrapPostController implements Controller {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//로그인 세션 가져오기
		HttpSession session = request.getSession(false);
       MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
       
       //세션에서 id가져오기
       String loginId = memberVO.getId();
       //postDetail에서 postNo가져오기
       String ScrapPostNo = request.getParameter("postNo");

       //스크랩 여부 체크	  
       // 중복이면 : true , 아니면 : false
       boolean flag = ScrapDAO.getInstance().isCheckScrapPost(loginId, ScrapPostNo);
       
       //결과값
       String result = "fail";
       
       //중복 아니면(false) 결과 ok로 보내기
       if (flag == false) {
    	   result = "ok";
       }
       
	   //결과값 ajaxView로 보내기
	   request.setAttribute("responsebody", result);
		
		return "AjaxView";
	}

}
