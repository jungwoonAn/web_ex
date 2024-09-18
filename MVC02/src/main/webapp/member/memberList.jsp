<%@page import="kr.bit.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.bit.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 클라이언트의 요청 받기(memberList.do)
	// 2. 회원전체 리스트 가져오기(Model연동)
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> list = dao.memberList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript">
  function deleteFn(num){
	  location.href="memberDelete.jsp?num="+num;
  }
</script>
<title>회원 목록</title>
</head>
<body>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>번호</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>나이</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>삭제</th>
      </tr>      
    </thead>
    <tbody>
    <% for(MemberVO vo : list) { %>
          <tr>
            <td><%= vo.getNum() %></td>
            <td><a href="memberContent.jsp?num=<%= vo.getNum() %>"><%= vo.getId() %></a></td>
            <td><%= vo.getPass() %></td>
            <td><%= vo.getName() %></td>
            <td><%= vo.getAge() %></td>
            <td><%= vo.getEmail() %></td>
            <td><%= vo.getPhone() %></td>
            <td><button onclick="deleteFn(<%= vo.getNum() %>)" class="btn btn-danger">삭제</button></td>
          </tr>  
	<%	} %>
    </tbody>
    <tr>
      <td colspan="8" class="text-end">
        <button class="btn btn-primary" onclick="location.href='memberRegister.html'">회원가입</button>
      </td>
    </tr> 
  </table>

</body>
</html>