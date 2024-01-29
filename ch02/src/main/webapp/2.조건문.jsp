<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2.조건문</title>
		<!-- 
			날짜 : 2024/01/29
			이름 : 조영흥
			내용 : ch02.JSP 기본
		 -->
	</head>
	<body>
		<h3>2.조건문</h3>
		
		<h4>if</h4>
		<%
			int num1 = 1;
			
			if(num1 > 0){
				out.println("<p>num1은 0보다 크다.</p>");
			}
		%>
		
		<h4>if ~ else</h4>
		<%
			int var1 = 1, var2 = 2;
			
			if(var1 > var2){
		%>
			<p>var1이 var2보다 크다.</p>
		<%
			} else {
		%>
			<p>var1이 var2보다 작다.</p>
		<%
			}
		%>
		
		<h4>if ~ else if ~ else</h4>
		<%	int n1 = 1, n2 = 2, n3 = 3, n4 = 4;	%>
		<% if(n1 > n2) { %>
			<p>n1이 n2 보다 크다.</p>
		<% } else if(n2 > n3) { %>
			<p>n2가 n3 보다 크다.</p>
		<% } else if(n3 > n4) { %>
			<p>n3가 n4 보다 크다.</p>
		<% } else { %>
			<p>n4가 가장 크다.</p>
		<% } %>
		
	</body>
</html>