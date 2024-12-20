<%@page import="kr.bit.model.MemberVO"%>
<%@page import="kr.bit.model.MemberDAO"%>
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
<script>
  function update(){
	  document.form1.action = "<c:url value='/memberUpdate.do' />";
	  document.form1.submit();
  }
  
  function frmreset(){
	  document.form1.reset();
  }
</script>
<title>회원 정보</title>
</head>
<body>
  <div class="container"> 
    <h2>상세 화면</h2>   
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
            <input type="hidden" name="num" value="${vo.num}">
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">번호 : </label>
	          <div class="col-sm-10">
	            <c:out value="${vo.num}" />
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">아이디 : </label>
	          <div class="col-sm-10">
	            <c:out value="${vo.id}" />
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">비밀번호 : </label>
	          <div class="col-sm-10">
	            <input type="password" class="form-control" id="pass" name="pass" value="${vo.pass}" style="width:50%">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">이름 : </label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="name" name="name" value="${vo.name}" style="width:50%">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">나이 : </label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="age" name="age" value="${vo.age}" style="width:50%">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">이메일 : </label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="email" name="email" value="${vo.email}" style="width:50%">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">전화번호 : </label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="phone" name="phone" value="${vo.phone}" style="width:50%">
	          </div>
	        </div>
		</form>  
	  </div>
	  <div class="card-footer text-center">
	    <c:if test="${!empty sessionScope.userId}">
	      <c:if test="${sessionScope.userId == vo.id}">
	        <button type="button" class="btn btn-danger" onclick="update()">수정</button>	      
	      </c:if>
	      <c:if test="${sessionScope.userId != vo.id}">
	        <button type="button" class="btn btn-danger" onclick="update()" disabled>수정</button>	      
	      </c:if>
	    </c:if>	    
		<button type="button" class="btn btn-warning" onclick="frmreset()">취소</button>
		<button type="button" onclick="location.href='${ctx}/memberList.do'" class="btn btn-primary">리스트</button>
	  </div>
    </div>
  </div>
</body>
</html>