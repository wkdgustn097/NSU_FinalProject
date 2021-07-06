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
             			String movieTitle=request.getParameter("movieTitle");
	             		int adult = Integer.parseInt(request.getParameter("adult"));
	        			int student = Integer.parseInt(request.getParameter("student"));
	        			int baby = Integer.parseInt(request.getParameter("baby"));
	        			String movieDate=request.getParameter("movieDate");
	        			String movieTime=request.getParameter("movieTime");
	        			int people = adult+student+baby;
	        			String img = request.getParameter("img");
	        			int price1 =Integer.parseInt(request.getParameter("price"));
	        			String seat1[] = request.getParameterValues("seat1");
	        			String seat="";
	        			for(int i=0;i<seat1.length;i++){
	        				if(seat==""){
	        					seat=seat1[i];
	        				}else{
	        					seat+=","+seat1[i];
	        				}
	        			}
	        			String ticket = request.getParameter("ticket");
	        			String userGrade="";
	        			int coupon=0;
	        			int point=0;
	        			int percent=0;
	        			
	        			String dburl="jdbc:mysql://localhost:3306/movieStore";
	                	String dbid="root";
	                	String dbpassword="1234";
	        			
	                	Class.forName("org.gjt.mm.mysql.Driver");
	            		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	            		
	            		try{
	            			String sql = "select * from userGrade where id=?";
		            		PreparedStatement pstmt=con.prepareStatement(sql);
		            		pstmt.setString(1, id);
		            		ResultSet rs = pstmt.executeQuery();
		            		rs.next();
		            		userGrade=rs.getString(2);
		            		coupon=rs.getInt(4);
		            		point=rs.getInt(3);
		            		
		            		rs.close();
		            		pstmt.close();
		            		       
	                    }catch(Exception e){
	  	            			e.printStackTrace();
	  	            		}
	            		if(userGrade.equals("일반"))percent=0;
	            		else if(userGrade.equals("Silver"))percent=5;
	            		else if(userGrade.equals("Gold")) percent=7;
	            		else percent=10;
	            		double price2 =price1 - price1*((double)percent/100);
	            		int price = (int)price2; 
	            		
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
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="reservePay.jsp">
							결제하기
						</a>
				</div></div></div>
		<form method="post" action="reserveProc.jsp" name="reserveSnack">
			<div class="container">
					<div>
                   		<h2 style="text-align: left; " class="mo"> 결제하기 </h2>
                   </div>
                   
                   <hr style="border: solid 1px; width:42%;text-align: left; "> <br>
             		<span style="float: left;/*  color: brown; */"><%=id %>님은 <%=userGrade %> 등급으로 <span style="color: red;"><%=percent %>%</span>가 할인됩니다.</span><br><br>
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
             		
                   <div class="reservePayForm">
                   
                   		<div>
                   			
                   			<div class="step">STEP 1.</div>
                   			<div class="open">할인쿠폰<span  class="coupon1"><img src="images/btn-bottom.png" width="30" height="23" onclick="openCoupon();"></span> </div>
                   			<div class="content open1" >MY 할인쿠폰	<span id="coupon"><%=coupon %></span>개
                   			  <input type="text" value="0" name="coupon2" id="myCoupon" readonly="readonly" onchange="useCoupon();">
                   			  <input type="button" value="+" onclick="plus();" id="cplus" style="padding:0 6px;">
                   			  <input type="button" value="-" onclick="minus();" id="cminus" style="padding:0 6px;"> <span style="font-size: 14px; ">* 쿠폰은 한 장당 5000원 입니다.</span>
                   			 </div>
                   			
                   		</div>
                   		<div>
                   			<div class="step">STEP 2.</div>
                   			<div class="open">포인트 결제<span class="coupon1"><img src="images/btn-bottom.png" width="30" height="23" onclick="openPoint();"></span></div>
                   			<div class="content open2">보유 포인트 <span id="point"><%=point %></span>원  &nbsp;&nbsp;&nbsp;&nbsp;
	                   			사용할 포인트 <input type="text" value="0" name="point2" onchange="usePoint('<%=coupon %>','<%=price1-price %>');" id="useP">원  
	                   			<%-- <input type="button" value="전체사용"  style="padding: 5px 12px;background: #7E5E00;color: #fff;" onclick="allPoint('<%=coupon%>','<%=price1-price %>');"> --%>
	                   			<input type="button" value="다시입력" class="resetInput" onclick="restartPoint('<%=coupon%>','<%=price1-price %>');">
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
                   			<div class="reservePayment1_1" >결제하실 금액</div>
                   			<div class="reservePayment1_2"><span id="oPrice" style=""><%=price1 %></span> 원</div>
                   		</div>
                   		<div class="reservePayment1">
                   			
                   			<div class="reservePayment1_1">총 할인금액</div>
                   			<div class="reservePayment1_4"><span id="totalMinus" style="color: white"><%=price1-price %></span>원</div>
                   		</div>
                   		<div class="reservePayment1">
                   			
                   			<div class="reservePayment1_1">남은 결제금액</div>
                   			<div class="reservePayment1_6"><span id="totalPrice" style="color: white"><%=price %></span>원</div>
                   		</div>
                   		
                   </div>
                   
                   <div style="clear: both;"></div>
                   
                
	               
			</div>
			
         
			<div class="reserveBottom">
			 	<div class="bottom1">
			 		<div class="bottom1_1"><img alt="" src="movieImages/<%=img %>" width="100px" height="150px;">
						<span class="bottom_tit">
						<div style="font-size: 19px;">STEP 1</div>
						<%=movieTitle %><br>성인 <%=adult%>명 청소년 <%=student %>명 아이 <%=baby %>명<br><%=movieDate %>&nbsp;&nbsp;/  <%=movieTime %><br><%=price %>원</span></div>	
					<div class="bottom1_2" style="font-size: 27px;"><div style="font-size: 19px;">STEP 2</div>좌석 : <%=seat %></div>
					<div class="bottom1_2"><div style="font-size: 19px;color: red;">STEP 3</div>&nbsp;
						<input type="button" value="결제하기" class="btnReserveGo2" onclick="checkReserveValue();">
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
			  <input type="hidden" name="seat" value="<%=seat %>"> 
			  <input type="hidden" name="ticket" value="<%=ticket%>">
			</form>
			 
			 <script>
         	document.querySelector('.open1').style.display='none';
			document.querySelector('.open2').style.display='none';
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