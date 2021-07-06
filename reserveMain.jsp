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
          <a href="movieAll.jsp" class="eng">영화</a>
          <ul class="sub_m" style="display: block;">
            <li><a href="movieAll.jsp" class="eng">현재 상영작</a></li>
            <li><a href="movieAfter.jsp" class="eng">상영 예정작</a></li>
            <li><a href="moviePost.jsp" class="eng">무비 포스트</a></li>
          </ul>
      </li>
      <li>
          <a href="reserveMain.jsp" class="eng">예매</a>
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
          <a href="snackStore.jsp" class="eng">스토어</a>
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
			
			String movieID_ = request.getParameter("movieID");
			int movieID=1;
			if(movieID_==null){movieID=1;}
			else if(movieID_!=null){movieID=Integer.parseInt(movieID_);}
			String img="";
			int grade=0;
			String movieTitle = "";
			int count=0;
			int i=0;
			String title="";
			
			int day=0;
			if(request.getParameter("day")!=null){
				day=Integer.parseInt(request.getParameter("day"));
			}
			String movieTime="";
			if(request.getParameter("movieTime")!=null){
				movieTime=request.getParameter("movieTime");
			}
			
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date="";
			if(day!=0){
				if(day<10){
					date=sdf.format(now).substring(0, 8)+"0"+day;
				}else{
					date=sdf.format(now).substring(0, 8)+day;
				}
				
				
			}else{
				date=sdf.format(now);
			}
			try {
        		Class.forName("org.gjt.mm.mysql.Driver");
        		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
        		
        		String sql3 = "select count(*) from movie";
        		PreparedStatement pstmt3=con.prepareStatement(sql3);
        		ResultSet rs3 = pstmt3.executeQuery();
        		if(rs3.next()){count=rs3.getInt(1);}
        		
        		String m_title[] = new String[count];
        		String selected[] = new String[count];
        		String sql2 ="select * from movie where movieID=?";
        		PreparedStatement pstmt2=con.prepareStatement(sql2);
        		pstmt2.setInt(1, movieID);
        		ResultSet rs2 = pstmt2.executeQuery();
        		if(rs2.next()){
        			movieTitle = rs2.getString("movieTitle");
        			img = rs2.getString("img");
        			grade=rs2.getInt("grade");
        		}
        		String sql="select * from movie";
        		PreparedStatement pstmt = con.prepareStatement(sql);
        		ResultSet rs = pstmt.executeQuery();
        		
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
						<a href="reserveMain.jsp">
							빠른 예매
						</a>
				</div></div></div>
				
      <div class="container">
      	<div style="text-align: left;" ><h2 > 영화 예매 </h2></div>
         <hr style="border: solid 1px; width:42%; text-align: left;">  <br>
         
         <div style="text-align: left;">
         	<input type="button" value="할인 안내" onclick="location.href='reserveInfo.jsp'" class="btnReserveInfo">
         	<input type="button" value="상영 시간표" onclick="location.href='movieTime.jsp?movieID=<%=movieID %>'" class="btnReserveInfo">
         </div>
         
         <div class="allbox" style="width: 1400px;" >
         	<!-- <div class="re_title">영화 예매</div> -->
         	<div class="movieImg remain_box1" style="text-align: center;">
      			<img class="reim" alt="" src="movieImages/<%=img%>" width="100%" height="581px">
      		</div>
         	<div  class="remain_box2">
         		<div class="reserveform">
      	<form method="post" action="reserveSeat.jsp" name="reserveMain" >
      	
		<div class="td1">영화명</div>
		<select name="movieTitle" id="movieTitle" onchange="chageLangSelect();">
		<%
			while(rs.next()){
				m_title[i]=rs.getString(2);
				
				if(m_title[i].equals(movieTitle)){
					selected[i]="selected";
				}
				
				
		%>
			<option value="<%=rs.getString(2) %>"<%=selected[i] %>> <%=rs.getString(2) %></option>
		<% 		
				i++;
			}
		%>
				
			</select>
	
	  
	
		<div class="td1">인원수</div>
			성인 : <input type="text" name="adult" size="3" id="adult" value="0" onchange="changePrice();changeDate();">  
			청소년 : <input type="text" name="student" size="3" id="student" value="0"onchange="changePrice();changeDate();">  
			아이 : <input type="text"  value="0" name="baby" size="3" id="baby"onchange="changePrice();changeDate();"> 

		<div class="td1">관람 날짜 *(yyyy-MM-dd 형식에 맞춰 써주세요.)</div>
		<input type="date" name="movieDate" value="<%=date%>" onchange="changeDate();" id="movieDate" style="width: 158px;">
	
		<div class="td1">영화 시간</div>
		<select name="movieTime" onchange="changeDate();" id="movieTime" style="width: 150px;">
			<%	
				String jsql2 = "select count(*) from movieTime where movieID=?";
				PreparedStatement jpstmt2 = con.prepareStatement(jsql2);
				jpstmt2.setInt(1, movieID);
				ResultSet jrs2 = jpstmt2.executeQuery();
				jrs2.next();
				int ctnMovie = jrs2.getInt(1);
				int j=0;
				String selectedTime[] = new String[ctnMovie];
				String Time[] = new String[ctnMovie];
				
				String jsql = "select * from movieTime where movieID=?";
				PreparedStatement jpstmt = con.prepareStatement(jsql);
				jpstmt.setInt(1, movieID);
				ResultSet jrs = jpstmt.executeQuery();
				while(jrs.next()){
					Time[j]=jrs.getString(2);
					if(jrs.getString(2).equals(movieTime)){
						selectedTime[j]="selected";
					}
			%>
				<option <%= selectedTime[j]%>><%=jrs.getString(2) %></option>
			<% 		
				j++;}
			%>
		</select>
		<%
		
			String sql4 = "select * from usergrade where id=?";
			PreparedStatement pstmt4 = con.prepareStatement(sql4);
			pstmt4.setString(1, id);
			ResultSet rs4 = pstmt4.executeQuery();
			int ticket=0;
			if(rs4.next()){
			ticket = rs4.getInt(5);
			}
		%>
		<div class="td1">영화 관람권(보유 관람권 : <span id="haveTicket"><%=ticket %></span>장)</div>
		사용하실 관람권 : <input type="text" size=5 readonly="readonly" name="ticket" id="myTicket" value="0">
		<input type="button" value="+" onclick="plusTicket();" id="cplus" style="padding: 5px;">
        <input type="button" value="-" onclick="minusTicket('<%=ticket %>');" id="cminus" style="padding:5px 6px;">
		
		<div class="td1">가격</div>
		<p style="font-family: sans-serif; line-height: 2;">
		어른은  12000원 , 청소년은  10000원 , 어린이는  6000원으로 계산합니다.
		</p>
		<input type="text" name="price" id="price" value="0원" readonly="readonly" onchange="changeDate();">
		
		<input type="hidden" name="userID"  value="<%=id %>">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="hidden" name="img" value="<%=img %>">
	</form>
            		
     	</div>
         	</div><!--  -->
         	<div class="remain_box3">
         		<div  class="reserveMain_tit">
	    		<h2 class="ht">오늘의 <span style="color: red;">10%</span> 할인 영화!</h2>
	    		<ul class="ult" style="margin-top: 16px;">
	    			<li><a href="reserveMain.jsp?movieID=1">삼진그룹 영어 토익반</a></li>
	    			<li><a href="reserveMain.jsp?movieID=3">담보</a></li>
	    			<li><a href="reserveMain.jsp?movieID=4">미스터트롯:더무비</a></li>
	    			<li><a href="reserveMain.jsp?movieID=16">도굴</a></li>
	    			<li><a href="reserveMain.jsp?movieID=17">노트북</a></li>
	    		</ul>
	    		<!-- <div>
	    			<img class="tomo" src="images/reserveSale.png">
	    		</div> -->
	    		</div>
         	</div>
         	
         </div>
         
    	
    	<div  style="clear: both;"></div>
    
	
		
    	
    </div>
    <div class="reserveBottom">
    	<div class="bottom1">
    		<div class="bottom1_1"><img alt="" src="movieImages/<%=img%>" width="100px" height="150px;">
    			
	    		<span class="bottom_tit">
	    		<div style="font-size: 19px;color: red;">STEP 1</div>
	    		<%=movieTitle %><div><span class="movieDate1">어른 0명</span>&nbsp; <span class="movieDate1">청소년 0명</span>
	    		<span class="movieDate1">아이 0명</span></div><span class="movieDate1"><%=date %>&nbsp;&nbsp;/</span>
	    		<span class="movieDate1">
	    		<% 
	    			if(!movieTime.equals("")){
	    		%>
	    			<%=movieTime %>
	    		<% 		
	    			}else{
	    		%>
					<%=Time[0] %>	    		
	    		<% 		
	    			}
	    		%>
	    		</span><div class="movieDate1">0원</div></span>
    		</div>	
    		<div class="bottom1_2"><div style="font-size: 19px;">STEP 2</div>&nbsp;
    			<input type="button" value="좌석선택하기" class="btnReserveGo2" onclick="checkValue();">
    		</div>
    		
    		<div class="bottom1_2"><div style="font-size: 19px;">STEP 3</div>결제</div>
    		<div class="bottom1_3"></div>
    	 </div>
    	 <div style="clear: both;"></div>
    
          	<%
			}catch(Exception e){
    			e.printStackTrace();
    		}
          	%> 
     </div>      	 
     
     
     	<script>
	     	/* var movieTitle = document.getElementById('movieTitle');
	     	var price = document.querySelector('#price');
	     	if(movieTitle.selectedIndex==0||movieTitle.selectedIndex==2||movieTitle.selectedIndex==3||movieTitle.selectedIndex==15||movieTitle.selectedIndex==16){
	     		price.value=price*90;
	     	} */
			function plusTicket(){
				var ticket_ = document.querySelector('#haveTicket');
				var ticket = parseInt(ticket_.innerHTML);
				var movieTitle = document.getElementById('movieTitle').selectedIndex;
				var myTicket = document.querySelector('#myTicket');
				
				var adult = parseInt(document.querySelector('#adult').value);
				var student = parseInt(document.querySelector('#student').value);
				var baby = parseInt(document.querySelector('#baby').value);
				var total = adult*12000+student*10000+baby*6000;
				var price_btm = document.getElementsByClassName('movieDate1')[5];
				var price = document.querySelector('#price');
				var a=12000;var b=10000; var c= 6000;
				if(movieTitle==0||movieTitle==2||movieTitle==3||movieTitle==15||movieTitle==16){
					total=total*90/100;
					a=12000*90/100;
					b=10000*90/100;
					c=6000*90/100;
					
				}
				
				if(ticket==0){
					alert('보유하신 관람권이 없습니다.');
				}else{
					if(adult!=0&&!(adult-myTicket.value<=0)){
						if(parseInt(price.value.split('원')[0])>0){
							if(parseInt(price.value.split('원')[0])-a<0){
								price.value = 0+"원";
								price_btm.innerHTML =price.value;
								ticket_.innerHTML = ticket-1;
								myTicket.value=parseInt(myTicket.value)+1;
							}else{
								price.value = parseInt(price.value.split('원')[0])-a+"원";
								price_btm.innerHTML =price.value;
								
								ticket_.innerHTML = ticket-1;
								myTicket.value=parseInt(myTicket.value)+1;
							}
						}
					}
					else if(student!=0&&!(student+adult-myTicket.value<=0)){
						if(parseInt(price.value.split('원')[0])>0){
							if(parseInt(price.value.split('원')[0])-b<0){
								price.value = 0+"원";
								price_btm.innerHTML =price.value;
								ticket_.innerHTML = ticket-1;
								myTicket.value=parseInt(myTicket.value)+1;
							}else{
								price.value = parseInt(price.value.split('원')[0])-b+"원";
								price_btm.innerHTML =price.value;
								
								ticket_.innerHTML = ticket-1;
								myTicket.value=parseInt(myTicket.value)+1;
							}
							}
						}
					else if(baby!=0){
							if(parseInt(price.value.split('원')[0])>0){
								if(parseInt(price.value.split('원')[0])-c<0){
									price.value = 0+"원";
									price_btm.innerHTML =price.value;
									ticket_.innerHTML = ticket-1;
									myTicket.value=parseInt(myTicket.value)+1;
								}else{
									price.value = parseInt(price.value.split('원')[0])-c+"원";
									price_btm.innerHTML =price.value;
									ticket_.innerHTML = ticket-1;
									myTicket.value=parseInt(myTicket.value)+1;
								}
								}
							}
				}
			}
			
			
			
			
			
			function minusTicket(a){
				var ticket_ = document.querySelector('#haveTicket');
				var ticket = parseInt(ticket_.innerHTML);
				
				var myTicket =document.querySelector('#myTicket');
				
				var adult = parseInt(document.querySelector('#adult').value);
				var student = parseInt(document.querySelector('#student').value);
				var baby = parseInt(document.querySelector('#baby').value);
				var total = adult*12000+student*10000+baby*6000;
				var price_btm = document.getElementsByClassName('movieDate1')[5];
				var price = document.querySelector('#price');
				
				if(myTicket.value==0){
					alert('더 이상 뺄 수 없습니다.');
				}else{
					price.value = total+"원";
					price_btm.innerHTML =price.value;
					ticket_.innerHTML = a;
					myTicket.value=0;
				}
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