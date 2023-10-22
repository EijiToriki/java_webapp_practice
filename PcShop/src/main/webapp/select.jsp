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
<title>商品選択</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@include file = "header-navi.jsp" %>
	
	<%
		List<Product> product_list;
		Store store = (Store) session.getAttribute("store");
		if(store == null){
			product_list = new ArrayList<Product>();
		}else{
			product_list = store.getProductList();
		}
		
		if(product_list.size() > 0){
	%>
	
			<h2>商品選択</h2>
			<table class="select-list">
			<tr>
				<th></th><th>商品ID</th><th>商品名</th><th>価格</th>
			</tr>
			
		<%
			for(int idx=0; idx < product_list.size(); idx++){
				Product prod = product_list.get(idx);
		%>
				<tr>
					<td>
						<form action="add-prod-servlet" method="POST">
							<input type="hidden" name="idx" value="<%=idx%>">
							<input type="submit" value="選択">
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
	<%
		}
	%>

</body>
</html>