<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script>
  function add(){
	document.form1.action="<c:url value='/memberInsert.do' />" 
	document.form1.submit();
  }
  
  function frmreset(){
	  document.form1.reset();
  }
</script>
</head>
<body>
  <div class="container"> 
	<h2>회원가입 화면</h2>
	<div class="card">
      <div class="card-header">
        <c:if test="${sessionScope.userId != null && scssionScope.userId != ''}">
	      <label>${sessionScope.userName}님이 로그인 하셨습니다.</label>
	    </c:if>
	    <c:if test="${sessionScope.userId == null || scssionScope.userId == ''}">
	      <label>안녕하세요~</label>
	    </c:if>
      </div>
      <div class="card-body">
        <form id="form1" name="form1" class="form-horizontal" method="post">
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">아이디 : </label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" style="width:50%">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">비밀번호 : </label>
	          <div class="col-sm-10">
	            <input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호를 입력하세요" style="width:50%">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">이름 : </label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요" style="width:50%">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">나이 : </label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="age" name="age" placeholder="나이를 입력하세요" style="width:50%">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">이메일 : </label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" style="width:50%">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">전화번호 : </label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요" style="width:50%">
	          </div>
	        </div>
		</form>  
      </div>
      <div class="card-footer text-center">
        <button type="button" class="btn btn-primary" onclick="add()">가입</button>
		<button type="button" class="btn btn-warning" onclick="frmreset()">취소</button>
		<button type="button" onclick="location.href='${ctx}/memberList.do'" class="btn btn-success">리스트</button>
      </div>
    </div>
  </div>
</body>
</html>