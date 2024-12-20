<%@page import="kr.bit.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	//MemberVO vo = (MemberVO)request.getAttribute("vo");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
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
  <form action="${ctx}/memberUpdate.do" method="post">
    <input type="hidden" name="num" value="${vo.num}">
    <table class="table table-bordered">
    <c:if test="${vo != null}">
      <tr>
        <th colspan="2">${vo.num} 회원의 상세보기</th>
      </tr>
      <tr>
        <td>번호</td>
        <td>${vo.num}</td>
      </tr>
      <tr>
        <td>아이디</td>
        <td>${vo.id}</td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" name="pass" value="${vo.pass}"></td>
      </tr>
      <tr>
        <td>이름</td>
        <td>${vo.name}</td>
      </tr>
      <tr>
        <td>나이</td>
        <td>${vo.age}</td>
      </tr>
      <tr>
        <td>이메일</td>
        <td><input type="text" name="email" value="${vo.email}"></td>
      </tr>
      <tr>
        <td>전화번호</td>
        <td><input type="text" name="phone" value="${vo.phone}"></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <button type="submit" class="btn btn-danger">수정</button>
          <button type="reset" class="btn btn-warning">취소</button>
          <button type="button" onclick="location.href='${ctx}/memberList.do'" class="btn btn-primary">리스트</button>
        </td>
      </tr>
    </c:if>
    </table>  
  </form>

</body>
</html>