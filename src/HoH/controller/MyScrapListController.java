package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.BoardDAO;
import HoH.model.ListVO;
import HoH.model.MemberVO;
import HoH.model.PagingBean;
import HoH.model.PostVO;
import HoH.model.ScrapDAO;

public class MyScrapListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		//로그인 여부 체크
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("memberVO")==null) {
			return "redirect:front?command=home";
		}
		
		//기존 세션에 저장된 로그인 정보 가져오기
        MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
        String id = memberVO.getId();
        
		//scrap된 post들의 모음을 만든다.
		ArrayList<PostVO> flist = new ArrayList<PostVO>();
		int totalFollowPostCount = ScrapDAO.getInstance().getTotalScrapCount(id);
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		
		if (pageNo == null) {
			pagingBean = new PagingBean(totalFollowPostCount);
		} else {
			pagingBean = new PagingBean(totalFollowPostCount, Integer.parseInt(pageNo));
		}	
		
		flist = ScrapDAO.getInstance().getMyScrapPostingList(id, pagingBean);

		ListVO lvo = new ListVO(flist, pagingBean);
		
		lvo.setList(flist);
		request.setAttribute("listvo", lvo);
		//여기까지 페이징
		
		
		//url 보내주기
		request.setAttribute("url", "/member/my-scrap-list.jsp");
		
		return "/template/layout.jsp";
	}

}
