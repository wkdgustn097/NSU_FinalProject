<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	String toID = request.getParameter("toID");
	String message = request.getParameter("message");
	String place = request.getParameter("place");
	
	String ctNo = (String)session.getId();
	int total = Integer.parseInt(request.getParameter("total"));  //총 결제금액
	int point = Integer.parseInt(request.getParameter("point2"));
	int coupon = Integer.parseInt(request.getParameter("coupon2"));
	int price = total - 5000*coupon - point;
	int price2= price;
	String item = request.getParameter("cp_item");
	String payBank = request.getParameter("payBank");
	String payCard1 = request.getParameter("payCard1");
	String payCard2 = request.getParameter("payCard2");
	String payCard3 = request.getParameter("payCard3");
	String payCard4 = request.getParameter("payCard4");
	String payCard="";
	if(!payCard1.equals("")&&!payCard2.equals("")&&!payCard3.equals("")&&!payCard4.equals("")){
		payCard = payCard1+"-"+payCard2+"-"+payCard3+"-"+payCard4;
	}
	
	if(item.equals("카카오페이")){
		price=(int)(price*0.95);
	}
	
	String payPass = request.getParameter("payPass");
	String payPhone1 = request.getParameter("payPhone1");
	String payPhone2 = request.getParameter("payPhone2");
	String payPhone3 = request.getParameter("payPhone3");
	String payPhone="";
	if(!payPhone2.equals("")&&!payPhone3.equals("")){
		payPhone = payPhone1+"-"+payPhone2+"-"+payPhone3;
	}
	
	int v1=0;
	int v2=0;
	
	
	Date now1  = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
	String now=sdf.format(now1);
	
	String userPhone="";
	String userGrade="일반";
	int userSum=0;
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	try{
		String sql3 = "select phone from user where id=?";
		PreparedStatement pstmt3 = con.prepareStatement(sql3);
		pstmt3.setString(1, id);
		ResultSet rs3 = pstmt3.executeQuery();
		if(rs3.next()){
			userPhone = rs3.getString(1);
		}
		
			if(!payPhone.equals("")&&!payPhone.equals(userPhone)){
				script.println("<script>");
				script.println("alert('휴대폰 번호가 다릅니다. 다시 한번 확인해 주세요.')");
				script.println("history.back()");
				script.println("</script>");
				
			}else{
				if(place.equals("cart")){
					String sql="select * from cart where ctNo=?";
					PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setString(1, ctNo);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
						
						String sql6 = "select * from userGrade where id=?";
		        		PreparedStatement pstmt6=con.prepareStatement(sql6);
		        		pstmt6.setString(1, id);
		        		ResultSet rs6 = pstmt6.executeQuery();
		        		rs6.next();
		        		String userGrade1=rs6.getString(2);
		        		int coupon1=rs6.getInt(4);
		        		int point1=rs6.getInt(3);
		        		int ticket = rs6.getInt(5);
		        		
		        		v1 =point1-point+price/10;
						 v2 =coupon1-coupon;
						
						int snack_no = rs.getInt(2);
						int snackQty = rs.getInt(3);
						
						
						String sql2 = "insert into reserveSnack values(null,?,?,?,?)";
						PreparedStatement pstmt2 = con.prepareStatement(sql2);
						pstmt2.setString(1, id);
						pstmt2.setInt(2,snack_no);
						pstmt2.setInt(3, snackQty);
						pstmt2.setString(4,"선물");
						pstmt2.executeUpdate();
						
						
						String sql4 = "insert into reserveSnackInfo values(null,?,?,?,?,?,?,?,?,?)";
						PreparedStatement pstmt4 = con.prepareStatement(sql4);
						pstmt4.setString(1, id);
						pstmt4.setString(2, item);
						pstmt4.setInt(3,point);
						pstmt4.setInt(4, coupon);
						pstmt4.setInt(5, price);
						pstmt4.setString(6, payBank);
						pstmt4.setString(7, payCard);
						pstmt4.setString(8, payPhone);
						pstmt4.setString(9, now);
						pstmt4.executeUpdate();
						
						
						
						String ql = "select max(reserveSnack_no) from reservesnack";
						PreparedStatement stmt = con.prepareStatement(ql);
						ResultSet s = stmt.executeQuery();
						s.next();
						int reserveSnack_no = s.getInt(1);
						
						
						String sql10 = "insert into giftValue values(?,?,?,?,?)";
						PreparedStatement pstmt10 = con.prepareStatement(sql10);
						pstmt10.setInt(1, reserveSnack_no);
						pstmt10.setString(2, id);
						pstmt10.setInt(3,snack_no);
						pstmt10.setInt(4, snackQty);
						pstmt10.setString(5,"사용");
						pstmt10.executeUpdate();
						
						String ql2 = "insert into gift values(?,?,?,?,?)";
						PreparedStatement stmt2 = con.prepareStatement(ql2);
						stmt2.setInt(1, reserveSnack_no);
						stmt2.setString(2, id);
						stmt2.setString(3, toID);
						stmt2.setString(4, message);
						stmt2.setString(5, "미사용");
						stmt2.executeUpdate();
					}	
				}else if(place.equals("direct")){
		        	String sql6 = "select * from userGrade where id=?";
	        		PreparedStatement pstmt6=con.prepareStatement(sql6);
	        		pstmt6.setString(1, id);
	        		ResultSet rs6 = pstmt6.executeQuery();
	        		rs6.next();
	        		String userGrade1=rs6.getString(2);
	        		int coupon1=rs6.getInt(4);
	        		int point1=rs6.getInt(3);
	        		int ticket = rs6.getInt(5);
	        		
	        		v1 =point1-point+price/10;
					 v2 =coupon1-coupon;
					
					int snack_no = Integer.parseInt(request.getParameter("directNo"));
					int snackQty = Integer.parseInt(request.getParameter("directQty"));
					
					
					String sql2 = "insert into reserveSnack values(null,?,?,?,?)";
					PreparedStatement pstmt2 = con.prepareStatement(sql2);
					pstmt2.setString(1, id);
					pstmt2.setInt(2,snack_no);
					pstmt2.setInt(3, snackQty);
					pstmt2.setString(4,"선물");
					pstmt2.executeUpdate();
					
					
					String sql4 = "insert into reserveSnackInfo values(null,?,?,?,?,?,?,?,?,?)";
					PreparedStatement pstmt4 = con.prepareStatement(sql4);
					pstmt4.setString(1, id);
					pstmt4.setString(2, item);
					pstmt4.setInt(3,point);
					pstmt4.setInt(4, coupon);
					pstmt4.setInt(5, price);
					pstmt4.setString(6, payBank);
					pstmt4.setString(7, payCard);
					pstmt4.setString(8, payPhone);
					pstmt4.setString(9, now);
					pstmt4.executeUpdate();
					
					
					
					
					String ql = "select max(reserveSnack_no) from reservesnack";
					PreparedStatement stmt = con.prepareStatement(ql);
					ResultSet s = stmt.executeQuery();
					s.next();
					int reserveSnack_no = s.getInt(1);
					
					
					String sql10 = "insert into giftValue values(?,?,?,?,?)";
					PreparedStatement pstmt10 = con.prepareStatement(sql10);
					pstmt10.setInt(1, reserveSnack_no);
					pstmt10.setString(2, id);
					pstmt10.setInt(3,snack_no);
					pstmt10.setInt(4, snackQty);
					pstmt10.setString(5,"사용");
					pstmt10.executeUpdate();
					
					String ql2 = "insert into gift values(?,?,?,?,?)";
					PreparedStatement stmt2 = con.prepareStatement(ql2);
					stmt2.setInt(1, reserveSnack_no);
					stmt2.setString(2, id);
					stmt2.setString(3, toID);
					stmt2.setString(4, message);
					stmt2.setString(5, "미사용");
					stmt2.executeUpdate();
				}
					
				
				
					String sql5 = "select sum(price) from reserveinfo where id=?";
					PreparedStatement pstmt5 = con.prepareStatement(sql5);
					pstmt5.setString(1, id);
					ResultSet rs5 = pstmt5.executeQuery();
					if(rs5.next()){
						userSum = rs5.getInt(1);
					}
					
					String sql8 = "select sum(price) from reserveSnackInfo where id=?";
					PreparedStatement pstmt8=con.prepareStatement(sql8);
	        		pstmt8.setString(1, id);
	        		ResultSet rs8 = pstmt8.executeQuery();
	        		rs8.next();
	        		int userSum1=rs8.getInt(1);
	        		
	        		
	        		
	        		
					if(userSum+userSum1<100000)userGrade="일반";
					else if(userSum+userSum1<200000){
						userGrade="Silver";
					}else if(userSum+userSum1<300000)
						userGrade="Gold";
					else
						userGrade="플레티넘";
					
					
	        		
					
					
					String sql7 = "update usergrade set userGrade=?, point=?, coupon=? where id=?";
					PreparedStatement pstmt7 = con.prepareStatement(sql7);
					pstmt7.setString(1, userGrade);
					pstmt7.setInt(2, v1);
					pstmt7.setInt(3, v2);
					pstmt7.setString(4, id);
					pstmt7.executeUpdate();
					
					String sql10 = "delete from cart where ctNo=?";
					PreparedStatement pstmt10 = con.prepareStatement(sql10);
					pstmt10.setString(1, ctNo);
					pstmt10.executeUpdate();
					
					pstmt10.close();
					pstmt7.close();
					pstmt5.close();
					
					pstmt3.close();
					con.close();
					
					if(item.equals("카카오페이")){
						%>	
							<script>
								alert('[카카오 결제 이벤트] <%=(int)(price2-price)%>원 할인 받으셨습니다.');
							</script>
						<%
						}
				%>
					<script>
					alert('<%=toID%>님께 선물 되었습니다.');
					location.href='snackStore.jsp';
				</script>
				
				<%
				
				
				}//else
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>