<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.web.util.*" %>
<%
    //JSP에서 java코드 작성
	int sum = 0;
	for(int i=1; i<=10; i++){
		sum += i;
	}
	
	//비즈니스 로직 분리
	MyUtil my = new MyUtil();
	int sum2 = my.hap();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
  <table border="1">
    <tr>
      <td>1~10까지의 총합</td>
      <td><%= sum %></td>
    </tr>
    <tr>
      <td>1~100까지의 총합</td>
      <td><%= sum2 %></td>
    </tr>
  </table>

</body>
</html>