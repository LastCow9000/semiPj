package HoH.controller;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import HoH.model.FollowDAO;
import HoH.model.MemberVO;

public class GetDetailMemberController implements Controller {

	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		request.setAttribute("url", "/member/my-info.jsp");
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("memberVO")==null) {
		         return "redirect:front?command=home";
		}
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	    String id = memberVO.getId();
		ArrayList<String> followingList = FollowDAO.getInstance().follwingList(id);
		request.setAttribute("followingList", followingList);
		return "/template/layout.jsp";
	}

}
