package kr.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.bit.model.MemberDAO;
import kr.bit.model.MemberVO;

public class MemberContentController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//http://localhost:8081/MVC05/memberContent.do?num=1
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.memberContent(num);
		
		//객체 바인딩
		request.setAttribute("vo", vo);
		
//		return "/WEB-INF/member/memberContent.jsp";
		return "memberContent";
	}

}
