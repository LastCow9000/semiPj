package HoH.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import HoH.model.FollowDAO;
import HoH.model.MemberVO;
import HoH.model.PostVO;
import HoH.model.ScrapDAO;

public class MyFollowListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//로그인 여부 체크
				HttpSession session = request.getSession(false);
				if (session == null || session.getAttribute("memberVO")==null) {
					return "redirect:front?command=home";
				}
				
				//기존 세션에 저장된 로그인 정보 가져오기
		        MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		        String id = memberVO.getId();
		       
		        //BoardDAO에 있는 getMyFollowPostList2를 통해 리스트받아오기.
				ArrayList<PostVO> followPostVOList = new ArrayList<PostVO>();
				followPostVOList = FollowDAO.getInstance().getMyFollowPostList(id);
				
				
				request.setAttribute("myFollowPostVOList", followPostVOList);
				
				//url 보내주기
				request.setAttribute("url", "/member/my-follow-list.jsp");
				
				return "/template/layout.jsp";
			}
	}


