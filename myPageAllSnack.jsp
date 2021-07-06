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
         <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
    <body>
         <%
        	String id= (String)session.getAttribute("sid");
	     	String dburl="jdbc:mysql://localhost:3306/movieStore";
	    	String dbid="root";
	    	String dbpassword="1234";
	    	
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
  
            <div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<a href="index.jsp"><img alt="" src="images/home.png"></a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="myPageHome.jsp">
							마이페이지
						</a>
                        <img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="myPageAllSnack.jsp">
							전체 구매 내역
						</a>
						
					</div>
				</div>
			</div>
  
		<div class="container" style="text-align: center;">
		<h1 style="text-align: left;">전체 구매 내역</h1>
	      <br>
			<%
				try{
					Class.forName("org.gjt.mm.mysql.Driver");
	        		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	        		String sql = "select * from reserveSnack where id=?";
	        		PreparedStatement pstmt = con.prepareStatement(sql);
	        		pstmt.setString(1, id);
	        		ResultSet rs = pstmt.executeQuery();
	        		if(!rs.next()){
	        %>
	        		<div class="noMovieReserve">
	        		구매내역이 없습니다.<br>
	        		<a href="snackStore.jsp">구매하러가기 &nbsp;<img src="images/ico-arr-right-gray.png" width="15px" ></a>
	        		</div>
	        	
	        <% 			
	        		}else{
	        %>
	        		<table class="watch_reserve" cellspacing="0">
     				<tr class="cartTableFirst watch_reserve_tr" >
        				<td colspan="2" width="400px">상품명</td><td width="100px">수량</td><td width="100px">구매금액</td><td>구매 날짜</td><td>사용 여부</td><td>결제방법</td>
        			</tr>
        			
	        
	        <%			
	        		
		        		String sql2 = "select * from reserveSnack where id=?";
		        		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		        		pstmt2.setString(1, id);
		        		ResultSet rs2 = pstmt2.executeQuery();
		        		while(rs2.next()){
							String sql3 = "select item,reserveDate,price from reservesnackinfo where reserveSnack_no=?";
							PreparedStatement pstmt3 = con.prepareStatement(sql3);
							pstmt3.setInt(1, rs2.getInt(1));
							ResultSet rs3 = pstmt3.executeQuery();
							rs3.next();
							String item = rs3.getString(1);
							String date = rs3.getString(2);
							int price = rs3.getInt(3);
							
							String sql4 = "select snackName,snackImg,snackInfo from snack where snack_no=?";
							PreparedStatement pstmt4 = con.prepareStatement(sql4);
							pstmt4.setInt(1, rs2.getInt(3));
							ResultSet rs4 = pstmt4.executeQuery();
							rs4.next();
							String snackName = rs4.getString(1);
							String snackImg = rs4.getString(2);
							String snackInfo = rs4.getString(3);
			%>
					<tr>
	        			<td width="75px">
	        				<a href="snackDetail.jsp?snack_no=<%=rs2.getInt(3)%>"><img src="snackImages/<%=snackImg%>" width="100px"></a>
	        			</td>
	       				<td width="175px">	
	        				<div style="margin: auto;"><%=snackName %><br>
	        					<span style="font-family: sans-serif;font-size: 13px;"><%=snackInfo %></span>
	        				</div>
	       				</td>
	       				<td><%=rs2.getInt(4) %></td><td><%=price %>원</td><td width="200px"><%=date %></td><td><%=rs2.getString(5) %></td>
	        			<td><%=item %></td>
        			</tr>
			<% 				
		        		}
	        		}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
			
			</table><br><br>
			<input type="button" value="돌아가기" onclick="location.href='myPageHome.jsp'" style="padding: 13px 30px;background: white;color: #524c4a	;border-radius: 10px; border: 2px solid #524c4a; cursor: pointer;"/>
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