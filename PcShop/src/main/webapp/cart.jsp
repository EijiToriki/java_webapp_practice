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
<title>カート画面</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@include file = "header-navi.jsp" %>
	
	<h2>カート内一覧</h2>
	
	<%
		List<Product> product_list;
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart == null){
			product_list = new ArrayList<Product>();
		}else{
			product_list = cart.getProductList();
		}
		
		if(product_list.size() > 0){
	%>
	
			<table class="cart-list">
			<tr>
				<th></th><th>商品ID</th><th>商品名</th><th>価格</th>
			</tr>
			
		<%
			for(int idx=0; idx < product_list.size(); idx++){
				Product prod = product_list.get(idx);
		%>
				<tr>
					<td>
						<form action="remove-prod-servlet" method="POST">
							<input type="hidden" name="idx" value="<%=idx%>">
							<input type="submit" value="削除">
						</form>
					</td>
					<td><%=prod.getId() %></td>
					<td><%=prod.getName() %></td>
					<td><%=prod.getPriceString() %></td>
				</tr>
			<%
				}
			%>			
			</table>
			<br>
			<form action="pay-servlet" method="POST">
				<input type="submit" value="精算"><br>
			</form>
	<%
		}else{
	%>
			<p>カートの仲は空です。</p>
	<%
		}
	%>

</body>
</html>