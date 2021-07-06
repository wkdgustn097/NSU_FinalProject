<%@page import="java.sql.*"%>
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
int  movieID =Integer.parseInt(request.getParameter("movieID"));
String summary="";
String dburl="jdbc:mysql://localhost:3306/movieStore";
String dbid="root";
String dbpassword="1234";

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	String sql = "select love from movieafter where movieID=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, movieID);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int cnt = rs.getInt(1);
	
	String sql2="update movieafter set love=? where movieID=?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setInt(1, cnt+1);
	pstmt2.setInt(2, movieID);
	pstmt2.executeUpdate();
	

%>
<script>
	location.href=document.referrer;
	
</script>
</body>
</html>