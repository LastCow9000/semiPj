package HoH.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/front")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.handleRequest(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		this.handleRequest(request, response);
	}
	
	protected void handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String command=request.getParameter("command"); // client가 보낸 command를 받는다
			Controller controller=HandlerMapping.getInstance().create(command); //command를 이용해 HandlerMapping의 create를 호출, 컨트롤러를 반환받는다
			String url=controller.execute(request, response);// 컨트롤러를 실행한다
			if(url.startsWith("redirect:"))
				response.sendRedirect(url.substring(9));//redirect:(':' 인덱스8번) 인덱스 9번 글자부터 실행
			else
				request.getRequestDispatcher(url).forward(request, response); //forward방식으로 응답
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp"); // 에러 발생시 error.jsp로 redirect 한다
		}
	}
}
