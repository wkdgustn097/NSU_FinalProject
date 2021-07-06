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

try {
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	String sql="select summary from movieAfter where movieID=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1,movieID);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		
		summary = rs.getString(1);
		
	}
	
}catch(Exception e){
	e.printStackTrace();
}
	
%>

<%=summary %>
</body>
</html>