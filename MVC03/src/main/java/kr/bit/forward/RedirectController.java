package kr.bit.forward;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/rc.do")
public class RedirectController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		int su = 100;
		String data = "apple";
		
		String name = "An";
		int age = 40;
		String email = "aaa@gmail.com";
		// View page(result.jsp)로 data전달하여 View page에서 출력
		// Controller에서 View로 페이지를 전환하는 방법
		// 1. redirect
		// 2. forward
		//request.setAttribute("data", data); //객체 바인딩(request 바인딩)
		//response.sendRedirect("view/redirect.jsp?data="+data);
		response.sendRedirect("view/redirect.jsp?name="+name+"&age="+age+"&email="+email); //get방식+queryString
				
	}

}
