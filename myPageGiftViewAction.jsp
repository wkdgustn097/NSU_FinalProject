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
	int reserveSnackNo = Integer.parseInt(request.getParameter("reserveSnackNo"));
	int snackQty = Integer.parseInt(request.getParameter("snackQty"));
	String id= (String)session.getAttribute("sid");
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	if(id==null){
		id="Guest";
	}
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	String sql = "update gift set useGift=? where reserveSnackNo=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, "사용");
	pstmt.setInt(2, reserveSnackNo);
	pstmt.executeUpdate();
	
	String sql2 = "select * from usergrade where id=?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setString(1, id);
	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();
	int ticket = rs2.getInt(5);
	
	String sql3 = "update usergrade set ticket=? where id=?";
	PreparedStatement pstmt3 = con.prepareStatement(sql3);
	pstmt3.setInt(1, ticket+snackQty);
	pstmt3.setString(2, id);
	pstmt3.executeUpdate();
	
	
%>
<script>
	alert('관람권이 <%=snackQty%>장 등록되었습니다.');
	opener.history.go(0);
	location.href='myPageGiftView.jsp';

</script>
</body>
</html>