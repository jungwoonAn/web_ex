package kr.web.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import kr.web.util.MyUtil;

// JavaEE -> Servlet(서블릿)의 골격
@WebServlet("/hs")
public class HelloServlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		//1~100까지의 총합
		MyUtil my = new MyUtil();
		int sum = my.hap();
		
		//요청한 클라이언트에게 응답
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println(sum); //5050
		out.println("</body>");		
		out.println("</html>");
	}
}
