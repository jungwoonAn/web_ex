package kr.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.bit.model.MemberDAO;
import kr.bit.model.MemberVO;

public class MemberUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String ctx = request.getContextPath();
		
		//파라미터 수집(VO)
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		MemberVO vo = new MemberVO();
		vo.setNum(num);
		vo.setPass(pass);
		vo.setEmail(email);
		vo.setPhone(phone);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.memberUpdate(vo);
		String nextPage = null;
		
		if(cnt > 0) {
			// 수정성공
			nextPage = "redirect:"+ctx+"/memberList.do";
		}else {
			// 수정실패 -> 예외객체를 만들어서 WAS에 던지자.
			throw new ServletException("not update");
		}
		
		return nextPage;
	}

}
