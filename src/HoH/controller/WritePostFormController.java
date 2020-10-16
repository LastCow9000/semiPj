package HoH.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 글작성폼 레이아웃 적용을 위한 컨트롤러
public class WritePostFormController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url="/template/layout.jsp";
		request.setAttribute("url", "/board/write.jsp");
		return url;
	}

}
