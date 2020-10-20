package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.MemberDAO;
import HoH.model.MemberVO;

public class FindPasswordByIdController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id=request.getParameter("id");
		String nickname=request.getParameter("nickname");
		
		MemberVO vo = MemberDAO.getInstance().findPasswordById(id,nickname);
		if(vo!=null) {
			String pw = vo.getPassword();
			pw = pw.replaceAll("(?<=.{3}).", "*");
			request.setAttribute("vo",vo);
			request.setAttribute("pw",pw);
			return "/member/findpasswordbyid-ok.jsp";
		}else {
			return "/member/findpasswordbyid-fail.jsp";
		}
		}//execute
	
}//class
