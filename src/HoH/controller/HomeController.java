package HoH.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HoH.model.BoardDAO;
import HoH.model.PostVO;

public class HomeController implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String url = null;
      ArrayList<PostVO> list = BoardDAO.getInstance().getListByLike();
      ArrayList<PostVO> gojosunList = new ArrayList<PostVO>();
      ArrayList<PostVO> threeKingdomList = new ArrayList<PostVO>();
      ArrayList<PostVO> goryeoList = new ArrayList<PostVO>();
      ArrayList<PostVO> josunList = new ArrayList<PostVO>();
      for (int i = 0; i < list.size(); i++) {
         if (list.get(i).getMemberVO().getAgeName().equals("고조선시대"))
            gojosunList.add(list.get(i));
         else if (list.get(i).getMemberVO().getAgeName().equals("삼국시대"))
            threeKingdomList.add(list.get(i));
         else if (list.get(i).getMemberVO().getAgeName().equals("고려시대"))
            goryeoList.add(list.get(i));
         else if (list.get(i).getMemberVO().getAgeName().equals("조선시대"))
            josunList.add(list.get(i));

      }
      request.setAttribute("gojosunList", gojosunList);
      request.setAttribute("threeKingdomList", threeKingdomList);
      request.setAttribute("goryeoList", goryeoList);
      request.setAttribute("josunList", josunList);

      request.setAttribute("url", "/template/home.jsp");
      url = "/template/layout.jsp";
      return url;
   }

}