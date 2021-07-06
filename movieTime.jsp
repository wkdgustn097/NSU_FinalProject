<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
         <script language="javascript" src="javascript/user.js"></script>
         <link rel="stylesheet" type="text/css" href="css/movie.css">
         <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
    <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
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
		int movieID = 1;
		if(request.getParameter("movieID")!=null){
			movieID = Integer.parseInt(request.getParameter("movieID"));
		}
		
		Date now = new Date();
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy.MM");
		SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd");
		int nowDate = Integer.parseInt(sdf2.format(now));
		
		 Calendar cal = Calendar.getInstance();
		 int lastDate=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		
		String dburl="jdbc:mysql://localhost:3306/movieStore";
		String dbid="root";
		String dbpassword="1234";
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		
		String sql3 = "select count(*) from movie";
		PreparedStatement pstmt3 = con.prepareStatement(sql3);
		ResultSet rs3 = pstmt3.executeQuery();
		rs3.next();
		int cnt = rs3.getInt(1);
		
		String active[] = new String[cnt];
		active[0]="active";
		
		String sql2 = "select img,movieTitle from movie where movieID=?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		pstmt2.setInt(1, movieID);
		ResultSet rs2 = pstmt2.executeQuery();
		rs2.next();
		String movieImg = rs2.getString(1);
		String movieTitle = rs2.getString(2);
		
		String sql="select movieID,movieTitle from movie  order by movieTitle";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int i=0;
		%>
		
					           <div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<a href="index.jsp"><img alt="" src="images/home.png"></a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="reserveMain.jsp">
							예매
						</a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="movieTime.jsp">
							상영 시간표
						</a>
						</div>
						</div>
						</div>
      		<div class="container">
      			<div class="time-table-title">
      				<div style="width: 78%; float: left;">
      					<div style="padding: 20px 20px 5px 20px; font-size: 20px;">현재상영작</div><hr>
      					<ul>
      					<%
      						while(rs.next()){
      							if(rs.getInt(1)==movieID){
      								active[i]="class=active";
      							}else{
      								active[i]="";
      							}
      					%>		
      				
      				<li <%= active[i]%>><a href="movieTime.jsp?movieID=<%=rs.getInt(1)%>"><%=rs.getString(2) %></a></li>		
      					<% 
      							i++;
      						}
      					%>
      					</ul>
      					
      				</div>
      				<div>
      					<img class="moviimg" alt="" src="movieImages/<%=movieImg%>" style="width: 22%;float: left;">
      				</div>
      			</div>
      			<div style="clear: both;"></div>
      			
      			<br><br>
      			<h2 style="text-align: left;color:rgba(26,26,26,.95)"><%=movieTitle %> <span style="color:#444;">상영시간표</span></h2>
				      			
				      			 <div class="reserve-container">
				      
				        <div class="day-part">
				            <div class="reserve-title"><%=sdf.format(now) %></div>
				            <div class="reserve-date">
				            	<%	
				            		int movieDay = nowDate;
				            		if(request.getParameter("day")!=null){
				            			movieDay = Integer.parseInt(request.getParameter("day"));
				            		}
				            		for(int j=nowDate;j<=lastDate;j++){
				            			String inputDate = sdf4.format(now)+"-"+j;
				            			Date date = new Date();
				            			String date2 = sdf2.format(date).toString();
				            			
				            			
				            			String day = "" ;
				            		     
				            		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
				            		    Date nDate = dateFormat.parse(inputDate) ;
				            		     
				            		    Calendar cal2 = Calendar.getInstance() ;
				            		    cal2.setTime(nDate);
				            		     
				            		    int dayNum = cal2.get(Calendar.DAY_OF_WEEK) ;
				            		     
				            		     
				            		     
				            		    switch(dayNum){
				            		        case 1:
				            		            day = "일";
				            		            break ;
				            		        case 2:
				            		            day = "월";
				            		            break ;
				            		        case 3:
				            		            day = "화";
				            		            break ;
				            		        case 4:
				            		            day = "수";
				            		            break ;
				            		        case 5:
				            		            day = "목";
				            		            break ;
				            		        case 6:
				            		            day = "금";
				            		            break ;
				            		        case 7:
				            		            day = "토";
				            		            break ;
				            		             
				            		    }
				            		     

				            			
				            	%>
				            		
				            		<%
				            			if(day.equals("토")){
				            		%>
				            			<button class="movie-date-wrapper" id="active<%=j%>" onclick="location.href='movieTime.jsp?day=<%=j%>&movieID=<%=movieID%>';" ">
					            			<span class="movie-week-of-day  saturday"><%=day%></span>
						            		<span class="movie-day  saturday"><%=j %></span> 
				            			</button>
				            		<% 		
				            			}else if(day.equals("일")){
				            		%>
				            			<button class="movie-date-wrapper" id= "active<%=j%>" onclick=" location.href='movieTime.jsp?day=<%=j%>&movieID=<%=movieID%>';" >
					            			<span class="movie-week-of-day  sunday"><%=day%></span>
						            		<span class="movie-day  sunday"><%=j %></span> 
				            			</button>
				            		<% 		
				            			}else{
				            		%>
				            			<button class="movie-date-wrapper" id="active<%=j%>" onclick=" location.href='movieTime.jsp?day=<%=j%>&movieID=<%=movieID%>';" ">
					            			<span class="movie-week-of-day"><%=day%></span>
						            		<span class="movie-day"><%=j %></span> 
				            			</button>
				            		<%		
				            			}
				            		%> 
					            		
				            	<% 		
				            		}
				            	%>
				            </div>
				        </div>
      		</div>
      		<br><br>
      		<div style="text-align: left;">
      		  <%
				            	String sql4 = "select * from movieTime where movieID=?";
				            	PreparedStatement pstmt4 = con.prepareStatement(sql4);
				            	pstmt4.setInt(1, movieID);
				            	ResultSet rs4 = pstmt4.executeQuery();
				            	while(rs4.next()){
				            		String reserveDate = sdf4.format(now)+"-"+movieDay;
				            		String sql5 = "select count(*) from reservemovie where movieTitle=? and movieDate=? and movieTime=?";
				            		PreparedStatement pstmt5 = con.prepareStatement(sql5);
				            		pstmt5.setString(1, movieTitle);
				            		pstmt5.setString(2, reserveDate);
				            		pstmt5.setString(3, rs4.getString(2));
				            		ResultSet rs5 = pstmt5.executeQuery();
				            		int cntSeat = 60;
				            		if(rs5.next()){
				            			cntSeat = rs5.getInt(1);
				            		}
				            		
				            %>		
				            		
				            	 	<div class="movie-time-btn" onclick="location.href='reserveMain.jsp?movieID=<%=movieID%>&day=<%=movieDay%>&movieTime=<%=rs4.getString(2)%>'">
				            	 		<%=rs4.getString(2) %><br>
				            	 		<span style="color:rgba(26,26,26,.95);text-align: center;"><%=60-cntSeat %>석</span>
				            	 	
				            	 	</div>
				            <% 
				            	}
				            %>
			</div>            
      			
      	</div>
     
       <script>
       var target =  document.getElementById("active<%=movieDay%>");
       target.classList.add("movie-date-wrapper-active");
       
      
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