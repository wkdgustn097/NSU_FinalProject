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



	String movieTitle=request.getParameter("movieTitle");
	int adult = Integer.parseInt(request.getParameter("adult"));
	int student = Integer.parseInt(request.getParameter("student"));
	int baby = Integer.parseInt(request.getParameter("baby"));
	String movieDate=request.getParameter("movieDate");
	String movieTime=request.getParameter("movieTime");
	int people = adult+student+baby;
	String img = request.getParameter("img");
	int price1 =Integer.parseInt(request.getParameter("price"));
	String movieDateTime =movieDate+" "+movieTime;
	
	String seat = request.getParameter("seat");
	int point = Integer.parseInt(request.getParameter("point2"));
	int coupon = Integer.parseInt(request.getParameter("coupon2"));
	int price2 = price1 - 5000*coupon - point;
	int price=price2;
	String item = request.getParameter("cp_item");
	
	int ticket = Integer.parseInt(request.getParameter("ticket"));
	if(item.equals("카카오페이")){
		price=(int)(price2*0.95);
	}
	
	String payBank = request.getParameter("payBank");
	String payCard1 = request.getParameter("payCard1");
	String payCard2 = request.getParameter("payCard2");
	String payCard3 = request.getParameter("payCard3");
	String payCard4 = request.getParameter("payCard4");
	String payCard="";
	if(!payCard1.equals("")&&!payCard2.equals("")&&!payCard3.equals("")&&!payCard4.equals("")){
		payCard = payCard1+"-"+payCard2+"-"+payCard3+"-"+payCard4;
	}
	
	String payPass = request.getParameter("payPass");
	String payPhone1 = request.getParameter("payPhone1");
	String payPhone2 = request.getParameter("payPhone2");
	String payPhone3 = request.getParameter("payPhone3");
	String payPhone="";
	if(!payPhone2.equals("")&&!payPhone3.equals("")){
		payPhone = payPhone1+"-"+payPhone2+"-"+payPhone3;
	}
	
	
	
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
		ResultSet rs = pstmt3.executeQuery();
		if(rs.next()){
			userPhone = rs.getString(1);
		}
		
		if(payPhone.equals("")&&(payCard.equals("")||payPass.equals(""))&&!item.equals("카카오페이")){//둘다 빈칸인가?
			script.println("<script>");
			script.println("alert('빈칸이 있습니다. 다시 한번 확인해 주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			if(!payPhone.equals("")&&!payPhone.equals(userPhone)){
				script.println("<script>");
				script.println("alert('휴대폰 번호가 다릅니다. 다시 한번 확인해 주세요.')");
				script.println("history.back()");
				script.println("</script>");
				
			}else{
			
				String sql = "insert into reservemovie values(null,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, movieTitle);
				pstmt.setInt(3, adult);
				pstmt.setInt(4, student);
				pstmt.setInt(5, baby);
				pstmt.setString(6, movieDate);
				pstmt.setString(7, movieTime);
				pstmt.setString(8, img);
				pstmt.setString(9, seat);
				pstmt.setInt(10, price);
				pstmt.setString(11,"미사용");
				pstmt.executeUpdate();
				
				String sql2 = "insert into reserveinfo values(null,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt2 = con.prepareStatement(sql2);
				pstmt2.setString(1, id);
				pstmt2.setString(2, item);
				pstmt2.setInt(3, point);
				pstmt2.setInt(4, coupon);
				pstmt2.setInt(5, price);
				pstmt2.setString(6, payBank);
				pstmt2.setString(7, payCard);
				pstmt2.setString(8, payPass);
				pstmt2.setString(9, payPhone);
				pstmt2.setString(10, now);
				pstmt2.setInt(11, ticket);
				pstmt2.executeUpdate();
				
				String sql4 = "select sum(price) from reserveinfo where id=?";
				PreparedStatement pstmt4 = con.prepareStatement(sql4);
				pstmt4.setString(1, id);
				ResultSet rs4 = pstmt4.executeQuery();
				if(rs4.next()){
					userSum = rs4.getInt(1);
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
				
				String sql6 = "select * from userGrade where id=?";
        		PreparedStatement pstmt6=con.prepareStatement(sql6);
        		pstmt6.setString(1, id);
        		ResultSet rs6 = pstmt6.executeQuery();
        		rs6.next();
        		String userGrade1=rs6.getString(2);
        		int coupon1=rs6.getInt(4);
        		int point1=rs6.getInt(3);
        		int ticket1 = rs6.getInt(5);
				int v1 =point1-point+price/10;
				int v2 =coupon1-coupon;
				
				int haveTicket= 0;
				if(people>=2){
					haveTicket = people/2-ticket;
					if(haveTicket<0){
						haveTicket=0;
					}
				}
				String sql5 = "update usergrade set userGrade=?, point=?, coupon=?, ticket=? where id=?";
				PreparedStatement pstmt5 = con.prepareStatement(sql5);
				pstmt5.setString(1, userGrade);
				pstmt5.setInt(2, v1);
				pstmt5.setInt(3, v2);
				pstmt5.setInt(4, ticket1-ticket+haveTicket);
				pstmt5.setString(5, id);
				
				pstmt5.executeUpdate();
				
				
				String sql7 = "select * from reserveRate where movieTitle=?";
				PreparedStatement pstmt7 = con.prepareStatement(sql7);
				pstmt7.setString(1, movieTitle);
				ResultSet rs7 = pstmt7.executeQuery();
				
				
				if(rs7.next()){ //동일 영화가 있다면 count값만 증가시킴
					int ct = rs7.getInt(2)+1;
					String mt=rs7.getString(1);
					String sql8="update reserveRate set count=? where movieTitle=?";
					PreparedStatement pstmt8 = con.prepareStatement(sql8);
					pstmt8.setInt(1, ct);
					pstmt8.setString(2, mt);
					pstmt8.executeUpdate();
					
					pstmt8.close();
				}else{//새로운 영화를 추가
					String sql9="insert into reserveRate values(?,?)";
					PreparedStatement pstmt9 = con.prepareStatement(sql9);
					pstmt9.setString(1, movieTitle);
					pstmt9.setInt(2,1);
					pstmt9.executeUpdate();
					
					pstmt9.close();
					
				}
				
				rs7.close();
				pstmt7.close();
				pstmt5.close();
				pstmt6.close();rs6.close();
				pstmt4.close();rs4.close();
				pstmt2.close();pstmt.close();
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
				
				location.href='reserveMovieComplete.jsp?haveTicket=<%=haveTicket%>';
			</script>
			<%	
				
				
				
				}//else
		}//둘다 비지 않았다면
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>