package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.MemberDAO;

public class IdCheckResultController implements Controller {

	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		
		//MemberDAO의 checkId 함수로 확인
		// 아이디가 중복이면 : true / 중복아니면 : false
		boolean flag = MemberDAO.getInstance().checkId(id);

		// 결과값 
		String result = "fail";
		
		if (flag == false) 
			result = "ok";
		
		request.setAttribute("responsebody", result);
		
		return "AjaxView";
	}

}
