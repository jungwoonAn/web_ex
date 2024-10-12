<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.0.0/css/all.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript">
  function getfile(filename){
	  location.href="<c:url value='/download.do' />?filename=" + filename;
  }
</script>
</head>
<body>
  <div class="container">
    <h2>업로드가 완료되었습니다.</h2>
    <div class="card">
      <div class="card-header">스프링을 이용한 다중 파일 업로드 구현</div>
      <div class="card-body"> 
        <table class="table table-bordered table-hover">
          <tr>
            <td>아이디</td>
            <td>${map.id}</td>
          </tr>
          <tr>
            <td>이름</td>
            <td>${map.name}</td>
          </tr>
          <c:forEach var="fName" items="#{map.fileList}">
            <tr>
              <td>${fName}</td>
              <td><a href="javascript:getfile('${fName}')"><i class="fa-solid fa-file"></i></a></td>
            </tr>
          </c:forEach>
          <tr>
            <td colspan="2" class="text-center">
              <a href="<c:url value='/form.do'/>">다시 업로드 하기</a>
            </td>
          </tr>
        </table>   
      </div>
      <div class="card-footer">화이팅~!</div>
    </div>
  </div>  
</body>
</html>