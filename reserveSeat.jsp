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
			String movieTitle=request.getParameter("movieTitle");
			int adult = Integer.parseInt(request.getParameter("adult"));
			int student = Integer.parseInt(request.getParameter("student"));
			int baby = Integer.parseInt(request.getParameter("baby"));
			String movieDate=request.getParameter("movieDate");
			String movieTime=request.getParameter("movieTime");
			int people = adult+student+baby;
			String img = request.getParameter("img");
			int price = Integer.parseInt(request.getParameter("price").split("원")[0]);
			String ticket = request.getParameter("ticket");
			String basic="";
			
			Date d1 = new Date();
		  	Date d2 = new Date();
		  	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		  	
		  
		  	d1 = sdf.parse(movieDate);
		 	d2= sdf.parse(sdf.format(d2));
		 	int compare = d1.compareTo(d2);
			//예약하려는 날짜보다 현재날짜가 크다면 -1
			//예약하려는 날짜와 현재날짜가 같다면 0
			//예약하려는 날짜가 더 크다면  1을 리턴
			if(compare < 0){//오늘보다 이전 날짜 선택시 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('현재 시스템 날짜보다 이전 날짜는 선택할 수 없음')");
				script.println("location.href=document.referrer");
				script.println("</script>");
			}
			
			String dburl="jdbc:mysql://localhost:3306/movieStore";
        	String dbid="root";
        	String dbpassword="1234";
			
        	Class.forName("org.gjt.mm.mysql.Driver");
    		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
    		
    		String sql = "select count(*) from movie";
    		PreparedStatement pstmt=con.prepareStatement(sql);
    		
    		String sql3 = "select basic from movie where movieTitle=?";
    		PreparedStatement pstmt3 = con.prepareStatement(sql3);
    		pstmt3.setString(1, movieTitle);
    		ResultSet rs3 = pstmt3.executeQuery();
    		rs3.next();
    		basic=rs3.getString(1);
    		
    		rs3.close();
    		pstmt3.close();
    		
    		String sql4 = "select joomin from user where id=?";
    		PreparedStatement pstmt4 = con.prepareStatement(sql4);
    		pstmt4.setString(1, id);
    		ResultSet rs4 = pstmt4.executeQuery();
    		rs4.next();
    		String age_=rs4.getString(1);
    		rs4.close();pstmt4.close();
    		int age =Integer.parseInt(age_.substring(0, 2));
    		if(age>=21)age+=1900; //1921년생 이후에 태어난사람
    		else age+=2000; //2000~2020년생 인사람
    		int userAge = Integer.parseInt(sdf.format(d2).substring(0,4))-age+1;
    		
    		int movieAge=0;
    		String basicArr[] = basic.split(",");
    		if((basicArr[0].trim().substring(0, 2)).equals("12"))movieAge=12;
    		else if((basicArr[0].trim().substring(0, 2)).equals("15"))movieAge=15;
    		else if((basicArr[0].trim().substring(0, 2)).equals("전체"))movieAge=0;
    		else if((basicArr[0].trim().substring(0, 2)).equals("청소"))movieAge=20;
    		
    		
    		
    	%>
    		<script>
    			var b = "<%=basicArr[0].trim()%>";
    			 alert('이 영화는 '+b+'영화입니다. 연령 확인 불가 시 입장이 제한 될 수 있습니다.'); 
    			<%-- window.open('movieAge.jsp?movieTitle=<%=movieTitle%>','check','width=245, height=200, scrollbars=no, resizable=no'); --%>
    		</script>
    	<% 
    		
    		
    	
    		
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
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="reserveSeat.jsp">
							좌석 선택
						</a>
				</div></div></div>
		<form method="post" action="reservePay.jsp" name="reserveMain2">	
      <div class="container" >
      	 <div style="text-align: left;"><h2 > 좌석 예약 </h2></div>
         <hr style="border: solid 1px; width:42%; text-align: left;"> <br>
         
          <div style="text-align: left; font-family: sans-serif;">
          	<div style="float: left;"><%=id %>님이 선택하신 인원은<span style="color:red;"><%=people %></span>명 입니다.<br>
   			 	<span style="color:red;"><%=people %></span>명의 자리를 선택 해 주세요. 
   			 </div> 
   			 <div style="float: right;">
   			 	<table class="s_select">
   			 		<tr>
   			 			<td style="padding: 10 25; background: white;border: 1px solid black;"><input type="checkbox"></td><td>선택가능</td>
   			 			<td style="background:goldenrod;padding: 10 25;"><input type="checkbox"></td><td>선택됨</td>
   			 			<td style="background:red;padding: 10 25;"><input type="checkbox"></td><td>자리없음</td>
   			 		</tr>	
   			 	</table>
   			 </div>
   		 </div>   
   		 <div style="clear: both;" ></div>      
              <br><br>
		<div class="allseat">
		
		<table class="alse" width="1400px" border="1" cellspacing="20" cellpadding="15"  class="table">
		  	<tr class="sc">
		        <td colspan="11" align=center style="padding: 20;background: grey;color: white;border-radius: 10px;">SCREEN</td>
		    </tr>
		    <%for(char j='A'; j<='F'; j++){ %>
		    <tr align=center class="row">
		    <td width="40" style="padding:4;border: none;background: grey;color: white;border-radius: 10px;"><%=j%>열</td>
		    <%for(int i=1; i<=10; i++){%>
		           
		  <td width="40" style="padding:4; background: white;line-height: 33px;border-radius: 10px;" id="td<%=j%><%=i%>" >
		
		  <input type="checkbox" id="seat<%=j%><%=i%>" name="seat1" value="<%=j%><%=i%>" onchange="selectSeat('<%=j%><%=i%>','<%=people%>');">&nbsp;<%=j%><%=i%>
			
		  
		 <% 
		 }
		    }
		 %>  
		  
		</table>
		<%
			String sql2="select * from reserveMovie";
			PreparedStatement pstmt2 = con.prepareStatement(sql2);
			ResultSet rs2 = pstmt2.executeQuery();
			while(rs2.next()){
				if(movieTitle.equals(rs2.getString(3))&&movieDate.equals(rs2.getString(7))&&movieTime.equals(rs2.getString(8))){
					String seat10[] = rs2.getString(10).split(",");
					for(int i=0;i<seat10.length;i++){
		%>
			<script>
				var target=document.getElementById('seat<%=seat10[i]%>');
				target.disabled="true";
				var td = document.getElementById('td<%=seat10[i]%>');
				td.style.background="red";
				
			
					
			</script>
		<% 		
					}
				}
			}
		%>
		
		
		
		</div>
     </div>
     
     
     <script>
		   	 document.getElementById('tdA1').style.opacity='0';
			 document.getElementById('tdA2').style.opacity='0';
			 document.getElementById('tdA9').style.opacity='0';
			 document.getElementById('tdA10').style.opacity='0';
			 document.getElementById('tdB1').style.opacity='0';
			
			 document.getElementById('tdB10').style.opacity='0';
        </script>
        
        
     <div class="reserveBottom">
    	<div class="bottom1">
    		<div class="bottom1_1"><img alt="" src="movieImages/<%=img %>" width="100px" height="150px;">
    			<span class="bottom_tit">
    			<div style="font-size: 19px;">STEP 1</div>
    			<%=movieTitle %><br>성인 <%=adult%>명 청소년 <%=student %>명 아이 <%=baby %>명<br><%=movieDate %>&nbsp;&nbsp;/ <%=movieTime %><br><%=price %>원</span></div>	
    		<div class="bottom1_2"><div style="font-size: 19px;color: red;">STEP 2</div>&nbsp;좌석선택</div>
    		<div class="bottom1_2"><div style="font-size: 19px;">STEP 3</div>&nbsp;
    			<input type="button" value="결재하기" class="btnReserveGo2" onclick="checkValue2('<%=people %>');" >
    		</div>
    		<div class="bottom1_3"></div>
    	 </div>
    	 <div style="clear: both;"></div> 
    </div>
    
    
    	<input type="hidden" name="userID"  value="<%=id %>">
		  <input type="hidden" name="img" value="<%=img %>">
		  <input type="hidden" name="movieTitle" value="<%=movieTitle %>">
		  <input type="hidden" name="adult" value="<%=adult %>">
		  <input type="hidden" name="student" value="<%=student %>">
		  <input type="hidden" name="baby" value="<%=baby %>">
		  <input type="hidden" name="movieDate" value="<%=movieDate %>">
		  <input type="hidden" name="movieTime" value="<%=movieTime %>">
		  <input type="hidden" name="price" value="<%=price %>">
		   <input type="hidden" name="ticket" value="<%=ticket %>">
    	 </form>    	 
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