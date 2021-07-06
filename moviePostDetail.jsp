<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<script language="javascript" src="javascript/movie.js"></script>
<link rel="stylesheet" type="text/css" href="css/movie.css">
<link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	function goReserve(a){
		window.close();
		opener.location.href='reserveMain.jsp?movieID='+a;
		opener.console.log(a);
	}
</script>
<title>무비포스트 상세</title>
</head>
<style>
 body{
 	background: white;
 }
 .wrap{
 	background: white;
 }
</style>
<body>
	<%
		String id= (String)session.getAttribute("sid");
		if(id==null){
			id="Guest";
		}
	

		request.setCharacterEncoding("UTF-8");
		int no = Integer.parseInt(request.getParameter("no"));
		
		String dburl="jdbc:mysql://localhost:3306/movieStore";
		String dbid="root";
		String dbpassword="1234";
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		
		String sql = "select * from moviePost where no = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		String m_id= rs.getString(2);
		String movieTitle = rs.getString(3);
		String steelImg = rs.getString(4);
		String summary = rs.getString(5);
		int love = rs.getInt(6);
		String time = rs.getString(7);
		
		String sql2 = "select movieID from movie where movieTitle=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setString(1, movieTitle);
		ResultSet rs2 = pstmt2.executeQuery();
		rs2.next();
		int movieID = rs2.getInt(1);
		
		int repleCtn=0;
		String sql4 = "select count(*) from moviepostreple where moviePost_no=?";
		PreparedStatement pstmt4 = con.prepareStatement(sql4);
		pstmt4.setInt(1, no);
		ResultSet rs4 = pstmt4.executeQuery();
		if(rs4.next()){
			repleCtn = rs4.getInt(1);
		}
		
		String sql3 = "select * from moviePostReple where moviePost_no=?";
		PreparedStatement pstmt3 = con.prepareStatement(sql3);
		pstmt3.setInt(1, no);
		ResultSet rs3 = pstmt3.executeQuery();
		
	%>
	<div class="moviePostDetailWrap">
		<div class="movie-post-header">
			<span>무비포스트 상세</span>
		</div>
		
		<div class="wrap">
		<hr>
		<div class="movie-post-title">
			<h2><%=movieTitle %></h2>
			<input type="button" value="예매하기"  class="post-btn-reserve" onclick="goReserve('<%=movieID%>');">
		</div>
		<div class="movie-post-container">
			<div class="tit">
				<%=m_id %><br><%=time.substring(0,10) %>
			</div>
			<div class="con">
				<img src="movieImages/<%=steelImg %>" width="80%">
				<div style="margin-top: 12px;"><%=summary %></div>
			</div>
			<div class="love">
				<a href="moviePostLoveAction.jsp?no=<%=no%>">
					<img src="images/ico-like.png">&nbsp;<span style="font-family: sans-serif;"><%=love %></span>
				</a>
			</div>
		</div>
		<div class="movie-post-reple">
			<span class="reple">댓글 (<%=repleCtn %>)</span>
			<form method="post" name="repleInsert" action="moviePostRepleAction.jsp">
			<textarea rows="5" cols="5" maxlength="100" name="repleContent"  placeholder="댓글을 달아주세요."></textarea>
			<input type="hidden" name="moviePost_no" value="<%=no%>">
			<input type="hidden" name="id" value="<%=id %>">
			<input type="submit"  value="등록" class="btnInsertReple"> 
			</form>
		</div>
		<div style="clear: both;"></div>
		<div class="movie-post-reple-view">
			<%
				while(rs3.next()){
			%>
				<div class="repleContentTable">
					<div>
						<div class="tit"><%=rs3.getString(3) %></div>
						<div class="txt"><%=rs3.getString(5).substring(0,10) %></div>
					</div>
					<div class="tvt">
						<%=rs3.getString(4) %>
					</div>				
				</div>
			<%		
				}
			%>
		</div>
		</div>
	</div>
</body>
</html>