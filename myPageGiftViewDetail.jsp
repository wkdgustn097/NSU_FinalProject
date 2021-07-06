<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script language="javascript" src="javascript/user.js"></script>
<link rel="stylesheet" type="text/css" href="css/movie.css">
<link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<Script Language=JavaScript>
function winResize(){
  width  = parseInt(document.body.clientWidth -  document.images[0].width)+45;
  height = parseInt(document.body.clientHeight -  document.images[0].height)+370;
  window.resizeTo(633,height)
}

</Script>

<title>Insert title here</title>
</head>
<body onload="winResize()">

<%
	String id= (String)session.getAttribute("sid");
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	if(id==null){
		id="Guest";
	}
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	String jsql = "select count(*) from giftValue as a  join gift as b on a.reserveSnack_no= b.reservesnackNo and b.toID=? and b.usegift=?";
	PreparedStatement jpstmt = con.prepareStatement(jsql);
	jpstmt.setString(1, id);
	jpstmt.setString(2, "미사용");
	ResultSet jrs = jpstmt.executeQuery();
	jrs.next();
	int giftCount=jrs.getInt(1);
	
	int no = Integer.parseInt(request.getParameter("no"));
	
	String sql = "select * from reservesnack where reserveSnack_no=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, no);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int snackNo = rs.getInt(3);
	
	String sql2 = "select * from snack where snack_no = ?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setInt(1, snackNo);
	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();
	String snackName = rs2.getString(2);
	String snackImg = rs2.getString(3);
	
	String sql3 = "select * from gift where reserveSnackNo=?";
	PreparedStatement pstmt3 = con.prepareStatement(sql3);
	pstmt3.setInt(1, no);
	ResultSet rs3 = pstmt3.executeQuery();
	rs3.next();
	String message=rs3.getString(4);
	String giver= rs3.getString(2);
%>
<div style="border: 3px solid #524c4a; width: 99%;background:url('images/gnb-bg.png');">
	<div style="width: 100%;background: #524c4a;padding: 3px 0;">
		<div style="color: white;padding: 13px 0;font-size: 22px;border:1px solid white;">&nbsp;&nbsp;&nbsp;선물함(<%=giftCount %>)</div>
	</div>	
		
	<div style="background:url('images/gnb-bg.png'); width: 90%;margin: auto;">
		<div style="background: #e9e9e8;margin-top: 25px;">
			<div style="text-align: center;"><img src="snackImages/<%=snackImg %>" width="300px"></div>
			<div style="width: 58%;margin: auto;"><strong><%=giver %>님</strong></div><br>
			<div style="padding: 0 0 39px 0;width: 58%;margin: auto;"><%=message %></div>	
		</div>	
			
		<div style="margin: auto;text-align: center;margin: 20px 0;">
		<input type="button" value="뒤로가기" onclick="history.back();"style="text-align:center;padding: 10px 25px;margin-right:20px;">
		<input type="button" value="닫기" style="text-align:center;color: white;background: #524c4a;padding: 10px 40px;"onclick="window.close();">
		</div>
	</div>
</div>

</body>
</html>