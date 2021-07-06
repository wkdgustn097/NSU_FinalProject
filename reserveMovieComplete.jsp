<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype htm1>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/reserve.css">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
       <script language="javascript" src="javascript/reserve.js"></script>
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
  	<body>

        <%	
        	
        	request.setCharacterEncoding("utf-8");
        	String id= (String)session.getAttribute("sid");
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
        	
        	
        %>
        
                <div class="hsall">
      <div class="header">
       <div class="nav_area">
            <div class="sc_nav">
                 <ul class="sc_g_left">
                     <li></li>
                 </ul>
                 <ul class="sc_g_right">
                     <li>
                         <a href="myPageHome.jsp">마이페이지</a>
                     </li>
                     <li>
                         <a href="showCart.jsp">장바구니</a>
                     </li>
                     <li>
                         <a href="customNotice.jsp">고객센터</a>
                     </li>
                 </ul>
           </div>
           <div class="m_nav">
                <h1 class="logo">
                     <a href="index.jsp">
                     	<img src="images/logo.png" width="150px">
                    </a>
                </h1>
                <div class="m_gnb_area">
                     <ul class="m_gnb_list">
                         <li class>
                             <a href="movieAll.jsp">
                             <span>영화</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="movieAll.jsp">현재 상영작</a>
                                 </li>
                                 <li>
                                     <a href="movieAfter.jsp">상영 예정작</a>
                                 </li>
                                 <li>
                                     <a href="moviePost.jsp">무비 포스트</a>
                                 </li>                                                                  
                             </ul>
                         </li>
                         <li class>
                             <a href="reserveMain.jsp">
                             <span>예매</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="reserveMain.jsp">빠른 예매</a>
                                 </li>
                                 <li>
                                     <a href="movieTime.jsp">상영 시간표</a>
                                 </li>
                                 <li>
                                     <a href="reserveInfo.jsp">할인 안내</a>
                                 </li>                                                                  
                             </ul>                         
                         </li>
                         <li class>
                             <a href="eventMain.jsp">
                             <span>이벤트</span>
                             </a>
                         </li>
                         <li class>
                             <a href="snackStore.jsp">
                             <span>스토어</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="snackStore.jsp#No5">관람권</a>
                                 </li>
                                 <li>
                                     <a href="snackStore.jsp#No1">스낵/음료</a>
                                 </li>	                                                                 
                             </ul>                           
                         </li>
                     </ul>
                </div>
                <div class="aside_rnb eve_parent">
                     <ul class="as_rng_list">
                         <li>
	                       <div class="movieSearch">
							 	<form method="post" action="movieAll.jsp">
				                <input type="text" placeholder="영화명 검색" name="searchMovie" style="padding: 1px 0; width: 78px;"> 
						       <input type="image" src="images/btnSearch.png" class="movieSearchImg">
				          </form>
		           		 </div>
                             <!-- <a href="#" class="as_btn btn_st btn_search_on eve_side_menu">검색</a> -->
                         </li>
                         <%
              	    		if(id.equals("Guest")){
                    	%>
                        <li><a href="login.jsp" class="as_btn btn_my eve_quick">로그인</a></li>
                        <li><a href="join.jsp" class="as_btn btn_quick_on eve_side_menu">회원가입</a></li>
                        <%}else{ %>
                        <li><a href="myPageHome.jsp" class="as_btn btn_my eve_quick"><%=id %>님 </a></li>
                        <li><a href="logout.jsp" class="as_btn btn_quick_on eve_side_menu">로그아웃</a></li>
                        <%} %>                                               
                     </ul>
                </div>
                
                <button class="menu_b"></button>
                
           </div>
           
      </div>
      
      <div class="all_menu">
      <button class="close_b"></button>
      <ul>
      <li>
          <a href="#movieAll.jsp" class="eng">영화</a>
          <ul class="sub_m" style="display: block;">
            <li><a href="movieAll.jsp" class="eng">현재 상영작</a></li>
            <li><a href="movieAfter.jsp" class="eng">상영 예정작</a></li>
            <li><a href="moviePost.jsp" class="eng">무비 포스트</a></li>
          </ul>
      </li>
      <li>
          <a href="#reserveMain.jsp" class="eng">예매</a>
          <ul class="sub_m">
            <li><a href="reserveMain.jsp" class="eng">빠른 예매</a></li>
            <li><a href="movieTime.jsp" class="eng">상영 시간표</a></li>
            <li><a href="reserveInfo.jsp" class="eng">할인 안내</a></li>
          </ul>
      </li>
      <li>
          <a href="eventMain.jsp" class="eng">이벤트</a>
          <!-- <ul class="sub_m">
            <li><a href="/vision/3r.html" class="eng">3R</a></li>
            <li><a href="/vision/professionalism.html" class="eng">Professionalism</a></li>
          </ul> -->
      </li>
      <li>
          <a href="#snackStore.jsp" class="eng">스토어</a>
          <ul class="sub_m">
            <li><a href="snackStore.jsp#No5" class="eng">관람권</a></li>
            <li><a href="snackStore.jsp#No1" class="eng">스낵/음료</a></li>
          </ul>
      </li>
      <!-- <li>
          <a href="/contact/form.html" class="eng">검색</a>
      </li> -->
      <%
		if(id.equals("Guest")){
 	%>
     <li><a href="login.jsp" class="eng">로그인</a></li>
     <li><a href="join.jsp" class="eng">회원가입</a></li>
     <%}else{ %>
     <li><a href="myPageHome.jsp" class="eng"><%=id %>님 </a></li>
     <li><a href="logout.jsp" class="eng">로그아웃</a></li>
     <%} %>   
  </ul>
