<%@page import="kr.bit.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
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
  function deleteFn(num){
	  location.href="${ctx}/memberDelete.do?num="+num;
  }
  
  function btnClick(){
	  $.ajax({
		  url: "<c:url value='/memberAjaxList.do' />",
		  type: "get",
		  dataType: "json",
		  success: resultHtml,
		  error: () => alert("error")
	  })
  }
  
  function resultHtml(data){
	  console.log(data)
	  let html='<table class="table table-bordered">';
	  html+='<thead>';
	  html+='<tr>';
	  html+='<th>번호</th>';
	  html+='<th>아이디</th>';
	  html+='<th>비밀번호</th>';
	  html+='<th>이름</th>';
	  html+='<th>나이</th>';
	  html+='<th>이메일</th>';
	  html+='<th>전화번호</th>';
	  html+='</tr>';     
	  html+='</thead>';
	  html+='<tbody>';	  
	  $.each(data, function(i, obj){
		  html+='<tr>';
		  html+='<td>'+obj.num+'</td>';
		  html+='<td>'+obj.id+'</td>';
		  html+='<td>'+obj.pass+'</td>';
		  html+='<td>'+obj.name+'</td>';
		  html+='<td>'+obj.age+'</td>';
		  html+='<td>'+obj.email+'</td>';
		  html+='<td>'+obj.phone+'</td>';
		  html+='</tr>';
	  })	   
	  html+='</tbody>';
	  html+='</table>';
	  $('#list').html(html);
  }
</script>
<title>회원 목록</title>
</head>
<body>
[SpringMVC02]
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
	    <c:forEach var="vo" items="${list}">
          <tr>
            <td>${vo.num}</td>
            <td><a href="${ctx}/memberContent.do?num=${vo.num}">${vo.id}</a></td>
            <td>${vo.pass}</td>
            <td>${vo.name}</td>
            <td>${vo.age}</td>
            <td>${vo.email}</td>
            <td>${vo.phone}</td>
            <td><button onclick="deleteFn(${vo.num})" class="btn btn-danger">삭제</button></td>
          </tr>
        </c:forEach> 
    </tbody>
    <tr>
      <td colspan="8" class="text-end">
        <button class="btn btn-primary" onclick="location.href='${ctx}/memberRegister.do'">회원가입</button>
      </td>
    </tr>       
    <tr>
      <td colspan="8">
      	<button type="button" class="btn btn-success" id="btn" onclick="btnClick()">Ajax로 회원리스트 보기</button>
      </td>
    </tr>
  </table>
  <div id="list">여기에 회원리스트 출력</div>

</body>
</html>