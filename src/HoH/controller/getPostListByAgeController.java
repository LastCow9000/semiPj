package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.ListVO;
import HoH.model.PagingBean;
import HoH.model.PostVO;

public class getPostListByAgeController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ageName = request.getParameter("agename");
		int totalPostCount = BoardDAO.getInstance().getTotalPostCount(ageName);
		String pageNo = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		if(pageNo==null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount,Integer.parseInt(pageNo));
		}
		ListVO lvo=new ListVO(list, pagingBean);
		if(ageName.contentEquals("고조선시대")) {
			list = BoardDAO.getInstance().getListByAge(ageName,pagingBean);
			if(list!=null) {
				for (int i = 0; i < list.size(); i++) {
					String postNo=list.get(i).getPostNo();
					int replyCount=BoardDAO.getInstance().getReplyListCount(postNo);
					BoardDAO.getInstance().updateReplyCount(replyCount, postNo);
					list = BoardDAO.getInstance().getListByAge(ageName,pagingBean);
				}
			}
			lvo.setList(list);
		} else if(ageName.contentEquals("삼국시대")) {
			list = BoardDAO.getInstance().getListByAge(ageName,pagingBean);
			if(list!=null) {
				for (int i = 0; i < list.size(); i++) {
					String postNo=list.get(i).getPostNo();
					int replyCount=BoardDAO.getInstance().getReplyListCount(postNo);
					BoardDAO.getInstance().updateReplyCount(replyCount, postNo);
					list = BoardDAO.getInstance().getListByAge(ageName,pagingBean);
				}
			}
			lvo.setList(list);
		} else if(ageName.contentEquals("고려시대")) {
			list = BoardDAO.getInstance().getListByAge(ageName , pagingBean);
			if(list!=null) {
				for (int i = 0; i < list.size(); i++) {
					String postNo=list.get(i).getPostNo();
					int replyCount=BoardDAO.getInstance().getReplyListCount(postNo);
					BoardDAO.getInstance().updateReplyCount(replyCount, postNo);
					list = BoardDAO.getInstance().getListByAge(ageName,pagingBean);
				}
			}
			lvo.setList(list);
		} else if(ageName.contentEquals("조선시대")) {
			list = BoardDAO.getInstance().getListByAge(ageName, pagingBean);
			if(list!=null) {
				for (int i = 0; i < list.size(); i++) {
					String postNo=list.get(i).getPostNo();
					int replyCount=BoardDAO.getInstance().getReplyListCount(postNo);
					BoardDAO.getInstance().updateReplyCount(replyCount, postNo);
					list = BoardDAO.getInstance().getListByAge(ageName,pagingBean);
				}
			}
			lvo.setList(list);
		}
		
		request.setAttribute("listvo", lvo);
		request.setAttribute("ageName", ageName);
		request.setAttribute("totalPostCount", totalPostCount);
		request.setAttribute("url", "/board/postListByAge.jsp");
		return "/template/layout.jsp";
	}

}
