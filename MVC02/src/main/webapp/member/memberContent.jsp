<%@page import="kr.bit.model.MemberVO"%>
<%@page import="kr.bit.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  int num = Integer.parseInt(request.getParameter("num"));

  MemberDAO dao = new MemberDAO();
  MemberVO vo = dao.memberContent(num);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>회원 정보</title>
</head>
<body>
  <form action="memberUpdate.jsp" method="post">
    <input type="hidden" name="num" value="<%= vo.getNum() %>">
    <table class="table table-bordered">
    <% if(vo != null) { %>
      <tr>
        <th colspan="2"><%= vo.getName() %> 회원의 상세보기</th>
      </tr>
      <tr>
        <td>번호</td>
        <td><%= vo.getNum() %></td>
      </tr>
      <tr>
        <td>아이디</td>
        <td><%= vo.getId() %></td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" name="pass" value="<%= vo.getPass() %>"></td>
      </tr>
      <tr>
        <td>이름</td>
        <td><%= vo.getName() %></td>
      </tr>
      <tr>
        <td>나이</td>
        <td><%= vo.getAge() %></td>
      </tr>
      <tr>
        <td>이메일</td>
        <td><input type="text" name="email" value="<%= vo.getEmail() %>"></td>
      </tr>
      <tr>
        <td>전화번호</td>
        <td><input type="text" name="phone" value="<%= vo.getPhone() %>"></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <button type="submit" class="btn btn-danger">수정</button>
          <button type="reset" class="btn btn-warning">취소</button>
        </td>
      </tr>
    <% }else { %>
      <tr>
        <td>일치하는 회원이 없습니다.</td>
      </tr>
    <% } %>
    </table>  
  </form>

</body>
</html>