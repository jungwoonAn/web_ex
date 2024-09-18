package kr.bit.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.bit.model.MemberDAO;
import kr.bit.model.MemberVO;

public class MemberListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		// POJO가 해야할 일의 범위
		// 1. Model연동
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = dao.memberList();
		// 2. 객체 바인딩
		request.setAttribute("list", list);
		
		// 3. 다음 페이지 정보(View - member/memberList.jsp) 리턴
//		return "/WEB-INF/member/memberList.jsp";
		return "memberList";
	}

}
