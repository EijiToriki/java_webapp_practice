<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page import="model.Product"%>
<%@ page import="model.Store"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>精算完了</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@include file = "header-navi.jsp" %>
	
	<h2>精算完了</h2>
	<p>お買い上げありがとうございました。</p>
	
	<%
		List<Product> product_list;
		Cart payData = (Cart) session.getAttribute("pay");
		if(payData == null){
			product_list = new ArrayList<Product>();
		}else{
			product_list = payData.getProductList();
		}
		
		if(product_list.size() > 0){
	%>
	
			<table class="pay-list">
			<tr>
				<th>商品ID</th><th>商品名</th><th>価格</th>
			</tr>
			
		<%
			for(Product prod : product_list){
		%>
				<tr>
					<td><%=prod.getId() %></td>
					<td><%=prod.getName() %></td>
					<td><%=prod.getPriceString() %></td>
				</tr>
			<%
				}
			%>			
			</table>
			<p>合計：<%=payData.getStringTotalPrice() %>になります。</p>
	<%
			session.removeAttribute("pay");	
		}else{
	%>
			<p>カートの仲は空です。</p>
	<%
		}
	%>

</body>
</html>