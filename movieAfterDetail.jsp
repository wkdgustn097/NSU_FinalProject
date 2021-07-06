<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype htm1>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/movie.css">
        <script src="javascript/movie.js"></script>
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>
        $(document).ready(function(){
            $('.slider').bxSlider({
          		touchEnabled : false,
          		auto: true, speed: 500, pause: 4000

            });
            
          });
          
          </script>
         <style>
         	.bx-wrapper{
         		-webkit-box-shadow:none !important;
         		box-shadow: 0 !important;
         		border: none !important;
         		background: none !important;
         	}
         </style>
    </head>
    

        <body onLoad="summary();">
        <%	
        	
        	
        	String id= (String)session.getAttribute("sid");
        	if(id==null){
        		id="Guest";
        	}
        	
        	
        	int  movieID =Integer.parseInt(request.getParameter("movieID"));
        	String movieTitle="";
        	int click=0;
        	
        	String dburl="jdbc:mysql://localhost:3306/movieStore";
        	String dbid="root";
        	String dbpassword="1234";
        	
        	try {
        		Class.forName("org.gjt.mm.mysql.Driver");
        		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
        		String sql="select * from movieAfter where movieID=?";
        		PreparedStatement pstmt = con.prepareStatement(sql);
        		pstmt.setInt(1,movieID);
        		ResultSet rs = pstmt.executeQuery();
        		if(rs.next()){
        			 movieTitle=rs.getString(2);
        			String director = rs.getString(3);
        			String producer=rs.getString(4);
        			String actor=rs.getString(5);
        			String genre = rs.getString(6);
        			String basic = rs.getString(7);
        			String premiere = rs.getString(8);
        			String img= rs.getString(9);
        			String steel1 = rs.getString(10);
        			String steel2 = rs.getString(11);
        			String steel3 = rs.getString(12);
        			String summary = rs.getString(13);
        			String iframe = rs.getString(14);
        			String grade = rs.getString(15);
        			int love= rs.getInt(16);
        			
        			
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
  
  
            <div class="container">
            <h2 style=" text-align: left">영화상세</h2>
            <hr style="border: solid 1px; width:42%; text-align: left;"> <br>
            	<div class="mainImg" style="width: 30%;">
            		<img alt="" src="movieAfterImages/<%=img%>" width="220px" height="330px">
            	</div>
            	<div class="movieInfo" style="width: 50%;">
            		
            		<h2><%=movieTitle %></h2>
            		
            		
            		<br>
            		<hr>
            		
            		<ul>
            			<li>감독 : <%=director %>&nbsp;/ &nbsp;프로듀서 : <%=producer %>&nbsp;/&nbsp; 배우 : <%=actor %></li>
            			<li>장르 : <%=genre %>&nbsp;/ &nbsp;기본 : <%=basic %></li>
            			<li>개봉 : <%=premiere %></li>
            		</ul>
            		<div style="width: 100px;padding: 0;margin-top: 10px;" class="loveMovie" onclick="location.href='movieAfterLoveAction.jsp?movieID=<%=movieID%>'">♡  <%=love %></div> 
            		<br>
            		
            		
            	</div>
            	<div style="clear: both;"></div>
            	<div class="summary">
            	<div style="width: 49%;display: inline-block;overflow: auto;height: 309px;font-family: Roboto;">
            	<span style="font-family: Roboto;font-size: 24px;color: #c9a524; text-align: center;">Summary</span><br><br><%=summary %>
            	</div>
            	<iframe width="49%" height="33%" src="<%=iframe %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					
            	</div>
            	
            	<br><br><br><h2><span style="color: #02793D;">스틸컷</span></h2><br><br><hr style="border-bottom: 1px solid #610B4B;"><br><br>
            		
	            	<div class="slider" >
	                	<div><img src="movieAfterImages/<%=steel1%>"  height="100%" style="margin: auto !important;"/></div>
	                <%
	                	if(steel2!=null){
	                %>
	                	<div><img src="movieAfterImages/<%=steel2%>"  height="100%" style="margin: auto !important;"/></div>
	                <% 		
	                	}if(steel3!= null){
	                %>
	                	 <div><img src="movieAfterImages/<%=steel3%>"  height="100%" style="margin: auto !important;"/></div>
	                <% 		
	                	}
	                %>
	               
                	</div>
            	<br><br><hr style="border-bottom: 1px solid #610B4B;"><br><br><br>
            
            </div>

            <%
				}
        		
        		rs.close();
        		pstmt.close();
        		con.close();
        		
        	}catch(Exception e){
        		e.printStackTrace();
        	}
        	
        	
            %>
            
        
            	
            	
            
            
             <script>
	          	function summary(){
	          		document.summary1.location='movieAfterSummary.jsp?movieID='+'<%=movieID%>';
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