<%@page import="kr.bit.model.MemberDAO"%>
<%@page import="kr.bit.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
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

  if(cnt > 0) {
	// 수정성공
	response.sendRedirect("memberList.jsp");
  }else {
	// 수정실패 -> 예외객체를 만들어서 WAS에 던지자.
	throw new ServletException("not update");
  }
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>