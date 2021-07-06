<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype htm1>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
        
        
       <link rel="stylesheet" type="text/css" href="css/layout.css">
       <link rel="stylesheet" type="text/css" href="css/movie.css">
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
         	.bx-viewport {
			    height: 470px !important;
			}
			.bx-wrapper .bx-pager {
			 display:none !important;
			}
       </style>
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
					hid[i].style.display="block";
					check++;
					}
				}
				if(hid[hid.length-1].style.display=="block"){
				hide.value='접어보기';
				}
			}
		}
		
		 $(function(){
	          var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
	          sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
	           sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
	           $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
	          })
	         })
	</script>
        
        <%	
        	
        	request.setCharacterEncoding("utf-8");
        	String id= (String)session.getAttribute("sid");
        	if(id==null){
        		id="Guest";
        	}
        	
        	
        	
        	int count=0;
        	int countCg[]=new int[5];
        	String CgTag[]={"액션","SF","드라마","코미디","공포"};
        	int i=0;
        	String dburl="jdbc:mysql://localhost:3306/movieStore";
        	String dbid="root";
        	String dbpassword="1234";
        	
        	try {
        		Class.forName("org.gjt.mm.mysql.Driver");
        		Connection con2=DriverManager.getConnection(dburl,dbid,dbpassword);
        		String sql2="select count(*) from movie";
        		PreparedStatement pstmt2 = con2.prepareStatement(sql2);
        		ResultSet rs2 = pstmt2.executeQuery();
        		if(rs2.next()){
        			count=rs2.getInt(1);
        		}}catch(Exception e){
        			e.printStackTrace();
        		}
        	
        	try{
        		Class.forName("org.gjt.mm.mysql.Driver");
        		Connection con2=DriverManager.getConnection(dburl,dbid,dbpassword);
        		for(int j=0;j<countCg.length;j++){
        			String sql0 = "select count(*) from movie where genre=?";
        			PreparedStatement pstmt0 = con2.prepareStatement(sql0);
        			pstmt0.setString(1, CgTag[j]);
        			ResultSet rs0 = pstmt0.executeQuery();
        			if(rs0.next()){
        				countCg[j]=rs0.getInt(1);
        			}
        			
        		}
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
			
			<%
 			String searchMovie =request.getParameter("searchMovie");
            
            String ctg =request.getParameter("ctg");
            String ctgActive[] = new String[6];
           	String genre1="";
           	if(ctg==null){
           		ctg="";
           		ctgActive[0] = "class=active";
           	}
           	if(ctg.equals("ctg1")){
           		genre1="액션";
           		ctgActive[1] = "class=active";
           	}else if(ctg.equals("ctg2")){
           		genre1="SF";
           		ctgActive[2] = "class=active";
           	}else if(ctg.equals("ctg3")){
           		genre1="드라마";
           		ctgActive[3] = "class=active";
           	}else if(ctg.equals("ctg4")){
           		genre1="코미디";
           		ctgActive[4] = "class=active";
           	}else if(ctg.equals("ctg5")){
           		genre1="공포";
           		ctgActive[5] = "class=active";
           	}
			%>
			<div class="slider" >
	                <div><a href="movieDetail.jsp?movieID=101"><img src="images/o3.jpg"  width="100%"  height="100%" style="margin: auto !important;"/></a></div>
	                <div><a href="movieDetail.jsp?movieID=102"><img src="images/o2.jpg"  width="100%" height="100%" style="margin: auto !important;"/></a></div>
	                <div><a href="movieDetail.jsp?movieID=103"><img src="images/o1.jpg"  width="100%"  height="100%" style="margin: auto !important;"/></a></div>
                	</div>
			<div>
			
			<div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<a href="index.jsp"><img alt="" src="images/home.png"></a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="movieAll.jsp">
							영화
						</a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="movieAll.jsp">
							현재 상영작
						</a>
						
					</div>
				</div>
			</div>
			
			
			<div class="category" style="margin-top: 50px;">
				<div style="margin: auto;width: 1400px;" class="faq_icon">
				<ul>
				<li <%=ctgActive[0]  %>><a href="movieAll.jsp">전체보기&nbsp;(<%=count %>)</a>&nbsp;&nbsp;</li>
				<li <%=ctgActive[1]  %>><a href="movieAll.jsp?ctg=ctg1">액션&nbsp;(<%=countCg[0] %>)</a>&nbsp;&nbsp;</li>
				<li <%=ctgActive[2]  %>><a href="movieAll.jsp?ctg=ctg2">SF&nbsp;(<%=countCg[1] %>)</a>&nbsp;&nbsp;</li>
				<li <%=ctgActive[3]  %>><a href="movieAll.jsp?ctg=ctg3">드라마&nbsp;(<%=countCg[2] %>)</a>&nbsp;&nbsp;</li>
				<li <%=ctgActive[4]  %>><a href="movieAll.jsp?ctg=ctg4">코미디&nbsp;(<%=countCg[3] %>)</a>&nbsp;&nbsp;</li>
				<li <%=ctgActive[5]  %>><a href="movieAll.jsp?ctg=ctg5">공포&nbsp;(<%=countCg[4] %>)</a>&nbsp;&nbsp;</li>
				</ul>
				</div>
            </div>
            <%
            	String selected[]=new String[3];
	            String select = request.getParameter("select");
	            if(select==null)select="select1";
	            if(select.equals("select1"))selected[0]="selected";
	            else if(select.equals("select2"))selected[1]="selected";
	            else if(select.equals("select3"))selected[2]="selected";
            	
            %>
            <div class="semo" style="width:1400px; margin: auto;">
	            <div class="selectTag">
	            	<form class="sel" method="post" action="movieAll.jsp">
	            	<select name="select">
	            		<option value="select1" <%=selected[0] %>>평점순</option>
	            		<option value="select2" <%=selected[1] %>>예매율순</option>
	            		<option value="select3" <%=selected[2] %>>조회순</option>
	            	</select>
	            	<input type="submit" value="GO">
	            	</form>
	            </div>
	            
	            <div class="movieSearch1">
		            <form class="sear01" method="post" action="movieAll.jsp">
			            <input class="sear" type="text" placeholder="영화명 검색" name="searchMovie"  style="padding: 0.5%; width: 200px;"> 
			            <input type="image" src="images/btnSearch.png" style="position: relative;top: 3px;">
		            </form>
	            </div>
	            
            </div>
            
            <div class="backi"></div>
            <div class="container" style="display: table;">
            
                     
            
            
            <% 
           
           	
           	if(!genre1.equals("")){
           	%>
           		<h2 style="color:#424242;  font-size: 35px;text-align: center;"><%=genre1 %></h2><br><hr><br>
           	<%
           	}
            %>
            <div class="movie100"style="margin: auto;">
            <%
    		if(searchMovie==null||searchMovie==""){ //검색한 내용이 없으면
	        	try {
	        		Class.forName("org.gjt.mm.mysql.Driver");
	        		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
					PreparedStatement pstmt;
	        		if(genre1.equals("")){
	        			String sql="";
	        			if(select.equals("select1")){//평점순
			        		sql="select * from movie order by grade desc";
			        	}
	        			else if(select.equals("select2")){//예매율순
	        				sql="select * from movie left join reserveRate on movie.movieTitle=reserveRate.movieTitle order by count desc";
			        		
	        			}else if(select.equals("select3")){//검색순
	        				sql="select * from movie order by click desc ";
			        		
	        			}
	        			pstmt=con.prepareStatement(sql);
	        		
	        		}else{
	        			String sql="select * from movie where genre=? order by grade desc";
		        		pstmt = con.prepareStatement(sql);
		        		pstmt.setString(1, genre1);
	        		}
	        		ResultSet rs = pstmt.executeQuery();
	        		while(rs.next()){
	        			String movieID=rs.getString(1);
	        			String movieTitle=rs.getString(2);
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
	        			
	        			String sql3="select count(*) from reservemovie";
						PreparedStatement pstmt3 = con.prepareStatement(sql3);
						ResultSet rs3 = pstmt3.executeQuery();
						rs3.next();
						double cnt = rs3.getDouble(1);
						
						String sql4 = "select count(*) from reservemovie where movieTitle=?";
						PreparedStatement pstmt4 = con.prepareStatement(sql4);
						pstmt4.setString(1, movieTitle);
						ResultSet rs4 = pstmt4.executeQuery();
						rs4.next();
						double cnt2 = rs4.getDouble(1);
						
						double reserveRate1 = cnt2/cnt*100;
						String reserveRate2=String.format("%.1f", reserveRate1);
	        			i++;
	        			if(i%4==0){
	        				if(i==4){//빈공간
	        %>					
	        				<div class="movie shfrh"  style="background: #424242; width: 18%; " >
	        				<div class="sna" style="width: 80%;margin: auto;height: 126px;text-align: center;color: yellow;line-height: 101px;">알고먹자! 싸게먹자!</div>
	        				<div style="width: 80%; margin:auto;height:187px">
	        					<a href="snackDetail.jsp?snack_no=1"><img src="snackImages/package1.png" width="100%" height="170px"></a>
	        				</div>
	        				<div style="color: #fff; text-align: center; line-height: 3;">스위트 Combo<br>12000원</div>	
	        				</div>
	        <% 					
	        				}
	        %>
	        		
	        				
	        		<div style="clear: both;" ></div>
	        		
	        		<%
	        			if(i>7){
	        		%>
<!-- 	        			<hr width="100%;" class="hidden"> -->
	        			<div class="movie hidden">
	            		<div class="movieNo2" >NO.<%=i %></div>
	            		<div class="movie-img-wrapper" onmouseover="overEvent('<%=i-1%>');" onmouseout="outEvent('<%=i-1%>')">
	            			<div class="post-count">
				 					<p class="tit"><a href="movieDetail.jsp?movieID=<%=movieID%>"><input type="button"value="상세보기"></a><br>
				 					<a href="reserveMain.jsp?movieID=<%=movieID %>"><input type="button"value="예매하기"></a></p>
				 				</div>
	            			<a href="movieDetail.jsp?movieID=<%=movieID%>" >
	            				<img class="movieBord m_opc" alt="" src="movieImages/<%=img%>" width="80%" height="auto">
	            			</a>
	            		</div>
	            		<div class="movieText"><h3><a href="movieDetail.jsp?movieID=<%=movieID%>"><%=movieTitle %></a></h3>
		            		<div class="mTxt">평점  <img src="images/icon02.png" width="15"  class="icon02"/>
		            		<%if(grade.length()<=3){out.println(grade);}
		            			else {out.println(grade.substring(0, 3));}%> 
		            		&nbsp;| 예매율 : <%=reserveRate2 %>%
		            		</div>
	            		</div>
	            	</div>
	        		<% 		
	        			}else{
	        				
	        			
	        		%>
	        	
	        		<div class="movie">
	        		
	            		<div class="movieNo2">NO.<%=i %></div>
	            		<div class="movie-img-wrapper" onmouseover="overEvent('<%=i-1%>');" onmouseout="outEvent('<%=i-1%>')">
	            			<div class="post-count">
				 					<p class="tit"><a href="movieDetail.jsp?movieID=<%=movieID%>"><input type="button"value="상세보기"></a><br>
				 					<a href="reserveMain.jsp?movieID=<%=movieID %>"><input type="button"value="예매하기"></a></p>
				 				</div>
	            			<a href="movieDetail.jsp?movieID=<%=movieID%>" >
	            				<img class="movieBord m_opc" alt="" src="movieImages/<%=img%>" width="80%" height="auto">
	            			</a>
	            		</div>
	            		<div class="movieText"><h3><a href="movieDetail.jsp?movieID=<%=movieID%>"><%=movieTitle %></a></h3>
		            		<div class="mTxt">평점  <img src="images/icon02.png" width="15"  class="icon02"/>
		            		<%if(grade.length()<=3){out.println(grade);}
		            			else {out.println(grade.substring(0, 3));}%> 
		            		&nbsp;| 예매율 : <%=reserveRate2 %>%
		            		</div>
	            		</div>
	            	</div>
	            	
	            	
	            	
	        <%			}	
	        			}else if(i>4&&i<=7){
	        %>
	        	
	        		<div class="movie">
	            		<div class="movieNo2" >NO.<%=i %></div>
	            		<div class="movie-img-wrapper" onmouseover="overEvent('<%=i-1%>');" onmouseout="outEvent('<%=i-1%>')">
	            			<div class="post-count">
				 					<p class="tit"><a href="movieDetail.jsp?movieID=<%=movieID%>"><input type="button"value="상세보기"></a><br>
				 					<a href="reserveMain.jsp?movieID=<%=movieID %>"><input type="button"value="예매하기"></a></p>
				 				</div>
	            			<a href="movieDetail.jsp?movieID=<%=movieID%>" >
	            				<img class="movieBord m_opc" alt="" src="movieImages/<%=img%>" width="80%" height="auto">
	            			</a>
	            		</div>
	            		<div class="movieText"><h3><a href="movieDetail.jsp?movieID=<%=movieID%>"><%=movieTitle %></a></h3>
		            		<div class="mTxt">평점  <img src="images/icon02.png" width="15"  class="icon02"/>
		            		<%if(grade.length()<=3){out.println(grade);}
		            			else {out.println(grade.substring(0, 3));}%> 
		            		&nbsp;| 예매율 : <%=reserveRate2 %>%
		            		</div>
	            		</div>
	            	</div>
	            	<%
	            			
	           			}else if(i>7){
	         	%>
	            				
	            	<div class="movie hidden">
	            		<div class="movieNo2" >NO.<%=i %></div>
	            		<div class="movie-img-wrapper" onmouseover="overEvent('<%=i-1%>');" onmouseout="outEvent('<%=i-1%>')">
	            			<div class="post-count">
				 					<p class="tit"><a href="movieDetail.jsp?movieID=<%=movieID%>"><input type="button"value="상세보기"></a><br>
				 					<a href="reserveMain.jsp?movieID=<%=movieID %>"><input type="button"value="예매하기"></a></p>
				 				</div>
	            			<a href="movieDetail.jsp?movieID=<%=movieID%>" >
	            				<img class="movieBord m_opc" alt="" src="movieImages/<%=img%>" width="80%" height="auto">
	            			</a>
	            		</div>
	            		<div class="movieText"><h3><a href="movieDetail.jsp?movieID=<%=movieID%>"><%=movieTitle %></a></h3>
		            		<div class="mTxt">평점  <img src="images/icon02.png" width="15"  class="icon02"/>
		            		<%if(grade.length()<=3){out.println(grade);}
		            			else {out.println(grade.substring(0, 3));}%> 
		            		&nbsp;| 예매율 : <%=reserveRate2 %>%
		            		</div>
	            		</div>
	            	</div>
	            	
	        <%				
	        			}else{
	        	
	        %>
	          
	            	<div class="movie">
	            		<div class="movieNo">NO.<%=i %></div>
	            		<div class="movie-img-wrapper" onmouseover="overEvent('<%=i-1%>');" onmouseout="outEvent('<%=i-1%>')">
	            			<div class="post-count">
				 					<p class="tit"><a href="movieDetail.jsp?movieID=<%=movieID%>"><input type="button"value="상세보기"></a><br>
				 					<a href="reserveMain.jsp?movieID=<%=movieID %>"><input type="button"value="예매하기"></a></p>
				 				</div>
	            			<a href="movieDetail.jsp?movieID=<%=movieID%>" >
	            				<img class="movieBord m_opc" alt="" src="movieImages/<%=img%>" width="80%" height="auto">
	            			</a>
	            		</div>
	            		<div class="movieText"><h3><a href="movieDetail.jsp?movieID=<%=movieID%>"><%=movieTitle %></a></h3>
		            		<div class="mTxt">평점  <img src="images/icon02.png" width="15"  class="icon02"/>
		            		<%if(grade.length()<=3){out.println(grade);}
		            			else {out.println(grade.substring(0, 3));}%> 
		            		&nbsp;| 예매율 : <%=reserveRate2 %> %
		            		</div>
	            		</div>
	            	</div>
	            
	           <%} %> 	
	            	
	      
	            <%
		            
	        		
	        		}
	        		rs.close();
	        		pstmt.close();
	        		con.close();
	        		
	        	}catch(Exception e){
	        		e.printStackTrace();
	        	}
	        	%>
	        	</div>
	        	<div style="clear: both;">
	            	<input type="button" onclick="hidden2();" id="hide" value="더보기" class="dubogi"  style="width: 100%;background: url(images/gnb-bg.png);cursor: pointer; font-size: 18px; border: 1px solid lightgray;">
	            </div>
	        	<%
    		}else{ //검색한 내용이 있으면
    			try {
	        		Class.forName("org.gjt.mm.mysql.Driver");
	        		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	        		String jsql ="select * from movie where movieTitle like '%"+searchMovie+"%' ";
	        		PreparedStatement stmt = con.prepareStatement(jsql);
	        		
	        		ResultSet r2 = stmt.executeQuery();
	        		boolean plag=true;
	        		while(r2.next()){
	        			plag=false;
	        			String movieID=r2.getString(1);
	        			String movieTitle=r2.getString(2);
	        			String director = r2.getString(3);
	        			String producer=r2.getString(4);
	        			String actor=r2.getString(5);
	        			String genre = r2.getString(6);
	        			String basic = r2.getString(7);
	        			String premiere = r2.getString(8);
	        			String img= r2.getString(9);
	        			String steel1 = r2.getString(10);
	        			String steel2 = r2.getString(11);
	        			String steel3 = r2.getString(12);
	        			String summary = r2.getString(13);
	        			String iframe = r2.getString(14);
	        			String grade = r2.getString(15);
	        			
	        			String sql3="select count(*) from reservemovie";
						PreparedStatement pstmt3 = con.prepareStatement(sql3);
						ResultSet rs3 = pstmt3.executeQuery();
						rs3.next();
						double cnt = rs3.getDouble(1);
						
						String sql4 = "select count(*) from reservemovie where movieTitle=?";
						PreparedStatement pstmt4 = con.prepareStatement(sql4);
						pstmt4.setString(1, movieTitle);
						ResultSet rs4 = pstmt4.executeQuery();
						rs4.next();
						double cnt2 = rs4.getDouble(1);
						
						double reserveRate1 = cnt2/cnt*100;
						String reserveRate2=String.format("%.1f", reserveRate1);
	        			i++;
	        			if(i%4==0){
	        		%>
	        		
	        			<div class="movie">
		            		<div class="movie-img-wrapper" onmouseover="overEvent('<%=i-1%>');" onmouseout="outEvent('<%=i-1%>')">
	            			<div class="post-count">
				 					<p class="tit"><a href="movieDetail.jsp?movieID=<%=movieID%>"><input type="button"value="상세보기"></a><br>
				 					<a href="reserveMain.jsp?movieID=<%=movieID %>"><input type="button"value="예매하기"></a></p>
				 				</div>
	            			<a href="movieDetail.jsp?movieID=<%=movieID%>" >
	            				<img class="movieBord2 m_opc" alt="" src="movieImages/<%=img%>" width="80%" height="auto">
	            			</a>
	            		</div>
		            		<div class="movieText"><h3><a href="movieDetail.jsp?movieID=<%=movieID%>"><%=movieTitle %></a></h3>
		            		<div class="mTxt">평점  <img src="images/icon02.png" width="15"  class="icon02"/>
		            		<%if(grade.length()<=3){out.println(grade);}
		            			else {out.println(grade.substring(0, 3));}%> 
		            		&nbsp;| 예매율 : <%=reserveRate2 %>%
		            		</div>
	            		</div>
	            		</div>
	        		<div style="clear: both;" ></div>
	        		<%}else{ %>
	        			<div class="movie">
		            		<div class="movie-img-wrapper" onmouseover="overEvent('<%=i-1%>');" onmouseout="outEvent('<%=i-1%>')">
	            			<div class="post-count">
				 					<p class="tit"><a href="movieDetail.jsp?movieID=<%=movieID%>"><input type="button"value="상세보기"></a><br>
				 					<a href="reserveMain.jsp?movieID=<%=movieID %>"><input type="button"value="예매하기"></a></p>
				 				</div>
	            			<a href="movieDetail.jsp?movieID=<%=movieID%>" >
	            				<img class="movieBord2 m_opc" alt="" src="movieImages/<%=img%>" width="80%" height="auto">
	            			</a>
	            		</div>
		            		<div class="movieText"><h3><a href="movieDetail.jsp?movieID=<%=movieID%>"><%=movieTitle %></a></h3>
		            		<div class="mTxt">평점  <img src="images/icon02.png" width="15"  class="icon02"/>
		            		<%if(grade.length()<=3){out.println(grade);}
		            			else {out.println(grade.substring(0, 3));}%> 
		            		&nbsp;| 예매율 : <%=reserveRate2 %>%
		            		</div>
	            		</div>
	            		</div>
	            		
	        		<% 	
	        		}
	        		}if(plag){//존재하지 않는 영화입니다.
	        		%>
	        			<div style="height: 300px; line-height: 300px; font-family: sans-serif; font-size: 17px;font-weight: 100;">현재 상영중인 영화가 없습니다.</div>
	        		<% 	
	        		}
	        	
    			}catch(Exception e){
    				e.printStackTrace();
    			}
        		
    		}
        			
            %>
            
            
	             </div>
	             </div>
	            </div>
             
             
             <script>
             var hid=document.querySelectorAll(".hidden");
     		for(var i=0;i<hid.length;i++){
     			hid[i].style.display="none";
     		}
     		
     		var target = document.getElementsByClassName('post-count');
     		function overEvent(a){
     			target[a].style.display='block'
     			target[a].style.opacity='1';
     		}
     		function outEvent(a){
     			target[a].style.display='none';
     			target[a].style.opacity='0';
     		}
     		
             </script>
             
            <div class="footer">
  	<div class="wrapper">
       <div style="display:flex;line-height: 79px; height: 60px;color: #888;" class="footerLogoWrap">
         <div style="margin-right:2%;" class="footerLogo">
           <a href="index.jsp"><img src="images/logo.png" height="80px" ></a>
         </div>
         <a href="mainInfo1.jsp"><h4>회사소개</h4></a>&nbsp;&nbsp;·
          &nbsp;&nbsp;<a href="mainInfo2.jsp"><h4>제휴문의</h4></a>&nbsp;&nbsp;·
          &nbsp;&nbsp;<a href="mainInfo3.jsp"><h4>배성/편성기준</h4></a> &nbsp;&nbsp;·
          &nbsp;&nbsp;<a href="manageLogin.jsp"><h4>관리자 로그인</h4></a>
       </div>
        <div class="footerb" style="margin-top:3%;">
        <ul style="white-space:nowrap;">
        <li style="list-style:none;"><span>주소</span>&nbsp;&nbsp;충청남도 천안시 서북구 성환읍 대학로 91, 3층(공학관 3층)  <span>ARS</span>&nbsp;&nbsp;1544-6416</li>
        <li style="list-style:none;"><span>대표자명</span>&nbsp;&nbsp;민석홍 <span>개인정보보호책임자</span>&nbsp;&nbsp;민석홍 <span>사업자등록번호</span>&nbsp;&nbsp;411-82-17852 &nbsp;</li>
        <li style="list-style:none;"><span>COPYRIGHT © MovieStoreJoongAng, Inc. All rights reserved</span></li>
        </ul>
        </div>
      </div>
  </div>
            


        </body>
</html>