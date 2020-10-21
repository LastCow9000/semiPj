package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        
        //BoardDAO에 있는 getMyScrapPostList를 통해 postNo목록 가져오기
        
		//scrap된 post들의 모음을 만든다.
		ArrayList<PostVO> scrapedPostVOList = new ArrayList<PostVO>();

		//페이징
		int totalScrapCount=ScrapDAO.getInstance().getTotalScrapPostCount();
		String pageNo=request.getParameter("pageNo");
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalScrapCount);
		else
			pagingBean=new PagingBean(totalScrapCount, Integer.parseInt(pageNo));
		
		ArrayList<PostVO> list=ScrapDAO.getInstance().getMyScrapPostList(id, pagingBean);
		System.out.println(list);
		ListVO listVO=new ListVO(list, pagingBean);
		//각각의 postNo로 PostVO객체를 만들어온다.
		for (int i = 0; i < list.size(); i++) {
			scrapedPostVOList.add(ScrapDAO.getInstance().ScrapPostDetailByNo(list.get(i).getPostNo()));
		}
		
		listVO.setList(scrapedPostVOList);
		request.setAttribute("lvo", listVO);
		request.setAttribute("scrapedPostVOList", scrapedPostVOList);
		//url 보내주기
		request.setAttribute("url", "/member/my-scrap-list.jsp");
		
		return "/template/layout.jsp";
	}

}
