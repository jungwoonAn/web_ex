<%@page import="kr.bit.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.bit.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ArrayList<MemberVO> list = (ArrayList<MemberVO>)request.getAttribute("list");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript">
  $(function(){
	  <c:if test="${!empty msg}">
	  	alert("${msg}");
	  	<c:remove var="msg" scope="session" />
	  </c:if>
  });
  function deleteFn(num){
	  location.href="${ctx}/memberDelete.do?num="+num;
  }
  
  function check(){
	  if($('#user_id').val() == ''){
		  alert("아이디를 입력해주세요");
		  return false;
	  }else if($('#password').val() == '') {
		  alert("비밀번호를 입력해주세요");
		  return false;
	  }else {
		  return true;
	  }
  }
  
  function logout(){
	  location.href="<c:url value='/memberLogout.do' />"  // /MVC06/memberLogout.do
  }
</script>
<title>회원 목록</title>
</head>
<body>
<div class="container">
  <h2>회원관리 시스템</h2>
  <div class="card">
    <div class="card-header">
      <c:if test="${sessionScope.userId == null || sessionScope.userId == ''}">
	      <form class="row  align-items-center" action="${ctx}/memberLogin.do" method="post">
	        <div class="col-auto">
	          <label for="user_id" class="text-end">ID</label>
	        </div>
	        <div class="col-auto">
	          <input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID">
	        </div>
	        <div class="col-auto">
	          <label for="password">Password</label>
	        </div>
	        <div class="col-auto">
	          <input type="password" class="form-control" id="password" name="password" placeholder="Password">
	        </div>
	        <div class="col-auto">
	          <button type="submit" class="btn btn-primary" onclick="return check()">로그인</button>
	        </div>
	      </form>
      </c:if>
      <c:if test="${sessionScope.userId != null && sessionScope.userId != ''}">
        ${sessionScope.userName}님 환영합니다.
        <button type="button" class="btn btn-warning" onclick="logout()">로그아웃</button>
      </c:if>
    </div>
    <div class="card-body">
      <div class="table-responsive">
	      <table class="table table-bordered table-hover">
		    <thead class="table-light">
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
			    <c:forEach var="vo" items="${list}">
		          <tr>
		            <td>${vo.num}</td>
		            <td><a href="${ctx}/memberContent.do?num=${vo.num}">${vo.id}</a></td>
		            <td>${vo.pass}</td>
		            <td>${vo.name}</td>
		            <td>${vo.age}</td>
		            <td>${vo.email}</td>
		            <td>${vo.phone}</td>
		            <c:if test="${sessionScope.userId == vo.id}">		            
		              <td><button onclick="deleteFn(${vo.num})" class="btn btn-danger">삭제</button></td>
		            </c:if>
		            <c:if test="${sessionScope.userId != vo.id}">	
		              <td><button onclick="deleteFn(${vo.num})" class="btn btn-danger" disabled="disabled">삭제</button></td>
		            </c:if>
		          </tr>
		        </c:forEach> 
		    </tbody>
		    <tfoot>
		      <tr>
		        <td colspan="8">
		          <c:if test="${sessionScope.userId == null || sessionScope.userId == ''}">		            
		            <button class="btn btn-primary" onclick="location.href='${ctx}/memberRegister.do'">회원가입</button>
		          </c:if>
		          <c:if test="${sessionScope.userId != null && sessionScope.userId != ''}">
		            <button class="btn btn-primary" onclick="location.href='${ctx}/memberRegister.do'" disabled>회원가입</button>
		          </c:if>
		        </td>
		      </tr> 
		    </tfoot>		    
		  </table>
	  </div>
    </div>
    <div class="card-footer">
      회원관리 ERP System(admin@example.com)
    </div>
  </div>  
</div>
</body>
</html>