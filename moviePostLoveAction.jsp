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
		request.setCharacterEncoding("UTF-8");
		int no = Integer.parseInt(request.getParameter("no"));
		
		String dburl="jdbc:mysql://localhost:3306/movieStore";
    	String dbid="root";
    	String dbpassword="1234";
    	Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		
		String sql = "select love from moviepost where no = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,no);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int love = rs.getInt(1);
		
		String sql2="update moviepost set love=? where no =?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setInt(1, love+1);
		pstmt2.setInt(2, no);
		pstmt2.executeUpdate();
		
		pstmt2.close();
		rs.close();
		pstmt.close();
		con.close();
	%>
	<script>
		location.href=document.referrer;
	</script>
</body>
</html>