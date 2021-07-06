<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
         <script language="javascript" src="javascript/user.js"></script>
         <script language="javascript" src="javascript/snack.js"></script>
         <link rel="stylesheet" type="text/css" href="css/snack.css">
         <link rel="stylesheet" type="text/css" href="css/movie.css">
         <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
    <body >
         <%
        	String id= (String)session.getAttribute("sid");
        	if(id==null){
        		id="Guest";
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
		String dburl="jdbc:mysql://localhost:3306/movieStore";
		String dbid="root";
		String dbpassword="1234";
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		
		
	%>
	
      <div class="backi"></div>
      <div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<a href="index.jsp"><img alt="" src="images/home.png"></a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="snackStore.jsp">
							스토어
						</a>

						
					</div>
				</div>
			</div>
           	<div class="category" style="margin-top: 50px;">
				<div style="margin: auto;width: 1400px;" class="faq_icon">
				<ul>
				
				<li><a href="snackStore.jsp#No5">관람권&nbsp;</a>&nbsp;&nbsp;</li>
				<li><a href="snackStore.jsp#No1">콤보&nbsp;</a>&nbsp;&nbsp;</li>
				<li><a href="snackStore.jsp#No2">팝콘&nbsp;</a>&nbsp;&nbsp;</li>
				<li><a href="snackStore.jsp#No3">음료&nbsp;</a>&nbsp;&nbsp;</li>
				<li><a href="snackStore.jsp#No4">사이드&nbsp;</a>&nbsp;&nbsp;</li>
				</ul>
				</div>
            </div>
      <div class="container" style="width: 1200px;">
      	<!-- <div><h2>스낵/음료</h2></div>
		<hr style="border: solid 1px; width:42%; text-align: left;"> <br><br> -->
     	 
     	  <div class="snacktext" id="No5"> 
			<h2>관람권</h2>
			<p class="tx" style="margin-left: 94px;">즐거운 경험은 2NE1에서!</p>
	     </div>
      	<hr style="border: solid 1px #DEDEDE; width:50%; text-align: left;">
      	<div style="text-align: left;">* 영화관람권은 <span style="color:#ff7787">환불</span>이 되지 않습니다.</div>
      	 <br><br>
      	<div class="snack">
     	 <%
			try{
				String sql="select * from snack where snackCtg=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"ticket");
				ResultSet rs = pstmt.executeQuery();
				int i=1;
				while(rs.next()){
					if(i==4){
		%>	
						<br>
					<div style="clear: both;">
						<a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
							<div class="snack1">
								<div>
									<img src="snackImages/<%=rs.getString(3) %>" width="100%" >
								</div>
								<div class="snack2">
									<%=rs.getString(2) %><br>
									<span><%=rs.getString(4) %></span>
								</div>
								<div class="snack3">
									<hr>
									<%=rs.getInt(6) %>원
								</div>
							</div>
						</a>
					</div>
		<% 				
					}else{
		%>
				<a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
				<div class="snack1">
					<div>
						<img src="snackImages/<%=rs.getString(3) %>" width="100%" >
					</div>
					<div class="snack2">
						<%=rs.getString(2) %><br>
						<span><%=rs.getString(4) %></span>
					</div>
					<div class="snack3">
						<hr>
						<%=rs.getInt(6) %>원
					</div>
				</div>
				</a>
		<% 			
						
					}
				i++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
      	%>
      	</div>
      	
      	
      	<div class="rhksfka"><h2 style="font-size: 19px;font-family: fantasy;line-height: 52px;"> ※영화 관람권으로 영화 예매를 할 시에,
      	<br> 성인기준(12000원)으로 영화 예매를 하는것 보다 2000원을 할인받으실 수 있습니다.<br>
그러나 2+1의 혜택이 적용되지 않고, 포인트 적립이 되지 않습니다.<br>
선물하기를 통해 지인에게 따듯한 마음을 나눠보세요!</h2>
	
		</div>
    
     	 
     	 <div class="snacktext" id="No1"> 
			<h2>콤보</h2>
			<p class="tx">저렴하게 먹는 즐거움!</p>
	     </div>
      	<hr style="border: solid 1px #DEDEDE; width:50%; text-align: left;"> <br><br>
      	<div class="snack">
      	<%
			try{
				String sql="select * from snack where snackCtg=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"package");
				ResultSet rs = pstmt.executeQuery();
				int i=1;
				while(rs.next()){
					if(i==4){
		%>	
						<br>
					<div style="clear: both;">
						<a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
							<div class="snack1">
								<div>
									<img src="snackImages/<%=rs.getString(3) %>" width="100%">
								</div>
								<div class="snack2">
									<%=rs.getString(2) %><br>
									<span><%=rs.getString(4) %></span>
								</div>
								<div class="snack3">
									<hr>
									<%=rs.getInt(6) %>원
								</div>
							</div>
						</a>
					</div>
		<% 				
					}else{
		%>
				<a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
				<div class="snack1">
					<div>
						<img src="snackImages/<%=rs.getString(3) %>" width="100%">
					</div>
					<div class="snack2">
						<%=rs.getString(2) %><br>
						<span><%=rs.getString(4) %></span>
					</div>
					<div class="snack3">
						<hr>
						<%=rs.getInt(6) %>원
					</div>
				</div>
				</a>
		<% 			
						
					}
				i++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
      	%>
      	</div>
		
		      	
      	<div class="snacktext" id="No2"> 
			<h2>팝콘</h2>
			<p class="tx">영화 볼 때 팝콘은 필수인 거 아시죠?</p>
	     </div>
      	<hr style="border: solid 1px #DEDEDE; width:50%; text-align: left;"> <br><br>
      	<div class="snack">
      	<%
			try{
				String sql="select * from snack where snackCtg=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"popcorn");
				ResultSet rs = pstmt.executeQuery();
				int i=1;
				while(rs.next()){
					if(i==4){
		%>	
						<br>
					<div style="clear: both;">
						<a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
							<div class="snack1">
								<div>
									<img src="snackImages/<%=rs.getString(3) %>" width="100%">
								</div>
								<div class="snack2">
									<%=rs.getString(2) %><br>
									<span><%=rs.getString(4) %></span>
								</div>
								<div class="snack3">
									<hr>
									<%=rs.getInt(6) %>원
								</div>
							</div>
						</a>
					</div>
		<% 				
					}else{
		%>
				<a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
				<div class="snack1">
					<div>
						<img src="snackImages/<%=rs.getString(3) %>" width="100%">
					</div>
					<div class="snack2">
						<%=rs.getString(2) %><br>
						<span><%=rs.getString(4) %></span>
					</div>
					<div class="snack3">
						<hr>
						<%=rs.getInt(6) %>원
					</div>
				</div>
				</a>
		<% 			
						
					}
				i++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
      	%>
      	</div><br><br>
      	
      	
      	
      	<div class="snacktext" id="No3"> 
			<h2>음료</h2>
			<p class="tx">마시는 즐거움!</p>
	     </div>
      	<hr style="border: solid 1px #DEDEDE; width:50%; text-align: left;"> <br><br>
      	<div class="snack">
      	<%
			try{
				String sql="select * from snack where snackCtg=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"drink");
				ResultSet rs = pstmt.executeQuery();
				int i=1;
				while(rs.next()){
					if(i==5){
		%>	
						<br>
					<div style="clear: both;">
						<a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
							<div class="snack1">
								<div>
									<img src="snackImages/<%=rs.getString(3) %>" width="100%">
								</div>
								<div class="snack2">
									<%=rs.getString(2) %><br>
									<span><%=rs.getString(4) %></span>
								</div>
								<div class="snack3">
									<hr>
									<%=rs.getInt(6) %>원
								</div>
							</div>
						</a>
					</div>
		<% 				
					}else{
		%>
				<a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
				<div class="snack1">
					<div>
						<img src="snackImages/<%=rs.getString(3) %>" width="100%">
					</div>
					<div class="snack2">
						<%=rs.getString(2) %><br>
						<span><%=rs.getString(4) %></span>
					</div>
					<div class="snack3">
						<hr>
						<%=rs.getInt(6) %>원
					</div>
				</div>
				</a>
		<% 			
						
					}
				i++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
      	%>
      	</div><br><br>
      	
      	
      	<div class="snacktext" id="No4"> 
			<h2>사이드</h2>
			<p class="tx" style="margin-left: 94px;">스낵과 함께 영화를 보면 재미가 두 배!</p>
	     </div>
      	<hr style="border: solid 1px #DEDEDE; width:50%; text-align: left;"> <br><br>
      	<div class="snack">
      	<%
			try{
				String sql="select * from snack where snackCtg=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"side");
				ResultSet rs = pstmt.executeQuery();
				int i=1;
				while(rs.next()){
					if(i==4){
		%>	
						<br>
					<div style="clear: both;">
						<a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
							<div class="snack1">
								<div>
									<img src="snackImages/<%=rs.getString(3) %>" width="100%">
								</div>
								<div class="snack2">
									<%=rs.getString(2) %><br>
									<span><%=rs.getString(4) %></span>
								</div>
								<div class="snack3">
									<hr>
									<%=rs.getInt(6) %>원
								</div>
							</div>
						</a>
					</div>
		<% 				
					}else{
		%>
				<a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
				<div class="snack1">
					<div>
						<img src="snackImages/<%=rs.getString(3) %>" width="100%">
					</div>
					<div class="snack2">
						<%=rs.getString(2) %><br>
						<span><%=rs.getString(4) %></span>
					</div>
					<div class="snack3">
						<hr>
						<%=rs.getInt(6) %>원
					</div>
				</div>
				</a>
		<% 			
						
					}
				i++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
      	%>
      	</div><br><br>
      	
      	
      	
      	<div style="clear: both;"></div>
      	
      </div>
      <div class="ctgFixed">
      	<ul>
      		<li><a href="#No5">관람권</a></li>
      		<li><a href="#No1">콤보</a></li>
      		<li><a href="#No2">팝콘</a></li>
      		<li><a href="#No3">음료</a></li>
      		<li><a href="#No4">사이드</a></li>
      	</ul>
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