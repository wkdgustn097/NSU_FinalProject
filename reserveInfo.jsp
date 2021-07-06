<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/reserve.css">
         <script language="javascript" src="javascript/user.js"></script>
         <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
    <body onLoad="idFocus2()">
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
      <div class="dlqps">
      <!-- <h2 class="gkfdls">할인안내</h2> -->
      </div>
      
      					           <div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<a href="index.jsp"><img alt="" src="images/home.png"></a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="reserveMain.jsp">
							예매
						</a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="reserveInfo.jsp">
							할인 안내
						</a>
						</div>
						</div>
						</div>
  
	 <div class="container" style="width:1200px; text-align: left;">
      
      <div>
      	<h2>할인안내</h2>
      	<hr style="width:30%;border: 1px solid;margin-bottom: 50px;">
      </div>
      
      <div class="himg1" style="width:1000px; margin-top:0%;border-radius: 10px;" id="No1">
      <img class="himg2" src="images/banner1_.png" style="border-radius: 10px;width: 1200px;height: 450px;">
      </div>
      

      
      
      <div style="wildth:1000px; margin-top:5%;" id="userGrade">
      <h3 style="display: inline-block;" id="No5">회원등급</h3>
      <a href="myPageHome.jsp"><p style="display:inline-block; margin-left: 3.5%; color: #CBCBCB; font-size: 17px;">나의 등급보기 &nbsp;<img src="images/ico-arr-right-gray.png" width="15px"></p></a>
      </div>
      
      <hr style="border: solid 1px #CBCBCB; width:30%; text-align: left;">
      
      <div style="display:flex;">
      <div style="border:4px solid; padding:10px; width: 300px; height:200px; border-radius:5px; margin-top:5%;">
      <h2>일반</h2>
      <br>
      <hr style="border: solid 1px ; width:50%; margin-left:1%;text-align: left;">
      <br>
      <h3>누적금액 10만원 이하시</h3>
      <h3>0% 할인</h3>
      </div>
      
      <div style="border:4px solid #c0c0c0; padding:10px; width: 300px; height:200px; border-radius:5px;  margin-top:5%;margin-left: 1%;" >
      <h2 style="color:#c0c0c0;">SILVER</h2>
      <br>
      <hr style="border: solid 1px; width:50%; margin-left:1%;text-align: left;">
      <br>
      <h3>누적금액 20만원 이하시</h3>
      <h3>5% 할인</h3>
      </div>

      <div style="border:4px solid #ffd90a; padding:10px; width: 300px; height:200px; border-radius:5px;  margin-top:5%;margin-left: 1%;" >
      <h2 style="color:#ffd90a;">GOLD</h2>
      <br>
      <hr style="border: solid 1px; width:50%; margin-left:1%;text-align: left;">
      <br>
      <h3>누적금액 30만원 이하시</h3>
      <h3>7% 할인</h3>
      </div>
      
      <div style="border:4px solid #437299; padding:10px; width: 300px; height:200px; border-radius:5px; margin-top:5%;margin-left: 1%;" >
      <h2 style="color:#437299;">PLATINUM</h2>
      <br>
      <hr style="border: solid 1px; width:50%; margin-left:1%;text-align: left;">
      <br>
      <h3>누적금액 30만원 이상시</h3>
      <h3>10% 할인</h3>
      </div>
      </div>
      
      <div style="margin-top:5%; position: relative; clear: both;">
      <h3>이벤트</h3>
      <a href="eventMain.jsp"><p style="position: absolute;left: 0;bottom: 0px;margin-left: 8.5%; color: #CBCBCB; font-size: 17px;">이벤트페이지 바로가기 &nbsp;<img src="images/ico-arr-right-gray.png" width="15px"></p></a>
      </div>
      
      <hr style="border: solid 1px #CBCBCB; width:30%; text-align: left;">
      
      <div style="display:flex;">
      <div style="border:3px solid;background:#95E5A0; padding:20px; width: 500px; height:252px; border-radius:10px; margin-top:5%;  background-image: url(images/br.png);
    background-size: cover;
    background-position: center;
    filter: drop-shadow(5px 5px 5px #000);" >
      <h2 style="color:black;"><a href="eventDetail01.jsp">생일 이벤트</a></h2>
      <br>
      <hr style="border: solid 1px; width:50%; margin-left:1%;">
      <br>
      <h3 style="color:black;">생일이 3에서 6월 사이이신 분에게</h3>
      <h3 style="color:black;">5000원 할인쿠폰 1매 제공</h3>
      </div>
      
      <div style="border:3px solid;background:#95E5A0; padding:20px; width: 500px; height:252px; border-radius:10px; margin-top:5%;margin-left: 5%;  background-image: url(images/vip.png);
    background-size: cover;
    background-position: center;
    filter: drop-shadow(5px 5px 5px #000);" >
      <h2 style="color:black;"><a href="eventDetail02.jsp">회원등급 이벤트</a></h2>
      <br>
      <hr style="border: solid 1px; width:50%; margin-left:1%;text-align: left;">
      <br>
      <h3 style="color:black;">회원등급이 실버 이상 등급인 분들에게</h3>
      <h3 style="color:black;">5000원 할인쿠폰 1매 제공</h3>
      </div>
      </div>
      
      <div style="display:flex;">
      <div style="border:3px solid;background:#95E5A0; padding:20px; width: 500px; height:252px; border-radius:10px; margin-top:5%;  background-image: url(images/mo.png);
    background-size: cover;
    background-position: center;
    filter: drop-shadow(5px 5px 5px #000);" >
      <h2 style="color:black;"><a href="eventDetail03.jsp">무비포스트 이벤트</a></h2>
      <br>
      <hr style="border: solid 1px; width:50%; margin-left:1%;">
      <br>
      <h3 style="color:black;">영화를 관람하고 무비포스트 작성하실 때마다</h3>
      <h3 style="color:black;">500 Point 제공</h3>
      </div>
      
      <div style="border:3px solid;background:#95E5A0; padding:20px; width: 500px; height:252px;margin-left:5%; border-radius:10px; margin-top:5%;  background-image: url(images/kk.png);
    background-size: cover;
    background-position: center;
    filter: drop-shadow(5px 5px 5px #000);" >
      <h2 style="color:black;"><a href="eventDetail04.jsp">카카오페이 결제 이벤트</a></h2>
      <br>
      <hr style="border: solid 1px; width:50%; margin-left:1%;">
      <br>
      <h3 style="color:black;">카카오페이 결제시</h3>
      <h3 style="color:black;">5% 할인</h3>
      </div>
      </div>
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