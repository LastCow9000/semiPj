package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.MemberDAO;
import HoH.model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter("id");
		String password = request.getParameter("Password");
		String rank="iron";
		String Mrank=null;
		int percent=0;
		int iPoint=100;
		int bPoint=200;
		int sPoint=400;
		int gPoint=700;
		int pPoint=1200;
		int dPoint=2000;
		int cPoint=10000;
		MemberVO memberVO = MemberDAO.getInstance().login(id, password);

		if (memberVO != null) {
			int point = memberVO.getPoint();
		
			if(point<=iPoint) {
				Mrank=MemberDAO.getInstance().getRank(id);
				percent=(int)(point/(float)iPoint*100);
				memberVO = MemberDAO.getInstance().login(id, password);
			}else if(point<=bPoint) {
				rank="bronze";
				Mrank=MemberDAO.getInstance().getRank(id);
				if(rank!=Mrank) {
					MemberDAO.getInstance().rankUp(rank, id);
					Mrank=MemberDAO.getInstance().getRank(id);
				}
				percent=(int)((point-iPoint)/(float)(bPoint-iPoint)*100);
				memberVO = MemberDAO.getInstance().login(id, password);
			}else if(point<=sPoint) {
				rank="silver";
				Mrank=MemberDAO.getInstance().getRank(id);
				if(rank!=Mrank)
					MemberDAO.getInstance().rankUp(rank, id);
				percent=(int)((point-bPoint)/(float)(sPoint-bPoint)*100);
				memberVO = MemberDAO.getInstance().login(id, password);
			}else if(point<=gPoint) {
				rank="gold";
				Mrank=MemberDAO.getInstance().getRank(id);
				if(rank!=Mrank)
					MemberDAO.getInstance().rankUp(rank, id);
				percent=(int)((point-sPoint)/(float)(gPoint-sPoint)*100);
				memberVO = MemberDAO.getInstance().login(id, password);
			}else if(point<=pPoint) {
				rank="platinum";
				Mrank=MemberDAO.getInstance().getRank(id);
				if(rank!=Mrank)
					MemberDAO.getInstance().rankUp(rank, id);
				percent=(int)((point-gPoint)/(float)(pPoint-gPoint)*100);
				memberVO = MemberDAO.getInstance().login(id, password);
			}else if(point<=dPoint) {
				rank="diamond";
				Mrank=MemberDAO.getInstance().getRank(id);
				if(rank!=Mrank)
					MemberDAO.getInstance().rankUp(rank, id);
				percent=(int)((point-pPoint)/(float)(dPoint-pPoint)*100);
				memberVO = MemberDAO.getInstance().login(id, password);
			}else  {
				rank="challenger";
				Mrank=MemberDAO.getInstance().getRank(id);
				if(rank!=Mrank)
					MemberDAO.getInstance().rankUp(rank, id);
				percent=(int)((point-dPoint)/(float)(cPoint-dPoint)*100);
				memberVO = MemberDAO.getInstance().login(id, password);
			}
			HttpSession session = request.getSession();
			session.setAttribute("memberVO", memberVO);
			session.setAttribute("percent", percent);
			return "redirect:front?command=home";
		} else {
			return "/member/login-fail.jsp";
		}
	}
}
