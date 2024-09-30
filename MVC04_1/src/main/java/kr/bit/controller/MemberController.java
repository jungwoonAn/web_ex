package kr.bit.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.bit.model.MemberDAO;
import kr.bit.model.MemberVO;

// 6개의 POJO가 해야할 일들을 --> 1개의 POJO
public class MemberController {  // implements Controller(X)
	
	// MemberListController
	@RequestMapping("/memberList.do")
	public String memberList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		// POJO가 해야할 일의 범위
		// 1. Model연동
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = dao.memberList();
		// 2. 객체 바인딩
		request.setAttribute("list", list);
		
		// 3. 다음 페이지 정보(View - member/memberList.jsp) 리턴
//			return "/WEB-INF/member/memberList.jsp";
		return "memberList";
	}
		
	// MemberInsertController
	@RequestMapping("/memberInsert.do")
	public String memberInsert(HttpServletRequest request, HttpServletResponse response)
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
		
	// MemberRegisterController
	@RequestMapping("/memberRegister.do")
	public String memberRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//			return "/WEB-INF/member/memberRegister.jsp";
		return "memberRegister";
	}			
		
	// MemberContentController
	@RequestMapping("/memberContent.do")
	public String memberContent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//http://localhost:8081/MVC04/memberContent.do?num=1
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.memberContent(num);
		
		//객체 바인딩
		request.setAttribute("vo", vo);
		
//		return "/WEB-INF/member/memberContent.jsp";
		return "memberContent";
	}
	
	// MemberUpdateController
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(HttpServletRequest request, HttpServletResponse response)
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
	
	// MemberDeleteController
	@RequestMapping("/memberDelete.do")
	public String memberDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String ctx = request.getContextPath(); // /MVC04
		
		//http://localhost:8081/MVC04/memberDelete.do?num=5
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.memberDelete(num);
		String nextPage = null;
		
		if(cnt>0) {
			nextPage = "redirect:"+ctx+"/memberList.do";
		}else {
			// 삭제실패 -> 예외객체를 만들어서 WAS에 던지자.
			throw new ServletException("not delete");
		}
		
		return nextPage;
	}		

}
