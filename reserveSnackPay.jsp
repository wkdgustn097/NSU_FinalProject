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
        <link rel="stylesheet" type="text/css" href="css/reserve.css">
         <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
       <script language="javascript" src="javascript/reserve.js"></script>
         
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
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="reserveSnackPay.jsp">
							결제하기
						</a>
						
					</div>
				</div>
			</div>
			
			<div class="container">
			<div style="text-align: left;"><h2>상품결제 </h2></div><br>
         	<hr style="border: solid 1px;  text-align: left;"> <br><br>
         	<form method="post" action="reserveSnackPayAction.jsp" name="reserveSnack">
         	<div style="text-align: left; margin-bottom: 10px;">구매상품정보</div>
         	<table class="cartTable" cellspacing="0">
        			<thead>
        			<tr class="cartTableFirst">
        				<td colspan="2" width="400px">상품명</td><td width="100px">판매금액</td><td width="100px">수량</td><td width="100px">구매금액</td>
        			</tr>
        			<tr>
        				<td colspan="5"><hr class="scv" style="width: 1400px;"></td>
        			</tr>
        			</thead>
        			<tbody>
			<%
			String dburl="jdbc:mysql://localhost:3306/movieStore";
        	String dbid="root";
        	String dbpassword="1234";
			
        	String ctNo = (String)session.getId();
        	int total = Integer.parseInt(request.getParameter("total"));
        	String userGrade = request.getParameter("userGrade");
        	int percent = Integer.parseInt(request.getParameter("percent"));
        	
        	double minusPrice2 = total- total*((double)percent/100);
    		int minusPrice = (int)minusPrice2; 
        	
        	Class.forName("org.gjt.mm.mysql.Driver");
    		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
    		
    	
			
			try {
				String sql3 = "select * from userGrade where id=?";
        		PreparedStatement pstmt3=con.prepareStatement(sql3);
        		pstmt3.setString(1, id);
        		ResultSet rs3 = pstmt3.executeQuery();
        		rs3.next();
        		userGrade=rs3.getString(2);
        		int coupon=rs3.getInt(4);
        		int point=rs3.getInt(3);
        		
        		
        		String sql="select * from cart where ctNo=?";
        		PreparedStatement pstmt = con.prepareStatement(sql);
        		pstmt.setString(1, ctNo);
        		ResultSet rs = pstmt.executeQuery();
        		while(rs.next()){
        			int snack_no = rs.getInt(2);
        			int snackQty= rs.getInt(3);
        			
        			String sql2 = "select * from snack where snack_no=?";
        			PreparedStatement pstmt2 = con.prepareStatement(sql2);
        			pstmt2.setInt(1, snack_no);
        			ResultSet rs2 = pstmt2.executeQuery();
        			rs2.next();
        			String snackName= rs2.getString(2);
        			String snackImg = rs2.getString(3);
        			String snackInfo = rs2.getString(4);
        			int price = rs2.getInt(6);
        			
        			int amount= price* snackQty;
        	%>
        			<tr>
        				<td width="75px">
        					<a href="snackDetail.jsp?snack_no=<%=snack_no%>"><img src="snackImages/<%=snackImg%>" width="100px"></a>
        				</td>
        				<td width="100px">	
	        				<div style="margin: auto;"><%=snackName %><br>
	        					<span style="font-family: sans-serif;font-size: 13px;"><%=snackInfo %></span>
	        				</div>
	        				
        				</td>
        				<td><%=price%></td><td><%=snackQty %></td><td><%=amount %></td>
        			</tr>	
        	<% 		
        		}
        	%>
        		<tr>
     				<td colspan="5"><hr class="scv" style="width: 1400px;"></td>
     			</tr>
        		</tbody>
        		</table>
        		<br>
			
			<br><br>
			
			
			<script>
                   function changeRadio(){
                   		var i = document.getElementsByClassName('radioBtn');
                   		var t1 = document.querySelector('#payTable1');
                   		var t2 = document.querySelector('#payTable2');
                   		
                   		for(var j=0;j<i.length;j++){
                   			if(i[0].checked){
                       			t1.style.display='block';
                       			t2.style.display='none';
                       		}if(i[1].checked){
                       			t1.style.display='none';
                       			t2.style.display='block';
                       		}
                   		}
                   }
                   		
                   		
                   </script>
             		<div style="text-align: left;display: inline;float: left;">* 고객님은 <%=userGrade %>등급으로 <span style="color: red;"><%=percent %>%</span> 만큼 할인됩니다.</div>
             		<div style="text-align: left;">
             			<input type="button" value="할인안내" onclick="location.href='reserveInfo.jsp'" class="btnReserveInfo" style="width: 100px;">
             		</div>
                   <div class="reservePayForm">
                   
                   		<div>
                   			
                   			<div class="step">STEP 1.</div>
                   			<div class="open">할인쿠폰<span  class="coupon1"><img src="images/btn-bottom.png" width="30" height="23" onclick="openCoupon();"></span> </div>
                   			<div class="content open1" >MY 할인쿠폰	<span id="coupon"><%=coupon %></span>개
                   			  <input type="text" value="0" name="coupon2" id="myCoupon" readonly="readonly" onchange="useCoupon();">
                   			  <input type="button" value="+" onclick="plus();" id="cplus" style="padding: 5px;">
                   			  <input type="button" value="-" onclick="minus();" id="cminus" style="padding:5 6;"> <span style="font-size: 14px; /* color: blue; */">* 쿠폰은 한 장당 5000원 입니다.</span>
                   			 </div>
                   			
                   		</div>
                   		<div>
                   			<div class="step">STEP 2.</div>
                   			<div class="open">포인트 결제<span class="coupon1"><img src="images/btn-bottom.png" width="30" height="23" onclick="openPoint();"></span></div>
                   			<div class="content open2">보유 포인트 <span id="point"><%=point %></span>원  &nbsp;&nbsp;&nbsp;&nbsp;
	                   			사용할 포인트 <input type="text" value="0" name="point2" onchange="usePoint('<%=coupon %>','<%=total-minusPrice %>');" id="useP">원  
	                   			<input type="button" value="다시입력"  class="resetInput" onclick="restartPoint('<%=coupon%>','<%=total-minusPrice %>');">
                   			</div> 
                   			
                   		</div>
                   		<div>
                   			<div class="step">STEP 3. 최종결제</div>
                   			<div class="rd">
								<label class="box-radio-input" onclick="changeRadio();"><input type="radio" class="radioBtn" name="cp_item" value="신용카드" checked="checked"><span>신용카드</span></label>
								<label class="box-radio-input" onclick="changeRadio();"><input type="radio" class="radioBtn" name="cp_item" value="휴대폰결제"><span>휴대폰결제</span></label>
								<label class="box-radio-input" onclick="changeRadio();"><input type="radio" class="radioBtn" name="cp_item" value="카카오페이" onclick="kakao();"><span>카카오페이</span></label>
							</div>
							
							<div style="margin-top: 30px;">
								<table id="payTable1">
								<tr>
									<td>카드종류</td>
									<td>
										<select name="payBank" style="width: 120px;">
											<option value="">은행선택</option>
											<option value="국민은행">국민은행</option>
											<option value="농협은행">농협은행</option>
											<option value="신한은행">신한은행</option>
											<option value="기업은행">기업은행</option>
										</select>
									</td>
								</tr>
								<tr>	
									<td>카드 번호</td>
									<td><input type="text" name="payCard1" size="4">-<input type="text" name="payCard2" size="4">
										-<input type="text" name="payCard3" size="4">-<input type="text" name="payCard4" size="4"></td>
									<td>비밀 번호</td>
									<td><input type="password" name="payPass" size="6"></td>
								</tr>			
								</table>
								<table id="payTable2" style="display: none;">
									<tr>
										<td>휴대폰 번호</td>
										<td>
										<select name="payPhone1" style="width: 70px;">
				                    		<option value="010" selected>010</option>
				                    		<option value="011">011</option>
				                    		<option value="016">016</option>
				                    		<option value="017">017</option>
				                    		<option value="018">018</option>
		                    			</select> 
		                    	- <input type="text" name="payPhone2" size="5"> -
		                    	 <input type="text" name="payPhone3" size="5">
										</td>
								</table>
							</div>
							
                   		</div>
                   </div>
                   
                   <div class="reservePayment" style="font-size: 20px;">
                   		<div class="reservePayment1">
                   			<div class="reservePayment1_1">결제하실 금액</div>
                   			<div class="reservePayment1_2"><span id="oPrice" ><%=total%></span> 원</div>
                   		</div>
                   		<div class="reservePayment1">
                   			<div class="reservePayment1_1">총 할인금액</div>
                   			<div class="reservePayment1_4"><span id="totalMinus" ><%=total-minusPrice %></span>원</div>
                   		</div>
                   		<div class="reservePayment1">
                   			
                   			<div class="reservePayment1_1">남은 결제금액</div>
                   			<div class="reservePayment1_6"><span id="totalPrice" ><%=minusPrice%></span>원</div>
                   		</div>
                   		
                   </div>
                   
                  <!--  <div style="clear: both;"></div> -->
                   <div style="text-align: right">
                   <input type="hidden" name="total" value="<%=minusPrice %>">
                   	<input type="button" value="결제하기" onclick="checkReserveValue();" class="btnReserveGo3" style="padding: 23px 111px;margin-right: 31px;">
                   </div>
        	<% 	
			}catch(Exception e){
				e.printStackTrace();
			}
        	%>
        	</form>	
     		</div>  
     		 <script>
         	 document.querySelector('.open1').style.display='none';
			document.querySelector('.open2').style.display='none'; 
         </script>	   	 
          <div style="clear: both;"></div>
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