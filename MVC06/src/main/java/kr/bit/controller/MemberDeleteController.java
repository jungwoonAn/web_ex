package kr.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.bit.model.MemberDAO;

public class MemberDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String ctx = request.getContextPath(); // /MVC06
		
		//http://localhost:8081/MVC06/memberDelete.do?num=5
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.memberDelete(num);
		String nextPage = null;
		
		if(cnt>0) {
			request.getSession().invalidate();  // 삭제버튼 클릭하면 세션 끊기
			nextPage = "redirect:"+ctx+"/memberList.do";
		}else {
			// 삭제실패 -> 예외객체를 만들어서 WAS에 던지자.
			throw new ServletException("not delete");
		}
		
		return nextPage;
	}

}
