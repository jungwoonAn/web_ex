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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
  
  function add2(){
	  if($('#file').val() != ''){  // 파일이 첨부된 경우
		  var formData = new FormData();
		  formData.append('file', $('input[name=file]')[0].files[0]);
		  
		  $.ajax({
			  url: "<c:url value='/fileAdd.do' />",
			  method: "post",
			  data: formData,
			  processData: false,
			  contentType: false,
			  success: function(data){  // data: 업로드된 실제 파일 이름
				  // alert(data);
				  $('#filename').val(data);
			  	  document.form1.action="<c:url value='/memberInsert.do' />?mode=fadd";
			  	  document.form1.submit();  // id, pass, name, age, email, phone, filename
			  },
			  error: function(){alert('error');}
		  });
	  }else {  // 파일이 첨부되지 않은 경우
		  document.form1.action="<c:url value='/memberInsert.do' />?mode=add";
	  	  document.form1.submit();  // id, pass, name, age, email, phone
	  }
	  
  }
  
  function frmreset(){
	  document.form1.reset();
  }
  
  function doublecheck(){
	  console.log($('#id'))
	  if($('#id').val() == ''){		  
		  alert('아이디를 입력하세요.');
		  $('#id').focus();
		  //return;
	  }else {
		  var id = $('#id').val();

		  $.ajax({
			  url: "<c:url value='/memberDbcheck.do'/>",
			  method: "post",
			  data: {"id": id},
			  success: dbCheck, // 함수(callback)
			  error: function(){alert('error');}
		  });
	  }	  
  }
  // response.getWriter().print(dbDouble)
  function dbCheck(data){
	  console.log(data);
	  if(data == 'yes'){
		  alert('중복된 아이디 입니다.');
		  $('#id').focus();
	  }else {
		  alert('사용가능한 아이디 입니다.');
		  $('#id').focus();
	  }
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
	          <label class="col-form-label col-sm-2" for="id">아이디 : </label>
	          <div class="col-sm-5">
	            <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
	          </div>
	          <div class="col-sm-2">
	            <button class="btn btn-sm btn-danger" onclick="doublecheck();return false;">중복체크</button>
	          </div>
	          
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2" for="pass">비밀번호 : </label>
	          <div class="col-sm-5">
	            <input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호를 입력하세요">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2" for="name">이름 : </label>
	          <div class="col-sm-5">
	            <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2" for="age">나이 : </label>
	          <div class="col-sm-5">
	            <input type="text" class="form-control" id="age" name="age" placeholder="나이를 입력하세요">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2" for="email">이메일 : </label>
	          <div class="col-sm-5">
	            <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2" for="phone">전화번호 : </label>
	          <div class="col-sm-5">
	            <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요">
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label class="col-form-label col-sm-2">첨부파일 : </label>
	          <div class="col-sm-5">
	            <input type="file" class="form-control" id="file" name="file">
	            <input type="hidden" class="form-control" id="filename" name="filename" value="">
	          </div>
	        </div>
		</form>  
      </div>
      <div class="card-footer text-center">
        <c:if test="${sessionScope.userId==null || sessionScope.userId==''}">
          <button type="button" class="btn btn-primary" onclick="add2()">가입</button>
        </c:if>
        <c:if test="${sessionScope.userId!=null && sessionScope.userId!=''}">
          <button type="button" class="btn btn-primary" onclick="add()" disabled>가입</button>
        </c:if>
		<button type="button" class="btn btn-warning" onclick="frmreset()">취소</button>
		<button type="button" onclick="location.href='${ctx}/memberList.do'" class="btn btn-success">리스트</button>
      </div>
    </div>
  </div>
</body>
</html>