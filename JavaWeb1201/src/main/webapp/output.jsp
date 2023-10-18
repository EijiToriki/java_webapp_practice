<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP出力</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h2>入力内容</h2>
	
	<%
		@SuppressWarnings("unchecked")
		List<String> infoList = (List<String>) request.getAttribute("infoList");
		for (String info : infoList){
	%>
			<%= info %><br><br>
	<%
		}
	%>
	<br><a href="input.html">入力フォームへ</a>
	<br><br><br>----JSPで出力しています----

</body>
</html>