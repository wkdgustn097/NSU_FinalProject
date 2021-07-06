<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/movie.css">
        <link rel="stylesheet" type="text/css" href="css/join.css">
     	 <script language="javascript" src="javascript/user.js"></script>
     	 <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
    <body>
         <%
        	String id= (String)session.getAttribute("sid");
	     	String dburl="jdbc:mysql://localhost:3306/movieStore";
	    	String dbid="root";
	    	String dbpassword="1234";
	    	
	    	String password="";
	    	String name="";
	    	String gender="";
	    	String phone="";
	    	String email="";
	    	String joomin="";
	    	
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
        	try {
        		Class.forName("org.gjt.mm.mysql.Driver");
        		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
        		String sql="select * from user where id=?";
        		PreparedStatement pstmt = con.prepareStatement(sql);
        		pstmt.setString(1, id);
        		ResultSet rs = pstmt.executeQuery();
        		if(rs.next()){
        			password=rs.getString(2);
        			name=rs.getString(3);
        			gender=rs.getString(4);
        			phone=rs.getString(5);
        			email=rs.getString(6);
        			joomin=rs.getString(7);
        		}
        		
        		rs.close();
        		pstmt.close();
        		con.close();
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
  
  

     <div class="container">
     	
     	<div class="content">
     		<h2 style="text-align: center;">개인정보 수정</h2>
     		<br>
     		*회원님의 정보를 정확히 입력해주세요.<br><br>
     		<hr><br>
     		<form action="myUserUpdateAction.jsp" method="POST" name="newMem">
            
            <table width="700" height="600" cellpadding="0" style="margin: auto;">
                <tr class="register" height="30">
                    <td width="5%"align="center" ></td>
                    <td width="15%">ID</td>
                    <td><%=id %></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr /></td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">비밀번호</td>
                    <td><input type="password" name="password" value="<%=password %>" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr /></td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">이름</td>
                    <td><input type="text" name="name" value="<%=name%>"/></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr /></td>
                </tr>
                <%
                	String joominArr[]=joomin.split("-");
                %>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">주민등록번호</td>
                    <td><input type="text" name="joomin1" value="<%=joominArr[0]%>" size="7"/>&nbsp;-
                    	&nbsp;<input type="text" name="joomin2" value="<%=joominArr[1]%>" size="7"/></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr /></td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">성별</td>
                    <%
                    	if(gender.equals("남 성")){
                    %>
                    <td>남 성&nbsp;<input type="radio" name="gender" value="남 성" checked/>&nbsp;여 성&nbsp;<input type="radio" name="gender" value="여 성"/> </td>
               		<%
                    	}else{
               		%>
               		<td>남 성&nbsp;<input type="radio" name="gender" value="남 성"/>&nbsp;여 성&nbsp;<input type="radio" name="gender" value="여 성" checked/> </td>		
               		<%
               		}
               		%>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr /></td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">전화번호</td>
                    <td>
                    <%
                    	String phoneArr[] = phone.split("-");
                    	String phoneSelected[] = new String[5];
                    	if(phoneArr[0].equals("010")){
                    		phoneSelected[0]="selected";
                    	}else if(phoneArr[0].equals("011")){
                    		phoneSelected[1]="selected";
                    	}else if(phoneArr[0].equals("016")){
                    		phoneSelected[2]="selected";
                    	}else if(phoneArr[0].equals("017")){
                    		phoneSelected[3]="selected";
                    	}else if(phoneArr[0].equals("018")){
                    		phoneSelected[4]="selected";
                    	}
                    	
                    %>
                    	<select name="phone1">
                    		<option value="010" <%=phoneSelected[0]%>>010</option>
                    		<option value="011" <%=phoneSelected[1]%>>011</option>
                    		<option value="016" <%=phoneSelected[2]%>>016</option>
                    		<option value="017" <%=phoneSelected[3]%>>017</option>
                    		<option value="018" <%=phoneSelected[4]%>>018</option>
                    	</select> - <input type="text" name="phone2" size="5" value="<%=phoneArr[1]%>"> - <input type="text" name="phone3" size="5" value="<%=phoneArr[2]%>">
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr /></td>
                </tr>
                
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">이메일</td>
                    <td><input type="email" name="email" value="<%=email%>"/></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr /></td>
                </tr>
            </table>
        <br />
        <input type="hidden" name="id" value="<%=id%>"> &nbsp;&nbsp;
        <div style="text-align: center;">
       <input type="button" value="변경" class="button button1" onclick="checkValue()">&nbsp;&nbsp;&nbsp;&nbsp;
       <a href="myPageHome.jsp"><input type="button" class="button button4" value="취    소"></a>
         </div>  
        </form>
     		
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