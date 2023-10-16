<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSPページ</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<!-- htmlでコメント -->
	<h2>JSPでループ</h2>
	
	<%-- forループテスト（JSPコメント） --%>
	<%
		// Javaコメント
		for (int i=1; i<=10; i++){
	%>
		こんにちは -- JSP表示：<%= i %> 行目 -- <br><br>
	<%
		}
	%>
</body>
</html>