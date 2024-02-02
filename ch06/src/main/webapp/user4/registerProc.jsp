<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	
	System.out.println("uid : " + uid);
	System.out.println("name : " + name);
	System.out.println("gender : " + gender);
	System.out.println("age : " + age);
	System.out.println("hp : " + hp);
	System.out.println("addr : " + addr);
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "everybody24";
	String pass = "abc1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "INSERT INTO `User4` VALUES (?,?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, gender);
		psmt.setString(4, age);
		psmt.setString(5, hp);
		psmt.setString(6, addr);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
	
%>