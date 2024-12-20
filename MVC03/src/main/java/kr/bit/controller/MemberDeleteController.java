package kr.bit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.bit.model.MemberDAO;

@WebServlet("/memberDelete.do")
public class MemberDeleteController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//http://localhost:8081/MVC03/memberDelete.do?num=5
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.memberDelete(num);
		if(cnt>0) {
			response.sendRedirect("/MVC03/memberList.do");
		}else {
			// 삭제실패 -> 예외객체를 만들어서 WAS에 던지자.
			throw new ServletException("not delete");
		}
	}

}
