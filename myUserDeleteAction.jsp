<%@page import="java.io.PrintWriter"%>
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
        	String id= (String)session.getAttribute("sid");
	     	String dburl="jdbc:mysql://localhost:3306/movieStore";
	    	String dbid="root";
	    	String dbpassword="1234";
	    	
        	if(id==null){
        		id="Guest";
        	}
        	
        	if(id.equals("Guest")){
        		PrintWriter script = response.getWriter();
        		script.println("<script>");
        		script.println("alert('로그인이 필요한 서비스입니다.')");
        		script.println("location.href='login.jsp'");
        		script.println("</script>");
        	}
        	try {
        		Class.forName("org.gjt.mm.mysql.Driver");
        		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
        		String sql ="delete from user where id=?";
        		PreparedStatement pstmt = con.prepareStatement(sql);
        		pstmt.setString(1, id);
        		pstmt.executeUpdate();
        		
        		String sql2 = "delete from usergrade where id=?";
        		PreparedStatement pstmt2 = con.prepareStatement(sql2);
        		pstmt2.setString(1, id);
        		pstmt2.executeUpdate();
        		
        		session.invalidate();
        		
        	%>
        		<script>
        			alert('회원탈퇴가 완료되었습니다.');
        			location.href='index.jsp';
        		</script>
        	<% 	
        	}catch(Exception e){
        		e.printStackTrace();
        	}
        		
%>
</body>
</html>