</div>

    		<div style="clear: both;"></div>
<script>
  $(document).ready(function(){
      $('.all_menu > ul > li > a').click(function(){
        $(this).next().fadeToggle(0);
      });

      $('.menu_b').click(function(){
        $('.all_menu').addClass('on');
      });

      $('.close_b').click(function(){
        $('.all_menu').removeClass('on');
      });
  });
</script>
     
      
     </div>
     
  </div><!--hsall끝  -->
  
  
			<%
				int no =1;
				String movieTitle="";
				int adult =0;
				int student =0;
				int baby =0;
				String movieDate="";
				String movieTime="";
				String img ="";
				String seat="";
				int price=0;
				String item="";
				int point=0;
				int coupon=0;
				String payBank ="";
				String payCard="";
				String payPass="";
				String payPhone="";
				String reserveDate="";
				
				
				int ticket = 0;
				
				String dburl="jdbc:mysql://localhost:3306/movieStore";
	        	String dbid="root";
	        	String dbpassword="1234";
				
	        	Class.forName("org.gjt.mm.mysql.Driver");
	    		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	    		
	    		try{
	    			String sql = "select max(no) from reserveMovie";
	        		PreparedStatement pstmt=con.prepareStatement(sql);
	        		ResultSet rs = pstmt.executeQuery();
	        		rs.next();
	        		no=rs.getInt(1);
	        		
	        		rs.close();
	        		pstmt.close();
	        		
	        		String sql2 = "select * from reserveMovie where no=?";
	        		PreparedStatement pstmt2 = con.prepareStatement(sql2);
	        		pstmt2.setInt(1, no);
	        		ResultSet rs2 = pstmt2.executeQuery();
	        		rs2.next();
	        		movieTitle=rs2.getString(3);
	        		adult=rs2.getInt(4);
	        		student=rs2.getInt(5);
	        		baby = rs2.getInt(6);
	        		movieDate =rs2.getString(7);
	        		movieTime=rs2.getString(8);
	        		img = rs2.getString(9);
	        		seat =rs2.getString(10);
	        		price = rs2.getInt(11);
	        		
	        		rs2.close();
	        		pstmt2.close();
	        		
	        		String sql3 = "select * from reserveInfo where no=?";
	        		PreparedStatement pstmt3 = con.prepareStatement(sql3);
	        		pstmt3.setInt(1,no);
	        		ResultSet rs3 = pstmt3.executeQuery();
	        		rs3.next();
	        		item = rs3.getString(3);
	        		point =rs3.getInt(4);
	        		coupon=rs3.getInt(5);
	        		payBank=rs3.getString(7);
	        		payCard =rs3.getString(8);
	        		payPass =rs3.getString(9);
	        		payPhone=rs3.getString(10);
	        		reserveDate=rs3.getString(11);
	        		ticket = rs3.getInt(12);
	        		
	        		rs3.close();
	        		pstmt3.close();
	    		}catch(Exception e){
	    			e.printStackTrace();
	    		}
			%>
			<div class="container">
				<br><br>
				<div >
				<div class="com_wrap">
					<div  class="com_table">
						<img class="moim" src="movieImages/<%=img %>" width="330px">
					</div>
					<div>
					<div class="com_table a" style="line-height: 65px; border-right: 1px solid lightgray">
							<h2 style="width: 80%;margin: auto;font-size: 32px"><%=movieTitle %></h2>
						
							<span class="under">성인 <%=adult %>명, 청소년 <%=student %>명, 아이 <%=baby %>명</span><br>
						
							<span class="under">영화 시간<br><%=movieDate %>&nbsp;/&nbsp;<%=movieTime %></span><br>
						
							<span class="under">좌석 : <%=seat %></span><br>
						
							<span class="under">가격<br><%=price %> 원</span>
						
					</div>
				
				
				<%
				String userGrade="일반";
				int percent=0;
				
				try{
        			String sql = "select * from userGrade where id=?";
            		PreparedStatement pstmt=con.prepareStatement(sql);
            		pstmt.setString(1, id);
            		ResultSet rs = pstmt.executeQuery();
            		rs.next();
            		userGrade=rs.getString(2);
            		
            		
            		rs.close();
            		pstmt.close();
            		       
                }catch(Exception e){
	            			e.printStackTrace();
	            		}
        		if(userGrade.equals("일반"))percent=0;
        		else if(userGrade.equals("Silver"))percent=5;
        		else if(userGrade.equals("Gold")) percent=7;
        		else percent=10;
        		double price2 =price*((double)percent/100);
        		int price3 = (int)price2; 
				%>
				<div class="com_table">
				<div class="movieCompletePoint">
					<h2 style="font-size: 32px;">예매가 완료 되었습니다.</h2>
					<div><%=id %>님 등급할인 <span><%=price3%>원</span><br>
					<br>총 할인 <span><%=(adult*12000+student*10000+baby*6000)-price %>원</span></div>
					<div>사용하신 포인트 <span><%=point %>P</span></div>
					<div>사용하신 쿠폰 <span><%=coupon %>개</span></div>
					<div>사용하신 관람권 <span><%=ticket %>장</span></div>
					<div class="difont" style="font-size: 20px;"><span style="color: #CB1782;"><%=price/10 %>P</span> 적립 되었습니다.
					<br>영화 관람권을 <%=request.getParameter("haveTicket") %>장 받으셨습니다.</div>
				</div>
				<div style="clear: both;"></div>
				</div>
				</div>
				</div>
				
				<div>
				<h2 style="margin-top: 100px;clear: both;">결제정보</h2><br><hr><br>
				<%if(item.equals("카카오페이")){
					%>
					<table class="payTable" cellspacing="0">
					
						<tr class="payTable1">
							<td>결제한카드종류</td>
							<td>예매한 날짜</td>
						</tr>
						<tr>
							<td><%=item %></td>
							<td><%=reserveDate %></td>
						</tr>	
						
					</table>
				<% 		
					}
				else if(payPhone.equals("")){
				%>
					<table class="payTable" cellspacing="0">
						<tr class="payTable1">
							<td>결제한 카드종류</td>
							<td>카드번호</td>
							<td>카드비밀번호</td>
							<td>예매한 날짜</td>
						</tr>
						<tr>
							<td><%=payBank %></td>
							<td><%=payCard %></td>
							<td><%=payPass %></td>	
							<td><%=reserveDate %></td>
						</tr>	
						
					</table>
				<% 		
					}else if(payCard.equals("")){
				%>
					<table class="payTable" cellspacing="0">
					
						<tr class="payTable1">
							<td>결제한 휴대폰 번호</td>
							<td>예매한 날짜</td>
						</tr>
						<tr>
							<td><%=payPhone %></td>
							<td><%=reserveDate %></td>
						</tr>	
						
					</table>
				<% 		
					} %>
				</div>
				</div>
				<button  class="btnBack"onclick="location.href='index.jsp'">메인화면으로 돌아가기</button>
			</div>
			
			
			
            <section class="footer">
                <div class="wrapper" style="width: 1000px;margin: auto;">
                  <div style="display:flex;line-height: 79px; height: 60px;color: #888;">
                  <div style="margin-right:2%;">
                  <a href="index.jsp"><img src="images/logo.png" height="60px" ></a>
                  </div>
                   <a href="mainInfo1.jsp"><h4>회사소개</h4></a>&nbsp;&nbsp;·
                   &nbsp;&nbsp;<a href="mainInfo2.jsp"><h4>제휴문의</h4></a>&nbsp;&nbsp;·
                   &nbsp;&nbsp;<a href="mainInfo3.jsp"><h4>배성/편성기준</h4></a> &nbsp;&nbsp;·
                   &nbsp;&nbsp;<a href="manageLogin.jsp"><h4>관리자 로그인</h4></a>
                  </div>
                   <div style="margin-top:3%;">
                   <ul style="white-space:nowrap;">
                   <li style="list-style:none;"><span>주소</span>&nbsp;&nbsp;충청남도 천안시 서북구 성환읍 대학로 91, 3층(공학관 3층)  <span>ARS</span>&nbsp;&nbsp;1544-6416</li>
                   <li style="list-style:none;"><span>대표자명</span>&nbsp;&nbsp;민석홍 <span>개인정보보호책임자</span>&nbsp;&nbsp;민석홍 <span>사업자등록번호</span>&nbsp;&nbsp;411-82-17852 &nbsp;<span>통신판매업신고번호 제 8호</span></li>
                   <li style="list-style:none;"><span>COPYRIGHT © MovieStoreJoongAng, Inc. All rights reserved</span></li>
                   </ul>
                   </div>
                  </div>
                </div>    
            </section>
            


        </body>
</html>