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
        <link rel="stylesheet" type="text/css" href="css/snack.css">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
       <script language="javascript" src="javascript/snack.js"></script>
          <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
         <style>
         	.cartTableFirst td {
				    color: white;
				}
         </style>
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
						<a href="showCart.jsp">
							장바구니
						</a>

						
					</div>
				</div>
			</div>
			
			<div class="container">
			<div style="text-align: left;"><h2 > 장바구니 </h2></div><br>
         	<hr style="border: solid 1px;  text-align: left;"> <br><br>
         	<form method="post" action="reserveSnackPay.jsp" name="cartForm">
			<%
			String dburl="jdbc:mysql://localhost:3306/movieStore";
        	String dbid="root";
        	String dbpassword="1234";
			
        	String ctNo = (String)session.getId();
        	Class.forName("org.gjt.mm.mysql.Driver");
    		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
    		
    		int total=0;
    		int minusPrice=0;
			
			try {
        		
        		String sql="select * from cart where ctNo=?";
        		PreparedStatement pstmt = con.prepareStatement(sql);
        		pstmt.setString(1, ctNo);

        		ResultSet rs = pstmt.executeQuery();

        		if(!rs.next()){                       
        	%>
        			<div style="height: 293px;line-height: 293px; text-align: center;">
        			장바구니가 비었습니다.
        			
        			</div>
        	<%
        		}else{
        			
        	%>
        		
        		<table class="cartTable" cellspacing="0" style="width: 1400px;">
        			<thead>
        			<tr class="cartTableFirst" >
        				<td>상품명</td><td width="100px">판매금액</td><td width="100px">수량</td><td width="100px">구매금액</td><td>선택상품 삭제</td>
        			</tr>
        			<tr>
        				<td colspan="5"><hr class="scv" style="width: 1400px;"></td>
        			</tr>
        			</thead>
        			<tbody>
        				
        	<%
	        	String jsql2 = "select * from cart where ctNo = ?";
	    		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	    		pstmt2.setString(1, ctNo);		
	
	    		ResultSet rs2 = pstmt2.executeQuery(); 
	
	    		String userGrade="";
				int percent=0;
				
        			String sql4 = "select * from userGrade where id=?";
            		PreparedStatement pstmt4=con.prepareStatement(sql4);
            		pstmt4.setString(1, id);
            		ResultSet rs4 = pstmt4.executeQuery();
            		rs4.next();
            		userGrade=rs4.getString(2);
            		
            		rs4.close();
            		pstmt4.close();
            		       
               
        		if(userGrade.equals("일반"))percent=0;
        		else if(userGrade.equals("Silver"))percent=5;
        		else if(userGrade.equals("Gold")) percent=7;
        		else percent=10;
	    		
	
	    		while(rs2.next()) 
	      		{			                   
	    			int snack_no = rs2.getInt(2);	
	        		int snackQty = rs2.getInt(3);
	
	        		String jsql3 = "select * from snack where snack_no = ?";
	    	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	    		    pstmt3.setInt(1, snack_no);
	    		    
	    			ResultSet rs3 = pstmt3.executeQuery(); 
	    			rs3.next();
	
	    			String	snackName =  rs3.getString(2);
	    			String snackImg= rs3.getString(3);
	    			String snackInfo=rs3.getString(4);
	    			
	    			int snackPrice =  rs3.getInt(6);
	    				
	        		int amount = snackPrice * snackQty;   
	    			total = total + amount;  
        	%>			
        			<tr>
        				<td>
        					<div style="display: inline-flex;">
		        				<a href="snackDetail.jsp?snack_no=<%=snack_no%>"><img src="snackImages/<%=snackImg%>" width="100px"></a>
		        				<div style="margin: auto;margin-left: 10px;"><%=snackName %><br>
		        					<span style="font-family: sans-serif;font-size: 13px;"><%=snackInfo %></span>
		        				</div>
	        				</div>
        				</td>
        				<td><%=snackPrice%></td><td><%=snackQty %></td><td><%=amount %></td>
						<td>
							<input type="button"value="삭제" class="btnDeleteCart"onclick="location.href='cartOneDelete.jsp?ctNo=<%=ctNo%>&snack_no=<%=snack_no%>'">
						</td>
        			</tr>	
        		
        	<% 
        		
				}//while
	    		
        		double minusPrice2 = total- total*((double)percent/100);
        		minusPrice = (int)minusPrice2; 
			%>	
					
				<tr>
     				<td colspan="5"><hr class="scv"  style="width: 1400px;"></td>
     			</tr>
     			</tbody>
			</table>
			<br>
			
			<br><br>
			<div style="margin-bottom: 10px;">* 고객님은 <%=userGrade %>등급으로 <%=percent %>% 만큼 할인됩니다.</div>
			<div>
				<table class="snackPriceTable" cellspacing="0">
					<tr>
        				<td colspan="5"><hr class="scv" style="width: 1400px;"></td>
        			</tr>
					<tr style="background: #e4bc74;">
						<td>총 상품 금액</td><td></td><td>할인금액</td><td></td><td>총결제 예정금액</td>
					</tr>
					<tr>
						<td><span class="total"><%=total %></span>원</td><td><img src="images/minus.png" width="50px"></td>
						<td><span class="total"><%=total-minusPrice %></span>원</td><td><img src="images/equals.png" width="50px"></td>
						<td style="padding: 25px;"><span class="total"><%=minusPrice%></span>원</td>
					</tr>
					<tr>
        				<td colspan="5"><hr class="scv" style="width: 1400px;"></td>
        			</tr>	
				</table>
			</div><br><br><br><br>
			<div style="text-align: center;">
				<input type="hidden" name="userGrade" value="<%=userGrade %>">
				<input type="hidden" name="percent" value="<%=percent %>">
				<input type="hidden" name="total" value="<%=total %>">
				<input type="hidden" name="place" value="cart">
				<input type="button" value="카트 비우기" class="btnSnackBuy1" style="font-size: 18px;" onclick="location.href='cartAllDelete.jsp?ctNo=<%=ctNo%>'">
				<input type="button" onclick="cartGift();" value="선물하기" class="btnSnackBuy2" style="font-size: 18px;">
				<input type="button" onclick="cartBuy();" value="구매하기" class="btnSnackBuy" style="font-size: 18px;">
			</div>
			<% 
			}//else
			}catch(Exception e){
				e.printStackTrace();
			}
			%>
			
      </form>
     </div>     	 
            <section class="footer">
                <div class="wrapper" style="width: 1400px;margin: auto;">
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