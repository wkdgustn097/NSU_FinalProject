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
	int no = Integer.parseInt(request.getParameter("no"));
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	
	try{
		String sql = "select id,point,coupon,price from reservesnackinfo where reserveSnack_no = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String id =rs.getString(1);
		int point = rs.getInt(2);
		int coupon= rs.getInt(3);
		int price = rs.getInt(4);
		
		String sql4 = "delete from reservesnackinfo where reserveSnack_no = ?";
		PreparedStatement pstmt4 = con.prepareStatement(sql4);
		pstmt4.setInt(1, no);
		pstmt4.executeUpdate();
		
		String sql5 = "delete from reservesnack where reserveSnack_no = ?";
		PreparedStatement pstmt5 = con.prepareStatement(sql5);
		pstmt5.setInt(1, no);
		pstmt5.executeUpdate();
		
		String sql2 = "select * from usergrade where id=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setString(1, id);
		ResultSet rs2 = pstmt2.executeQuery();
		rs2.next();
		String userGrade=rs2.getString(2);
		int point2 = rs2.getInt(3);
		int coupon2 = rs2.getInt(4);
		
		int userSum = 0;
		String sql3 = "select sum(price) from reserveinfo where id=?";
		PreparedStatement pstmt3 = con.prepareStatement(sql3);
		pstmt3.setString(1, id);
		ResultSet rs3 = pstmt3.executeQuery();
		if(rs3.next()){
			userSum = rs3.getInt(1);
		}
		
		String sql10 = "select sum(price) from reserveSnackInfo where id=?";
		PreparedStatement pstmt10=con.prepareStatement(sql10);
		pstmt10.setString(1, id);
		ResultSet rs10 = pstmt10.executeQuery();
		rs10.next();
		int userSum1=rs10.getInt(1);
		
		
		
		
		if(userSum+userSum1<100000)userGrade="일반";
		else if(userSum+userSum1<200000){
			userGrade="Silver";
		}else if(userSum+userSum1<300000)
			userGrade="Gold";
		else
			userGrade="플레티넘";
		
		String sql6 = "update usergrade set usergrade=?, point=?, coupon=? where id=?";
		PreparedStatement pstmt6 = con.prepareStatement(sql6);
		pstmt6.setString(1, userGrade);
		pstmt6.setInt(2,point+point2+price);
		pstmt6.setInt(3,coupon+coupon2);
		pstmt6.setString(4, id);
		pstmt6.executeUpdate();
	%>
		<script>
			alert('<%=point+price%>P 와 <%=coupon%>장의 쿠폰이 환불되었습니다');
			location.href='myPageHome.jsp';
		</script>
	<% 	
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>