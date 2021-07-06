<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/snack.css">
        <script src="javascript/snack.js"></script>
         <link rel="stylesheet" type="text/css" href="css/layout.css">
        
        <script>
            $(document).ready(function(){
              $('.slider').bxSlider({
            		touchEnabled : false,
            		auto: true, speed: 500, pause: 2000,  pager:true

              });
              
            });
          
          </script>
         
    </head>
    <body>
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
		
		int snack_no=Integer.parseInt(request.getParameter("snack_no"));
		String snackName="";
		String snackImg ="";
		String snackInfo="";
		String snackCtg="";
		int price =0;
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
		
		try{
			String sql="select * from snack where snack_no=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,snack_no);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			snackName=rs.getString(2);
			snackImg=rs.getString(3);
			snackInfo=rs.getString(4);
			snackCtg=rs.getString(5);
			price = rs.getInt(6);
			
			rs.close();
			pstmt.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
            <div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<a href="index.jsp"><img alt="" src="images/home.png"></a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="snackStore.jsp">
							스토어
						</a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="snackDetail.jsp">
							스낵 구매
						</a>

						
					</div>
				</div>
			</div>
      <div class="container">
      	<div class="snackDetail">
      		<div class="snackImg">
      			<img src="snackImages/<%=snackImg%>" width="400px">
      			<div>
      				<h5 style="text-align: center;font-size: 18px;margin-top: 45px;">함께 본 상품</h5><br>
      				<div class="slider">
      				<%
	      				try{
	      					String sql="select * from snack";
	      					PreparedStatement pstmt = con.prepareStatement(sql);
	      					ResultSet rs = pstmt.executeQuery();
	      					while(rs.next()){
	      			%>
	      					<div><a href="snackDetail.jsp?snack_no=<%=rs.getInt(1)%>">
		      					<img src="snackImages/<%=rs.getString(3)%>" width="60%" height="auto"/>
		      					<div style="text-align: center;"><%=rs.getString(2) %></div>
		      					<div style="text-align: center;"><%=rs.getInt(6) %>원</div>
		      					</a>
	      					</div>
	      			<% 			
	      					}
	      					
	      					
	      					rs.close();
	      					pstmt.close();
	      					
	      					
	      				}catch(Exception e){
	      					e.printStackTrace();
	      				}
      				%>
	                
                	</div>
      			</div>
      		</div>
      		<div class="snackInfo">
      			<table>
      				<tr style="text-align: center;">
      					<td colspan="2"><span style="font-size: 30px;"><%=snackName %></span></td>
      				</tr>
      				<tr>
      					<td colspan="2"><hr style="border: 1px solid #E5E5E5;"></td>
      				</tr>
      				<tr>
      					<td colspan="2" style="font-size: 21px;text-align: center;"><%=price %>원</td>
      				</tr>
      				<tr>
      					<td colspan="2"><hr style="border: 1px solid #E5E5E5;"></td>
      				</tr>
      				<tr>
      					<!-- <td style="text-align: center;font-size: 18px;width: 20%;">구성품</td> -->
      					<td colspan="2" style="font-family: sans-serif;font-size: 18px"><%=snackInfo %></td>
      				</tr>
      				<tr>
      					<td colspan="2"><hr style="border: 1px solid #E5E5E5;"></td>
      				</tr>
      				
      				<tr>
      					<td colspan="2"><hr style="border: 1px solid #E5E5E5;"></td>
      				</tr>			
      			</table>
      			<br><br>
      			<form method="post" name="snackForm" style="margin-top: 50px;">
      			<h2 style="text-align: center;font-family: sans-serif;margin-top: 127px;">수량</h2><br>
      			<div class="snackPrice">
      				<span><input type="button" value="-" id="minus" onClick="amountMinus('<%=price%>');"></span>
      				<span><input type="text" value="1" id="snackQty" name="snackQty" readonly="readonly"></span>
      				<span><input type="button" value="+" id="plus" onClick="amountPlus('<%=price%>');"></span>
      			</div>
      			<br><br>
      			<div style="text-align: center;font-size: 20px;">총 상품금액&nbsp;&nbsp;&nbsp;&nbsp;
      				<span id="realPrice" style="color:#524c4a;font-size: 20px;"><%=price %>원</span>
      			</div>
      			<br><br>
      			<div style="margin: auto;text-align: center;">
      				<input type="button" value="장바구니" class="btnCart" onClick="javascript:inCart();">
      				<input type="button" value="선물하기" class="btnGift" onClick="javascript:Gift();">
      				<input type="button" value="구매하기" class="btnOrder" onClick="javascript:directOrd();">
      			</div>
      			<input type="hidden" name="snack_no" value="<%=snack_no %>">
      			<input type="hidden" name="place" value="direct">
      			</form>
      		</div>
      		<div style="clear: both;"> </div>
      	</div>
      </div>

		<br><br>
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