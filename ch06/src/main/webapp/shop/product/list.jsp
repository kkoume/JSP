<%@page import="dto.ProductDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "everybody24";
	String pass = "abc1234";

	List<ProductDTO> users = new ArrayList<>();
	
	try{
		// 1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경이름
				
		// 2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		// 3단계
		Statement stmt = conn.createStatement();
		
		// 4단계
		ResultSet rs = stmt.executeQuery("SELECT * FROM `Product`");
		
		// 5단계 (결과처리용 리스트포함)
		while(rs.next()){
			ProductDTO dto = new ProductDTO();
			dto.setProdNo(rs.getInt(1));
			dto.setProdName(rs.getString(2));
			dto.setStock(rs.getInt(3));
			dto.setPrice(rs.getInt(4));
			dto.setCompany(rs.getString(5));
			
			users.add(dto);
		}
		
		// 6단계
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>product::list</title>
	</head>
	<body>
		<h3>Product 목록</h3>
		
		<a href="../../2.DBCP.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>상품번호</th>
				<th>이름</th>
				<th>재고</th>
				<th>가격</th>
				<th>회사</th>
				<th>관리</th>
			</tr>
			<% for(ProductDTO dto : users){ %>
			<tr>
				<td><%= dto.getProdNo() %></td>
				<td><%= dto.getProdName() %></td>
				<td><%= dto.getStock() %></td>
				<td><%= dto.getPrice() %></td>
				<td><%= dto.getCompany() %></td>				
				<td>
					<a href="./modify.jsp?prodNo=<%= dto.getProdNo() %>">수정</a>
					<a href="./delete.jsp?prodNo=<%= dto.getProdNo() %>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>