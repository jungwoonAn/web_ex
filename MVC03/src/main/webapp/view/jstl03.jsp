<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cnt" value="7" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${cnt%2==0}">
		짝수입니다.
	</c:when>
	<c:when test="${cnt%2!=0}">
		홀수입니다.
	</c:when>
</c:choose>
</body>
</html>