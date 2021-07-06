<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script language="javascript" src="javascript/user.js"></script>
<link rel="stylesheet" type="text/css" href="css/movie.css">
<Script Language=JavaScript>
function winResize(){
  width  = parseInt(document.body.clientWidth -  document.images[0].width)+45;
  height = parseInt(document.body.clientHeight -  document.images[0].height)+150;
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
	
	String sql2 = "select * from user where id=?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setString(1,id);
	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();
	String name= rs2.getString(3);
	
	String sql = "select * from giftValue as a  join gift as b on a.reserveSnack_no= b.reservesnackNo and b.toID=?and b.useGift=? order by useGift";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, "미사용");
	ResultSet rs = pstmt.executeQuery();
%>
<div style="border: 3px solid #524c4a; width: 99%;background:url('images/gnb-bg.png');">
	<div style="width: 100%;background: #524c4a;padding: 3px 0;">
		<div style="color: white;padding: 13px 0;font-size: 22px;border:1px solid white;">&nbsp;&nbsp;&nbsp;선물함(<%=giftCount %>)</div>
	</div>	
		<div style="background:url('images/gnb-bg.png'); width: 90%;margin: auto;">
		<h3 style="margin: 20px 0;"><%=name %>님  <span style="font-size:14px;"><%=id %></span></h3>
		<div style="background: #e9e9e8;">
		<%
			if(giftCount==0){
		%>	
			<div style="text-align: center;height: 300px;line-height: 300px;">선물받으신 내역이 없습니다.</div>
		<% 	
			}else{
		%>
			<table cellspacing=0 class="giftTable">
				<tr class="giftTableHead">
					<td colspan="2">선물 정보</td><td>수량</td><td>선물하신 분</td><td>사용여부</td>
				</tr>
		<% 			
				while(rs.next()){
					int reserveSnack_no = rs.getInt(1);
					int snack_no = rs.getInt(3);
					int snackQty = rs.getInt(4);
					String giver=rs.getString(7);
					String useGift = rs.getString(10);
					String message = rs.getString(9);
					
					String sql3 = "select * from snack where snack_no=?";;
					PreparedStatement pstmt3 = con.prepareStatement(sql3);
					pstmt3.setInt(1, snack_no);
					ResultSet rs3 = pstmt3.executeQuery();
					rs3.next();
					String snackImg = rs3.getString(3);
					String snackName = rs3.getString(2);
					String snackInfo = rs3.getString(4);
					String snackCtg = rs3.getString(5);
		%>	
				<tr>
					<td><img alt="" src="snackImages/<%=snackImg%>"width="80px"></td>
					<td><%=snackName %></td>
					<td><%=snackQty %>개</td>
					<td><a href="myPageGiftViewDetail.jsp?no=<%=reserveSnack_no%>"><span class="giver"><%=giver %>님</span></a></td>
				<%
					if(snackCtg.equals("ticket")){
						if(useGift.equals("사용")){
				%>
					<td><%=useGift %></td>
				<% 			
						}else if(useGift.equals("미사용")){
				%>			
					<td><input type="button" value="사용하기" class="btnGiftUse" onclick="location.href='myPageGiftViewAction.jsp?reserveSnackNo=<%=reserveSnack_no%>&snackQty=<%=snackQty%>'"></td>
				<% 
						}		
					}else{
				%>
					<td><%=useGift %></td>
				<%		
					}
				%>
					
				</tr>
		<% 			
				}
				
			}
		%>
			
			</table>
		</div><br>
		<div style="margin: auto;text-align: center;margin: 20px 0;">
		<input type="button" value="닫기" style="text-align:center;color: white;background: #524c4a;padding: 10px 40px;"onclick="window.close();">
		</div>
	</div>
	
</div>

</body>
</html>