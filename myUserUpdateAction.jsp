<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	PrintWriter script = response.getWriter();
	String id=request.getParameter("id");
	String password = request.getParameter("password");
	String name =request.getParameter("name");
	String gender= request.getParameter("gender");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phone = phone1+"-"+phone2+"-"+phone3;
	String email= request.getParameter("email");
	String joomin1 =request.getParameter("joomin1");
	String joomin2 =request.getParameter("joomin2");
	String joomin=joomin1+"-"+joomin2;
	
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	try {
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		String sql="update user set password=?, name=?, gender=?, phone=?, email=?, joomin=? where id=?"; 
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, password);
		pstmt.setString(2, name);
		pstmt.setString(3, gender);
		pstmt.setString(4, phone);
		pstmt.setString(5, email);
		pstmt.setString(6,joomin);
		pstmt.setString(7, id);
		
		pstmt.executeUpdate();
	
		pstmt.close();
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<script>
	alert('변경이 완료 되었습니다.');
	location.href='myPageHome.jsp';
</script>
</body>
</html>