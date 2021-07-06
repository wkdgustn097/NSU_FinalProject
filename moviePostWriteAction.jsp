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
	request.setCharacterEncoding("UTF-8");

	PrintWriter script = response.getWriter();
	String id= (String)session.getAttribute("sid");
	if(id==null){
		id="Guest";
	}
	if(id.equals("Guest")){
		
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스입니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}

	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	String movieTitle = request.getParameter("movieTitle");
	String postImg = request.getParameter("postImg");
	String summary = request.getParameter("summary");
	int count=0;
	
	String sql2 = "select now()";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();
	String time = rs2.getString(1);
	
	String sql = "insert into moviePost values(null,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, movieTitle);
	pstmt.setString(3, postImg);
	pstmt.setString(4, summary);
	pstmt.setInt(5, 0);
	pstmt.setString(6, time);
	pstmt.executeUpdate();
	
	String sql3 = "select * from moviePostCount where movieTitle=?";
	PreparedStatement pstmt3 = con.prepareStatement(sql3);
	pstmt3.setString(1, movieTitle);
	ResultSet rs3 = pstmt3.executeQuery();
	if(rs3.next()){
	count=rs3.getInt(3);
	}
	if(count==0){ ////새로운 레코드 추가
		String sql4 = "insert into moviePostCount values(null,?,?)";
		PreparedStatement pstmt4 = con.prepareStatement(sql4);
		pstmt4.setString(1, movieTitle);
		pstmt4.setInt(2, 1);
		pstmt4.executeUpdate();
	}else{ ////+1업데이트
		
		String sql5 = "update moviePostCount set count=? where movieTitle=?";
		PreparedStatement pstmt5 = con.prepareStatement(sql5);
		pstmt5.setInt(1,count+1);
		pstmt5.setString(2, movieTitle);
		pstmt5.executeUpdate();
	}
	
	
	
	//////이벤트 포인트500포인트 증가///////////
	
	String sql6 = "select * from userGrade where id=?";
	PreparedStatement pstmt6 = con.prepareStatement(sql6);
	pstmt6.setString(1, id);
	ResultSet rs6 = pstmt6.executeQuery();
	rs6.next();
	int point = rs6.getInt(3);
	
	String sql7 = "update usergrade set point=? where id=?";
	PreparedStatement pstmt7 = con.prepareStatement(sql7);
	pstmt7.setInt(1, point+500);
	pstmt7.setString(2, id);
	pstmt7.executeUpdate();
	
		
		
		
	%>
		<script>
			alert('등록이 완료 되었습니다.  [이벤트]500Point를 획득하였습니다.');
			location.href='moviePost.jsp';
		</script>
	<% 	
		
	
%>
</body>
</html>