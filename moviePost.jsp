<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
         <script language="javascript" src="javascript/movie.js"></script>
         <link rel="stylesheet" type="text/css" href="css/movie.css">
         <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
    <script>
    function hidden2(){
		var hide=document.querySelector("#hide");
		var hid=document.querySelectorAll(".hidden");
		var i=0;
		var check=0;
		if(hide.value=='접어보기'){
			for(var i=0;i<hid.length;i++){
				hid[i].style.display="none";
			}
			hide.value='더보기';
		}else{
			for(var i=0;i<hid.length;i++){
				if(check>=20){
					return;
				}
				if(hid[i].style.display=="none"){
				hid[i].style.display="inline-block";
				check++;
				}
			}
			if(hid[hid.length-1].style.display=="inline-block"){
			hide.value='접어보기';
			}
		}
	}
    </script>
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
      	request.setCharacterEncoding("UTF-8");
		String dburl="jdbc:mysql://localhost:3306/movieStore";
		String dbid="root";
		String dbpassword="1234";
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		
		String sql = "select count(*) from moviePost where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		int myCount=0;
		int i=1;
		
		if(rs.next()){
			myCount=rs.getInt(1);
		}
		
		String sql2 = "select * from moviePostCount order by count desc limit 5";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		ResultSet rs2 = pstmt2.executeQuery();
		
	%>
      
      <div class="post-lank-box" style="background: url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-post-top.png) no-repeat center 0;">
      	<div class="inner-wrap">
      		<h2 class="tit">무비포스트</h2>
      		<ol class="post-lank">
      <%
      	while(rs2.next()){
      		String sql3 = "select img from movie where movieTitle=?";
      		PreparedStatement pstmt3= con.prepareStatement(sql3);
      		pstmt3.setString(1, rs2.getString(2));
      		ResultSet rs3 = pstmt3.executeQuery();
      		rs3.next();
      		String movieImg = rs3.getString(1);
      %>
      		<li>
 				<a href="moviePost.jsp?movieCountNo=<%=rs2.getInt(1) %>" class="top5Btn">
 				<p class="lank"><%=i %></p>
 				<div class="post-count">
 					<p class="tit">POST</p>
 					<p class="count"><%= rs2.getInt(3)%></p>
 				</div>
 				<p class="img">
 					<img src="movieImages/<%=movieImg %>" width="135px">
 				</p>
 				</a>
 			</li>
      <% 		
      	i++;}
      %>
      
      			
      		</ol>
      		<div class="mypost-box">
      		<%
      			if(!id.equals("Guest")){
	      				if(myCount!=0){
	      		%>
	      			<a href="moviePost.jsp?id=<%=id%>">
					<div class="after">
						<p class="lank">MY</p>
						<div class="post-count">
							<p class="tit">MY POST</p>
							<p class="count"><%=myCount %></p>
						</div>
					</div>	
					  </a>    		
	      		<% 		
	      				}else{
	      		%>
	      				<div class="after">
						<p class="lank">MY</p>
						<div class="post-count">
							<p class="tit">MY POST</p>
							<p class="count"><%=myCount %></p>
						</div>
						</div>
	      		<% 			
	      				}
      				}else{
      		%>
      			<div class="before">
      				<div class="post-count">
      				<p class="tit">MY POST</p>
      				<a href="login.jsp" class="txt-login">로그인 하기</a>
      				</div>
      			</div>
      		<% 		
      			}
      		%>
      			
      		</div>
      		<div class="add-post">
      			<a href="moviePostWrite.jsp">무비포스트 작성</a>
      		</div>
      	</div>
      </div>
      <script>
	      var ul = document.getElementsByClassName('post-lank')[0];
	      var lis = ul.getElementsByTagName('li');
	      lis[0].addEventListener('mouseover',function(){
    		 lis[0].getElementsByClassName('post-count')[0].style.opacity='0'; 
    	  });
    	  lis[0].addEventListener('mouseout',function(){
    		  lis[0].getElementsByClassName('post-count')[0].style.opacity='1'; 
	    	  });
    	  lis[1].addEventListener('mouseover',function(){
     		 lis[1].getElementsByClassName('post-count')[0].style.opacity='0'; 
     	  });
     	  lis[1].addEventListener('mouseout',function(){
     		  lis[1].getElementsByClassName('post-count')[0].style.opacity='1'; 
 	    	  });
     	 lis[2].addEventListener('mouseover',function(){
     		 lis[2].getElementsByClassName('post-count')[0].style.opacity='0'; 
     	  });
     	  lis[2].addEventListener('mouseout',function(){
     		  lis[2].getElementsByClassName('post-count')[0].style.opacity='1'; 
 	    	  });
     	 lis[3].addEventListener('mouseover',function(){
     		 lis[3].getElementsByClassName('post-count')[0].style.opacity='0'; 
     	  });
     	  lis[3].addEventListener('mouseout',function(){
     		  lis[3].getElementsByClassName('post-count')[0].style.opacity='1'; 
 	    	  });
     	 lis[4].addEventListener('mouseover',function(){
     		 lis[4].getElementsByClassName('post-count')[0].style.opacity='0'; 
     	  });
     	  lis[4].addEventListener('mouseout',function(){
     		  lis[4].getElementsByClassName('post-count')[0].style.opacity='1'; 
 	    	  });
     	 
     	 
      </script>
	<%
		String movieCountNo = request.getParameter("movieCountNo");
		String my = request.getParameter("id");
		String order = request.getParameter("order");
		
		
		String[] checked = new String[3];
		checked[0]="";checked[1]="";checked[2]="";
		if(order==null){
			checked[0]="class=post-ctg-checked";
		}else if(order.equals("recent")){
			checked[1]="class=post-ctg-checked";
		}else if(order.equals("love")){
			checked[2]="class=post-ctg-checked";
		}
		if(order==null){
			order="recent";
		}
		String movieTitle="";
		if(movieCountNo!=null){
			String sql5 = "select * from moviePostCount where no = ?";
			PreparedStatement pstmt5 = con.prepareStatement(sql5);
			pstmt5.setString(1, movieCountNo);
			ResultSet rs5 = pstmt5.executeQuery();
			rs5.next();
			movieTitle=rs5.getString(2);
		}
		
		String sql4="";
		PreparedStatement pstmt4=null;
		if(movieCountNo!=null&&my==null){
			sql4 = "select count from moviepostcount where movieTitle=?";
			pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1, movieTitle);
		}else if(movieCountNo==null&&my!=null){
			sql4 = "select count(*) from moviePost where id=?";
			pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1, my);
		}else if(movieCountNo==null&&my==null){
			sql4 = "select sum(count) from moviePostCount";
			pstmt4=con.prepareStatement(sql4);
		}
		ResultSet rs4 = pstmt4.executeQuery();
		int allPost=0;
		if(rs4.next()){
			allPost=rs4.getInt(1);
		}
			
		String sql6="";
		PreparedStatement pstmt6=null;
		if(movieCountNo!=null&&my==null&&order.equals("recent")){
			sql6 = "select * from moviepost where movieTitle=? order by time desc";
			pstmt6=con.prepareStatement(sql6);
			pstmt6.setString(1, movieTitle);
		}else if(movieCountNo!=null&&my==null&&order.equals("love")){
			sql6 = "select * from moviepost where movieTitle=? order by love desc";
			pstmt6=con.prepareStatement(sql6);
			pstmt6.setString(1, movieTitle);
		}else if(movieCountNo==null&&my!=null&&order.equals("recent")){
			sql6="select * from moviepost where id=? order by time desc";
			pstmt6=con.prepareStatement(sql6);
			pstmt6.setString(1, my);
		}else if(movieCountNo==null&&my!=null&&order.equals("love")){
			sql6="select * from moviepost where id=? order by love desc";
			pstmt6=con.prepareStatement(sql6);
			pstmt6.setString(1, my);
		}else if(movieCountNo==null&&my==null&&order.equals("recent")){
			sql6="select * from moviepost  order by time desc";
			pstmt6=con.prepareStatement(sql6);
		}else if(movieCountNo==null&&my==null&&order.equals("love")){
			sql6="select * from moviepost order by love desc";
			pstmt6=con.prepareStatement(sql6);
		}
		ResultSet rs6 = pstmt6.executeQuery();
		
	%>
	               					           <div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<a href="index.jsp"><img alt="" src="images/home.png"></a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="movieAll.jsp">
							영화
						</a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="moviePost.jsp">
							무비 포스터
						</a>
						</div>
						</div>
						</div>
      
      <div class="container">
      	<div style="text-align: left;">
      		전체 <%=allPost %>건 
      		<span style="float: right;position: relative;right: 30px;" class="movie-post-ctg">
      			<a href="moviePost.jsp" <%=checked[0] %>>전체보기</a>&nbsp;|
      		<%
      			if(movieCountNo!=null&&my==null){
      		%>
      			<a href="moviePost.jsp?movieCountNo=<%=movieCountNo %>&order=recent" <%=checked[1] %>>최신순</a>&nbsp;|
      			<a href="moviePost.jsp?movieCountNo=<%=movieCountNo %>&order=love" <%=checked[2] %>>공감순</a>
      		<% 		
      			}else if(movieCountNo==null&&my!=null){
      		%>
      			<a href="moviePost.jsp?id=<%=my %>&order=recent" <%=checked[1] %>>최신순</a>&nbsp;|
      			<a href="moviePost.jsp?id=<%=my %>&order=love" <%=checked[2] %>>공감순</a>
      		<% 		
      			}else if(movieCountNo==null&&my==null){
      		%>		
      			<a href="moviePost.jsp?order=recent" <%=checked[1] %>>최신순</a>&nbsp;|
      			<a href="moviePost.jsp?order=love" <%=checked[2] %>>공감순</a>
      		<%
      			}
      		%>
      			
      		</span>
      	</div><br>
      	<div class="movie-post-list">
      		<%
      			int k=1;
      			while(rs6.next()){
      				String sql7 = "select movieID from movie where movieTitle=?";
      				PreparedStatement pstmt7 = con.prepareStatement(sql7);
      				pstmt7.setString(1, rs6.getString(3));
      				ResultSet rs7 = pstmt7.executeQuery();
      				rs7.next();
      				int movieID= rs7.getInt(1);
      				if(k>10){
      		%>
      		<div class="grid-item hidden">
      			<div  class="post-item">
      				<div class="post-item-img" onclick="openPostView('<%=rs6.getString(1)%>');">
      					<img src="movieImages/<%=rs6.getString(4) %>" width="255px"style="min-height: 169px;">
      				</div>
      				<div class="post-item-tit">
      					
      					<a href="movieDetail.jsp?movieID=<%=movieID %>"><span class="title"><%=rs6.getString(3) %></span></a><br>
      					<span class="summary" onclick="openPostView('<%=rs6.getString(1)%>');"><%=rs6.getString(5) %></span>
      					<div style="line-height: 1.8;margin-top: 10px;">
      						<a href="moviePost.jsp?id=<%=rs6.getString(2)%>" ><%=rs6.getString(2) %></a><br>
	      					<span><%=rs6.getString(7).substring(0, 11) %></span>
	      					<div style="margin-top: 8px;">
	      						<a href="moviePostLoveAction.jsp?no=<%=rs6.getInt(1)%>">
	      							<img src="images/ico-like.png">&nbsp;<span style="font-family: sans-serif;"><%=rs6.getString(6) %></span>
	      						</a>
	      					</div>
      					</div>
      				</div>
      			</div>
      		</div>
      		<% 			
      				k++;}else{
      		%>
      			<div class="grid-item">
      			<div  class="post-item">
      				<div class="post-item-img" onclick="openPostView('<%=rs6.getString(1)%>');">
      					<img src="movieImages/<%=rs6.getString(4) %>" width="258px"style="min-height: 169px;">
      				</div>
      				<div class="post-item-tit">
      					
      					<a href="movieDetail.jsp?movieID=<%=movieID %>"><span class="title"><%=rs6.getString(3) %></span></a><br>
      					<span class="summary" onclick="openPostView('<%=rs6.getString(1)%>');"><%=rs6.getString(5) %></span>
      					<div style="line-height: 1.8;margin-top: 10px;">
      						<a href="moviePost.jsp?id=<%=rs6.getString(2)%>"><%=rs6.getString(2) %></a><br>
	      					<span><%=rs6.getString(7).substring(0, 11) %></span>
	      					<div style="margin-top: 8px;">
	      						<a href="moviePostLoveAction.jsp?no=<%=rs6.getInt(1)%>">
	      							<img src="images/ico-like.png">&nbsp;<span style="font-family: sans-serif;"><%=rs6.getString(6) %></span>
	      						</a>
	      					</div>
      					</div>
      				</div>
      			</div>
      		</div>
      		<% 			
      				k++;}
      		%>
      		
      		<%		
      			}
      		%>
      	</div>
      	<input type="button" onclick="hidden2();" id="hide" value="더보기" style="width: 100%; font-size: 18px;background: url(/images/gnb-bg.png);cursor: pointer;">
      </div>
      
     
     <script>
     var hid=document.querySelectorAll(".hidden");
		for(var i=0;i<hid.length;i++){
			hid[i].style.display="none";
		}
		
     </script>
    
      


      <section class="footer">
                <div class="wrapper">
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