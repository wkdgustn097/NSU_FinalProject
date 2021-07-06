<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/movie.css">
        <script language="javascript" src="javascript/user.js"></script>
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
         <style>
         	.watch_reserve td {
				    padding: 25px 14px;
				}
			.watch_reserveSnack td{
				padding: 25px 14px;
			}
         </style>
    </head>
    <body>
         <%
        	String id= (String)session.getAttribute("sid");
	     	String dburl="jdbc:mysql://localhost:3306/movieStore";
	    	String dbid="root";
	    	String dbpassword="1234";
	    	String name="";
	    	String userGrade="";
	    	int userAmount=0;
	    	int point=0;
	    	int coupon=0;
	    	int ticket=0;
	    	int giftCount=0;
	    	
	    	int trashPay=0;
	    	int sumPost=0;
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
        		String sql="select name from user where id=?";
        		PreparedStatement pstmt = con.prepareStatement(sql);
        		pstmt.setString(1, id);
        		ResultSet rs = pstmt.executeQuery();
        		if(rs.next()){
        			name=rs.getString(1);
        		}
        		
        		String sql2 = "select * from userGrade where id=?";
        		PreparedStatement pstmt2 = con.prepareStatement(sql2);
        		pstmt2.setString(1, id);
        		ResultSet rs2 = pstmt2.executeQuery();
        		if(rs2.next()){
        			userGrade=rs2.getString(2);
        			point =rs2.getInt(3);
        			coupon=rs2.getInt(4);
        			ticket= rs2.getInt(5);
        		}
        		int userSum=0;
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
        		
        		
        		
        		userAmount=userSum+userSum1;
        		
        		String sql9 = "select count(*) from moviePost where id=?";
        		PreparedStatement pstmt9 = con.prepareStatement(sql9);
        		pstmt9.setString(1,id);
        		ResultSet rs9 = pstmt9.executeQuery();
        		if(rs9.next()){
        			sumPost=rs9.getInt(1);
        		}
        		
        		rs2.close();
        		pstmt2.close();
        		rs.close();
        		pstmt.close();
        	
        	
        	
        	if(userGrade.equals("일반")){
        		trashPay = 100000-userAmount;
        	}else if(userGrade.equals("Silver")){
        		trashPay = 200000-userAmount;
        	}else if(userGrade.equals("Gold")){
        		trashPay = 300000-userAmount;
        	}else if(userGrade.equals("플레티넘")){
        		trashPay = 0;
        	}
        	
        	
        	String jsql = "select count(*) from giftValue as a  join gift as b on a.reserveSnack_no= b.reservesnackNo and b.toID=? and b.useGift=?";
        	PreparedStatement jpstmt = con.prepareStatement(jsql);
        	jpstmt.setString(1, id);
        	jpstmt.setString(2, "미사용");
        	ResultSet jrs = jpstmt.executeQuery();
        	jrs.next();
        	giftCount=jrs.getInt(1);
        	
        	
        	
        	}catch(Exception e){
        		e.printStackTrace();
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
  
        <div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<a href="index.jsp"><img alt="" src="images/home.png"></a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="myPageHome.jsp">
							마이페이지
						</a>

						
					</div>
				</div>
			</div>

     <div class="container07">
     	<div class="content">
     		<div class="content1">
     			<div class="acon" style="margin-left: 170px;">
	     			<span style="display:flex;"><h1><%=name %></h1><h4 style="margin-top:5%;">(<%=id %>)</h4><h1>님은</h1></span>
	     			<h1><%=userGrade %>등급 입니다.</h1>
	     			<br><br>
	     			다음 등급까지 남은 금액: <%=trashPay %>원
	     			<br>
	     			나의 누적 금액 : <%=userAmount %>원
     			</div>
     			<div style="margin-left:8%;">
     			  <a href="myUserUpdate.jsp">개인정보 수정&nbsp;&nbsp;<img src="images/ico-arr-right-gray.png" width="15px"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	     	      <a href="myUserDelete.jsp">회원 탈퇴&nbsp;&nbsp;<img src="images/ico-arr-right-gray.png" width="15px"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	     		  <a href="reserveInfo.jsp">멤버십 해택 보기&nbsp;&nbsp;<img src="images/ico-arr-right-gray.png" width="15px"></a>
	     		  <div style="display:flex; margin-top:9%; " >
	     		  <div style="text-align: center;">
	     		  <table><img src="images/home01.png" width="60px" height="60px"></table>
	     		  <table><h3 align=center>쿠폰</h3></table>
	     		  <table><h3 align=center><%=coupon%>장</h3></table>
	     		  </div >
	     		  <div style=" margin-left:10%;text-align: center;">
	     		  <table><img src="images/home02.png" width="60px" height="60px"></table>
	     		  <table><h3 align=center>포인트</h3></table>
	     		  <table><h3 align=center><%=point%>P</h3></table>
	     		  </div>
	     		  <div style=" margin-left:10%;text-align: center;">
	     		  <table><img src="images/ticket.png" width="60px" height="60px"></table>
	     		  <table><h3 align=center style="width:100px">영화관람권</h3></table>
	     		  <table><h3 align=center><%=ticket%>장</h3></table>
	     		  </div>
	     		  <div style="margin-left:10%;text-align: center;cursor: pointer;" onclick="openGift();">
	     		  <table align=center><img src="images/myPageGift.png" width="60px" height="60px"></table>
	     		  <h3 align=center style="width:100px">선물함</h3>
	     		  <h3 align=center>
	     		  <%
	     		  	if(giftCount!=0){
	     		  %>
	     		  	<span style="color:  #9c7c07;"><%=giftCount %>건</span>
	     		  <% 		
	     		  	}else{
	     		  %>
	     		  <%=giftCount %>건
	     		  <% 		
	     		  	}
	     		  %>
	     		  </h3>
	     		  <%--  <a href="moviePost.jsp?id=<%=id %>">
	     		  <table align=center><img src="images/home03.png" width="60px" height="60px"></table>
	     		  <h3 align=center style="width:100px">무비포스트</h3>
	     		  <h3 align=center><%=sumPost %>건</h3></a> --%>
	     		  </div>
     			</div>
     			</div>
     		</div>
     		<br>
     		<div>
     			<h2 style="float: left;">나의 예매내역</h2><br><div style="text-align: right;"><a href="myPageAllMovie.jsp">전체 예매내역 보러가기-></a></div><hr><br>
     			<table class="watch_reserve" cellspacing="0">
     				<tr style="background: rgba(26,26,26,.95);text-align: center;" class="watch_reserve_tr">
     					<td>영화제목</td><td>어른</td><td>청소년</td><td>아이</td><td>관람날짜</td><td>관람시간</td><td>좌석</td><td>가격</td><td>환불신청</td>
     				</tr>
     				
     			<%
     			boolean plag=true;
     			Class.forName("org.gjt.mm.mysql.Driver");
        		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
        		String sql="select * from reserveMovie where id=? and movieUse='미사용'";
        		PreparedStatement pstmt = con.prepareStatement(sql);
        		pstmt.setString(1, id);
        		ResultSet rs = pstmt.executeQuery();
        		while(rs.next()){
        		%>	
        		<tr>
        			<td width="279px"><%=rs.getString(3) %></td><td width="90px"><%=rs.getInt(4)%>명</td>
        			<td width="90px"><%=rs.getInt(5)%>명</td><td width="90px"><%=rs.getInt(6) %>명</td>
        			<td width="120px"><%=rs.getString(7) %></td><td><%=rs.getString(8) %></td>
        			<td><%=rs.getString(10) %></td><td><%=rs.getInt(11) %></td>
        			<td><input type="button" value="환불신청" style="padding: 13px 30px;background: white;color: #524c4a	;border-radius: 10px; border: 2px solid #524c4a; cursor: pointer;" onclick="location.href='myPageDeleteReserve.jsp?no=<%=rs.getInt(1)%>'"></td>
        			
        		</tr>
        		<% 	
        			plag=false;}
     			%>
     			</table>
     			<%
     				if(plag){
     			%>
     				<div style="font-family: sans-serif;">미사용 예매내역이 없습니다.</div>
     			<% 		
     				}
     			%>
     		</div>
     		<br>
     		<div>
     			<h2 style="float: left;">나의 구매내역</h2><br><div style="text-align: right;"><a href="myPageAllSnack.jsp">전체 구매내역 보러가기-></a></div><hr><br>
     			<table class="watch_reserveSnack" cellspacing="0" style="text-align: center;">
     				<tr class="cartTableFirst" style="background: #e4bc74;">
        				<td colspan="2" width="400px">상품명</td><td width="100px">수량</td><td width="100px">구매금액</td><td>구매 날짜</td><td width="85px">사용 여부</td><td>환불신청</td>
        			</tr>
        			
     				
     			<%
     			boolean plag2=true;
     			
        		String sql2="select * from reserveSnack where id=? and snackUse='미사용'";
        		PreparedStatement pstmt2 = con.prepareStatement(sql2);
        		pstmt2.setString(1, id);
        		ResultSet rs2 = pstmt2.executeQuery();
        		while(rs2.next()){
        			int reserveSnack_no = rs2.getInt(1);
        			int snack_no = rs2.getInt(3);
        			int snackQty=rs2.getInt(4);
        			String snackUse = rs2.getString(5);
        			
        			String sql3 = "select * from  reserveSnackInfo where reserveSnack_no=?";
        			PreparedStatement pstmt3 = con.prepareStatement(sql3);
        			pstmt3.setInt(1, reserveSnack_no);
        			ResultSet rs3 = pstmt3.executeQuery();
        			rs3.next();
        			int price = rs3.getInt(6);
        			String reserveDate = rs3.getString(10);
        			
        			String sql4 = "select * from snack where snack_no =?";
        			PreparedStatement pstmt4 = con.prepareStatement(sql4);
        			pstmt4.setInt(1,snack_no);
        			ResultSet rs4 = pstmt4.executeQuery();
        			rs4.next();
        			String snackName= rs4.getString(2);
        			String snackInfo = rs4.getString(4);
        			String snackImg= rs4.getString(3);
        			
        		%>	
        		<tr>
        			<td width="75px">
        				<a href="snackDetail.jsp?snack_no=<%=snack_no%>"><img src="snackImages/<%=snackImg%>" width="100px"></a>
        			</td>
       				<td width="175px">	
        				<div style="margin: auto;"><%=snackName %><br>
        					<span style="font-family: sans-serif;font-size: 13px;"><%=snackInfo %></span>
        				</div>
       				</td>
       				<td><%=snackQty %></td><td><%=price %>원</td><td width="200px"><%=reserveDate %></td><td><%=snackUse %></td>
        			<td width="100px"><input type="button" value="환불신청" style="padding: 13px 30px;background: white;color: #524c4a	;border-radius: 10px; border: 2px solid #524c4a; cursor: pointer;" onclick="location.href='myPageDeleteSnackReserve.jsp?no=<%=reserveSnack_no%>'"></td>
        			
        		</tr>
        		<% 	
        			plag2=false;}
     			%>
     			</table>
     			<%
     				if(plag2){
     			%>
     				<div style="font-family: sans-serif;">미사용 구매내역이 없습니다.</div>
     			<% 		
     				}
     			%>
     		</div>
     	</div>
     	
     </div>
     <script>
     	var target = document.querySelector('.watch_reserve');
     	
     	if(<%=plag%>){
     		target.style.display='none';
     	}else{
     		target.style.display='block';
     	}
		var target2 = document.querySelector('.watch_reserveSnack');
     	
     	if(<%=plag2%>){
     		target2.style.display='none';
     	}else{
     		target2.style.display='block';
     	}
     </script>

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