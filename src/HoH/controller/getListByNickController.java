package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.ListVO;
import HoH.model.PagingBean;
import HoH.model.PostVO;

public class getListByNickController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*		미완
		 * String nickName=request.getParameter("nickName"); String pageNo =
		 * request.getParameter("pageNo"); //int totalPostCount =
		 * BoardDAO.getInstance().getTotalPostCount(nickName); PagingBean pagingBean =
		 * null; ArrayList<PostVO> list=new ArrayList<PostVO>(); if(pageNo==null) {
		 * pagingBean = new PagingBean(totalPostCount); } else { pagingBean = new
		 * PagingBean(totalPostCount,Integer.parseInt(pageNo)); } ListVO lvo=new
		 * ListVO(list, pagingBean); for (int i = 0; i < list.size(); i++) { String
		 * postNo=list.get(i).getPostNo(); int
		 * replyCount=BoardDAO.getInstance().getReplyListCount(postNo);
		 * BoardDAO.getInstance().updateReplyCount(replyCount, postNo); list =
		 * BoardDAO.getInstance().getListByAge(ageName,pagingBean); }
		 * list=BoardDAO.getInstance().getPostListByNickName(nickName);
		 * request.setAttribute("url", "/board/getPostListByNickName.jsp");
		 * request.setAttribute("list", list);
		 * 
		 * System.out.println(list.get(0).getTitle());
		 */
		
		return "/template/layout.jsp";
	}

}
