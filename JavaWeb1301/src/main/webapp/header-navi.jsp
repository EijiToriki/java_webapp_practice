<%@ page pageEncoding="UTF-8"%>

<h1>セッションスコープテスト</h1>
<hr>
	<%-- ユーザIDの表示 --%>
	<%
		String userId = (String) session.getAttribute("userId");
		if(userId == null){
			request.setAttribute("errorMsg", "再ログインをお願いします。");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}else{
	%>
			ユーザID：<%=userId%>
	<%
		}
	%>
<hr>
	<a href="first.jsp">第１画面</a> | <a href="second.jsp">第２画面</a> | <a href="logout-servlet">ログアウト</a>
<hr>