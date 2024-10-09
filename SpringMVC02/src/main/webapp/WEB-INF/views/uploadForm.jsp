<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript">
  function file_add(){
	  let cnt=1;
	  $('#d_file').append('<br><input type="file" name="file'+cnt+'"><br>');
	  cnt++
  }
</script>
</head>
<body>
  <div class="container">
    <h2>다중 파일 업로드</h2>
    <div class="card">
	  <div class="card-header">스프링을 이용한 다중 파일 업로드 구현</div>
	  <div class="card-body">
	    <form action="<c:url value='/upload.do' />" enctype="multipart/form-data" method="post">
		  <div class="mb-3 row">
		    <label for="id" class="form-label col-sm-2 text-end">아이디 : </label>		    
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="id" name="id" placeholder="Enter id" >
		    </div>
		  </div>
		  <div class="mb-3 row">
		    <label for="name" class="form-label col-sm-2 text-end">이름 : </label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="name" name="name" placeholder="Enter name" >
		    </div>
		  </div>
		  <div class="mb-3 row">
		    <label for="name" class="form-label col-sm-2 text-end">첨부파일 : </label>
		    <div class="col-sm-10">
		      <button type="button" class="btn btn-outline-success" onclick="file_add()">파일 추가</button>
		    </div>
		    <div id="d_file"></div>
		  </div>
		  <button type="submit" class="btn btn-primary">업로드</button>
		</form>
	  </div>
	  <div class="card-footer text-body-secondary">화이팅~!</div>
	</div>
  </div>

</body>
</html>