package kr.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.bit.model.MemberDAO;
import kr.bit.model.MemberVO;

public class MemberInsertController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String ctx = request.getContextPath();
		
		// 1. 파라미터 수집(VO)
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
					
		MemberVO vo = new MemberVO(id, pass, name, age, email, phone);
					
		//Model과 연동부분
		MemberDAO dao = new MemberDAO();
		int cnt = dao.memberInsert(vo);
		String nextPage = null;
		
		if(cnt > 0) {
			// 가입성공
			// 다시 회원리스트 보기로 이동
			nextPage = "redirect:"+ctx+"/memberList.do";
		}else {
			// 가입실패 -> 예외객체를 만들어서 WAS에 던지자.
			throw new ServletException("not insert");
		}
		
		return nextPage;
	}

}
