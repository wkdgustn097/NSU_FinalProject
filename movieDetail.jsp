<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" type="text/css" href="css/movie.css">
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        
        <script src="javascript/movie.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
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
         	#myChart{
         		width: 300px !important;
         		height: 300px !important;
         		margin: auto !important;
         	}
         	#InChart{
         		width: 300px !important;
         		height: 300px !important;
         		margin: auto !important;
         	}
         </style>
         
    </head>
    

        <body onLoad="summary();">
        <%	
        	
        	
        	String id= (String)session.getAttribute("sid");
        	if(id==null){
        		id="Guest";
        	}
        	
        	
        	int  movieID =Integer.parseInt(request.getParameter("movieID"));
        	String movieTitle="";
        	int click=0;
        	int man = 0;
			int woman=0;
			int one=0;int two=0;int three=0;int four=0;int five=0;
        	String dburl="jdbc:mysql://localhost:3306/movieStore";
        	String dbid="root";
        	String dbpassword="1234";
        	
        	try {
        		Class.forName("org.gjt.mm.mysql.Driver");
        		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
        		String sql="select * from movie where movieID=?";
        		PreparedStatement pstmt = con.prepareStatement(sql);
        		pstmt.setInt(1,movieID);
        		ResultSet rs = pstmt.executeQuery();
        		if(rs.next()){
        			 movieTitle=rs.getString(2);
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
        			click= rs.getInt(16);
        		
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
						
					String jsql3 = 	"select joomin,gender from user join reservemovie on user.id=reservemovie.id and reservemovie.movieTitle=?";
      				PreparedStatement jpstmt3 = con.prepareStatement(jsql3);
      				jpstmt3.setString(1, movieTitle);
      				ResultSet jrs3 = jpstmt3.executeQuery();
      				int year = Calendar.getInstance().get(Calendar.YEAR);
      				while(jrs3.next()){
      				String joomin = jrs3.getString(1);
      				String gender = jrs3.getString(2);
      				int age =Integer.parseInt(joomin.substring(0,2));
      				if(age>=21)age+=1900; //1921?????? ????????? ???????????????
      	    		else age+=2000; //2000~2020?????? ?????????
      	    		int userAge = year-age+1;
      				if(gender.equals("??? ???")){
      					man++;
      					
      				}else{
      					woman++;
      					
      				}
      				
      				if(userAge>=10&&userAge<20){
      					one++;
      				}else if(userAge>=20&&userAge<30){
      					two++;
      				}else if(userAge>=30&&userAge<40){
      					three++;
      				}else if(userAge>=40&&userAge<50){
      					four++;
      				}else if(userAge>=50&&userAge<80){
      					five++;
      				}
      				
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
                         <a href="myPageHome.jsp">???????????????</a>
                     </li>
                     <li>
                         <a href="showCart.jsp">????????????</a>
                     </li>
                     <li>
                         <a href="customNotice.jsp">????????????</a>
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
                             <span>??????</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="movieAll.jsp">?????? ?????????</a>
                                 </li>
                                 <li>
                                     <a href="movieAfter.jsp">?????? ?????????</a>
                                 </li>
                                 <li>
                                     <a href="moviePost.jsp">?????? ?????????</a>
                                 </li>                                                                  
                             </ul>
                         </li>
                         <li class>
                             <a href="reserveMain.jsp">
                             <span>??????</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="reserveMain.jsp">?????? ??????</a>
                                 </li>
                                 <li>
                                     <a href="movieTime.jsp">?????? ?????????</a>
                                 </li>
                                 <li>
                                     <a href="reserveInfo.jsp">?????? ??????</a>
                                 </li>                                                                  
                             </ul>                         
                         </li>
                         <li class>
                             <a href="eventMain.jsp">
                             <span>?????????</span>
                             </a>
                         </li>
                         <li class>
                             <a href="snackStore.jsp">
                             <span>?????????</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="snackStore.jsp#No5">?????????</a>
                                 </li>
                                 <li>
                                     <a href="snackStore.jsp#No1">??????/??????</a>
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
				                <input type="text" placeholder="????????? ??????" name="searchMovie" style="padding: 1px 0; width: 78px;"> 
						       <input type="image" src="images/btnSearch.png" class="movieSearchImg">
				          </form>
		           		 </div>
                             <!-- <a href="#" class="as_btn btn_st btn_search_on eve_side_menu">??????</a> -->
                         </li>
                         <%
              	    		if(id.equals("Guest")){
                    	%>
                        <li><a href="login.jsp" class="as_btn btn_my eve_quick">?????????</a></li>
                        <li><a href="join.jsp" class="as_btn btn_quick_on eve_side_menu">????????????</a></li>
                        <%}else{ %>
                        <li><a href="myPageHome.jsp" class="as_btn btn_my eve_quick"><%=id %>??? </a></li>
                        <li><a href="logout.jsp" class="as_btn btn_quick_on eve_side_menu">????????????</a></li>
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
          <a href="#movieAll.jsp" class="eng">??????</a>
          <ul class="sub_m" style="display: block;">
            <li><a href="movieAll.jsp" class="eng">?????? ?????????</a></li>
            <li><a href="movieAfter.jsp" class="eng">?????? ?????????</a></li>
            <li><a href="moviePost.jsp" class="eng">?????? ?????????</a></li>
          </ul>
      </li>
      <li>
          <a href="#reserveMain.jsp" class="eng">??????</a>
          <ul class="sub_m">
            <li><a href="reserveMain.jsp" class="eng">?????? ??????</a></li>
            <li><a href="movieTime.jsp" class="eng">?????? ?????????</a></li>
            <li><a href="reserveInfo.jsp" class="eng">?????? ??????</a></li>
          </ul>
      </li>
      <li>
          <a href="eventMain.jsp" class="eng">?????????</a>
          <!-- <ul class="sub_m">
            <li><a href="/vision/3r.html" class="eng">3R</a></li>
            <li><a href="/vision/professionalism.html" class="eng">Professionalism</a></li>
          </ul> -->
      </li>
      <li>
          <a href="#snackStore.jsp" class="eng">?????????</a>
          <ul class="sub_m">
            <li><a href="snackStore.jsp#No5" class="eng">?????????</a></li>
            <li><a href="snackStore.jsp#No1" class="eng">??????/??????</a></li>
          </ul>
      </li>
      <!-- <li>
          <a href="/contact/form.html" class="eng">??????</a>
      </li> -->
      <%
		if(id.equals("Guest")){
 	%>
     <li><a href="login.jsp" class="eng">?????????</a></li>
     <li><a href="join.jsp" class="eng">????????????</a></li>
     <%}else{ %>
     <li><a href="myPageHome.jsp" class="eng"><%=id %>??? </a></li>
     <li><a href="logout.jsp" class="eng">????????????</a></li>
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
     
  </div><!--hsall???  -->
  
  <div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<a href="index.jsp"><img alt="" src="images/home.png"></a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="movieAll.jsp">
							??????
						</a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="movieAll.jsp">
							?????? ?????????
						</a>
						<img alt="" src="images/bg-location.png" style="margin: 0 10px;">
						<a href="#">
							????????????
						</a>
						
					</div>
				</div>
			</div>

            <div class="container" style="text-align: center;">
            <h2 style="text-align: left">????????????</h2>
            <hr style="border: solid 1px; width:42%; text-align: left;"> <br><br>
            	<div class="mainImg" style="width: 21%;">
            		<img alt="" src="movieImages/<%=img%>"  height="330px" style="filter: drop-shadow(5px 5px 5px #000); ">
            	</div>
            	<div class="movieInfo" style="width: 50%;">
            		
            		<h2><%=movieTitle %></h2>
            		
            		??????  <img src="images/icon02.png" width="20" height="20" class="icon02"/>
            		<%if(grade.length()<=3)out.println(grade);
            			else out.println(grade.substring(0, 3));%>
            			&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;????????? : <%=reserveRate2 %> %
            		<br>
            		<hr>
            		
            		<ul class="movieInfoTitle">
            			<li><span>?????? :</span> <%=director %>&nbsp;/ &nbsp;<span>???????????? :</span> <%=producer %>&nbsp;/&nbsp; <span>?????? :</span> <%=actor %></li>
            			<li><span>?????? :</span> <%=genre %>&nbsp;/ &nbsp;<span>?????? :</span> <%=basic %></li>
            			<li><span>?????? :</span> <%=premiere %></li>
            		</ul>
            		<input type="button" onclick="location.href='reserveMain.jsp?movieID=<%=movieID %>'" value="????????????  ???" class="btnReserve">
            		
            	</div>
            	<div style="clear: both;"></div>
            	<div class="summary">
            	<div class="sum" style="width: 49%;display: inline-block;overflow: auto;height: 366px;font-family: Roboto;">
            	<span style="font-family: Roboto;font-size: 24px;color: #c9a524; text-align: center;">Summary</span><br><br><%=summary %>
            	</div>
            	<%-- <iframe name="summary1" width="40%" height="33%" style="margin-right: 20px;"></iframe>--%>
            	 <iframe class="movi" width="49%" height="39%" src="<%=iframe %>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					
            	</div>
            	
            	<br><br>
            	<div>
            		<table class="bunpo" style="width: 1400px;text-align: center;margin: auto;margin-top: 35px;">
            			<tr>
            				<td style="font-size: 22px;padding: 0 0 25px 0;">?????? ?????? ??????</td>
            				<td style="font-size: 22px;padding: 0 0 25px 0;">????????? ?????? ??????</td>
            			</tr>
            			<tr>
            				<td width="50%"><canvas id="myChart" width="100" height="100"></canvas></td>
            				<td><canvas id="InChart" width="100" height="100"></canvas></td>
            			</tr>		
            		</table>
            	</div>
            	
            	
            	
            	<br><br><h2><span style="color: #666;">?????????</span></h2><br><br><hr style="border-bottom: 1px solid #610B4B;"><br><br>
            		
	            	<div class="slider" >
	                <div><img src="movieImages/<%=steel1%>"width="100%"  height="100%" style="margin: auto !important;"/></div>
	                <div><img src="movieImages/<%=steel2%>"  width="100%" height="100%" style="margin: auto !important;"/></div>
	                <div><img src="movieImages/<%=steel3%>"  width="100%"  height="100%" style="margin: auto !important;"/></div>
                	</div>
            	<br><br><hr style="border-bottom: 1px solid #610B4B;"><br><br><br>
            
            

            <%
				}
        		
        		rs.close();
        		pstmt.close();
        		con.close();
        		
        	}catch(Exception e){
        		e.printStackTrace();
        	}
        	
        	
        	int count=0;
        	try {
        		Class.forName("org.gjt.mm.mysql.Driver");
        		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
        		String sql="select count(*) from movieGrade where movieTitle=?";
        		PreparedStatement pstmt = con.prepareStatement(sql);
        		pstmt.setString(1,movieTitle);
        		ResultSet rs = pstmt.executeQuery();
        		if(rs.next()) count=rs.getInt(1);
        		
        		rs.close();pstmt.close();
        		
        		String jsql = "update movie set click=? where movieTitle=?";
        		PreparedStatement pstmt2 = con.prepareStatement(jsql);
        		pstmt2.setInt(1, click+1);
        		pstmt2.setString(2, movieTitle);
        		pstmt2.executeUpdate();
        		
        		pstmt2.close();
        		con.close();
        	
        	}catch(Exception e){
        		e.printStackTrace();
        	}
            %>
            
            	<h2 style="text-align: left; color: #666;">
            	<%if(count==0){ %>?????? ????????? ???????????? ?????????.<%}else{ %>
            	<%=movieTitle %>??? ?????? <span style="color: #c9a524;"><%=count %></span>?????? ???????????? ?????????!<%} %> </h2><br>
            	<form action="gradeAction.jsp" method="post" name="movieGrade" style="margin-bottom: 11%;">
            	<div class="writeGrade">
            		<div class="writeGrade1">
            			<select name="grade" style="width: 70%;">
            				<option value="5">???????????????</option>
            				<option value="4">????????????</option>
            				<option value="3">?????????</option>
            				<option value="2">??????</option>
            				<option value="1">???</option>
            			</select>
            		</div>
            		<div class="writeGrade2">
            			<textarea rows="3"  name="gradeContent" placeholder="?????? ??? ?????? ???????????? ??????????????????."></textarea>
            		</div>
            		<div class="writeGrade3">
            			<input type="hidden" name="movieTitle" value="<%=movieTitle %>">
            			<input type="hidden" name="movieID" value="<%=movieID %>">
            			<input type="button" onclick="checkGrade();" value="????????? ??????">
            		</div>
            	</div>
            	</form>
            	
            	
            	<%
            		class Grade{
            		private int no;
            		private String movieTitle;
            		private int grade;
            		private String id;
            		private String gradeDate;
            		private String gradeContent;
            		
            		public int getNo() {
            			return no;
            		}
            		public void setNo(int no) {
            			this.no = no;
            		}
            		public String getMovieTitle() {
            			return movieTitle;
            		}
            		public void setMovieTitle(String movieTitle) {
            			this.movieTitle = movieTitle;
            		}
            		public int getGrade() {
            			return grade;
            		}
            		public void setGrade(int grade) {
            			this.grade = grade;
            		}
            		public String getId() {
            			return id;
            		}
            		public void setId(String id) {
            			this.id = id;
            		}
            		public String getGradeDate() {
            			return gradeDate;
            		}
            		public void setGradeDate(String gradeDate) {
            			this.gradeDate = gradeDate;
            		}
            		public String getGradeContent() {
            			return gradeContent;
            		}
            		public void setGradeContent(String gradeContent) {
            			this.gradeContent = gradeContent;
            		}
            	}
            		class GradeDAO{
            		public ArrayList<Grade> getList(String m_ti,int row,int size){
            			ArrayList<Grade>list = new ArrayList<>();
            			try {
            				String dburl="jdbc:mysql://localhost:3306/movieStore";
            	        	String dbid="root";
            	        	String dbpassword="1234";
            	        	Class.forName("org.gjt.mm.mysql.Driver");
            	        	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
            	        	
            				String sql="select * from movieGrade  where movieTitle=? order by gradeDate desc limit ?,?";
            				PreparedStatement pstmt=con.prepareStatement(sql);
            				pstmt.setString(1, m_ti);
            				pstmt.setInt(2, row);
            				pstmt.setInt(3, size);
            				ResultSet rs=pstmt.executeQuery();
            				while(rs.next()) {
            					Grade grade=new Grade();
            					grade.setNo(rs.getInt(1));
            					grade.setMovieTitle(rs.getString(2));
            					grade.setGrade(rs.getInt(3));
            					grade.setId(rs.getString(4));
            					grade.setGradeDate(rs.getString(5));
            					grade.setGradeContent(rs.getString(6));
            					
            					list.add(grade);
            				}
            				rs.close();
            				pstmt.close();
            				con.close();
            			}catch(Exception e) {
            				e.printStackTrace();
            			}
            			return list;
            		}
            	
            		}
            	
            		
            		int pageSize=10; //????????? ????????? ???????????? ???
            		//?????? ???????????? ????????? ???????????? ?????????
             		String pageNum= request.getParameter("pageNum");
            		//?????? ?????? ??????????????? ???????????? pageNum=null????????? null???????????????
            		if(pageNum==null){
            			pageNum="1";
            		} 
            		
            		//?????? ??????????????? ????????? ????????? ??????
            		GradeDAO gradeDAO= new GradeDAO();
            		Grade grade = new Grade();
            		int currentPage=Integer.parseInt(pageNum);
            		int startRow=(currentPage-1)*10; //?????? ???????????? ????????? ??????????????? ?????? = ???????????????????????? ????????? ????????????
            		ArrayList<Grade> list=gradeDAO.getList(movieTitle,startRow,10);
            	
					for(int i=0;i<list.size();i++){
	
			%>		
				
					<div class="gradeDetail">
						<div class="gradeDetail1">
							<%if(list.get(i).getGrade()==1){ %>
							<img alt="" src="images/grade1.png">
							<%} %>
							<%if(list.get(i).getGrade()==2){ %>
							<img alt="" src="images/grade2.png">
							<%} %>
							<%if(list.get(i).getGrade()==3){ %>
							<img alt="" src="images/grade3.png">
							<%} %>
							<%if(list.get(i).getGrade()==4){ %>
							<img alt="" src="images/grade4.png">
							<%} %>
							<%if(list.get(i).getGrade()==5){ %>
							<img alt="" src="images/grade5.png">
							<%} %>
						</div>
						<div class="gradeDetail2">
						
							<%=list.get(i).getId() %> &nbsp;&nbsp;|&nbsp;&nbsp;
							<img src="images/icon02.png" width="20" height="20" class="icon02"/>&nbsp;
							<span style="font-family:'Noto Sans KR', sans-serif;"><%=list.get(i).getGrade() %></span>
							<br>
							<%=list.get(i).getGradeContent() %>
							<br>
							<%=list.get(i).getGradeDate().substring(0, 16) %>
							<%if(id.equals(list.get(i).getId())){ %>
							<div style="float: right;">&nbsp;&nbsp;&nbsp;<input type="button" value="????????????" onclick="deleteGrade(<%=list.get(i).getNo()%>);"></div>
							<%} %>
						</div>
					</div>
					<br>
					<hr style="clear: both;">
					
					
					<script>
					function deleteGrade(a){
		          		var check = confirm('???????????? ?????????????????????????');
		          		if(check){
		          			alert('?????????????????????.');
		          			location.href='deleteGrade.jsp?no='+a+'&movieID=<%=movieID%>';
		          		}else{
		          			alert('????????? ?????????????????????.');
		          		}
		          	}
				</script>
		<% 
			}
		%>		
            		
           
            	
            	<br><br> <p>
		<!-- ????????? ???????????? ????????? ?????? -->
	 	<%
			if(count>0){
				int pageCount= count/pageSize+(count % pageSize ==0?0:1);//??? ????????? ???
				
				//??????????????? ????????? ??????
				int startPage=1;
				if(currentPage % 10 !=0){
					startPage=(int)(currentPage/10)*10+1;
				}else{
					startPage=((int)(currentPage/10)-1)*10+1;
				}
				int pageBlock=10; //???????????? ????????????
				int endPage=startPage+pageBlock-1;//????????? ????????? ???????????? ????????? ??????
				
				if(endPage > pageCount)endPage=pageCount;
				//??????????????? ????????? ???????????? ??????
				if(startPage >10){
		%>
				<a href="movieDetail.jsp?movieID=<%=movieID %>&pageNum=<%=startPage-10 %>">[??????]</a>
		<% 			
				}
				//????????? ??????
				for(int i=startPage;i<=endPage;i++){			
		%>		
				<a href="movieDetail.jsp?movieID=<%=movieID %>&pageNum=<%=i%>">[<%=i %>]</a>
		<% 		
			}
				//??????????????? ????????? ???????????? ??????
				if(endPage<pageCount){
		%>
				<a href="movieDetail.jsp?movieID=<%=movieID %>&pageNum=<%=startPage+10 %>">[??????]</a>
		<% 			
				}
			}
		%>
		  
		</p>  
            </div>
            
            
            
             <script>
	          	function summary(){
	          		document.summary1.location='movieSummary.jsp?movieID='+'<%=movieID%>';
	          	}
	          	
	          	var ctx = document.getElementById('myChart');
	          	var myChart = new Chart(ctx, {
	          	    type: 'doughnut',
	          	    data: {
	          	        labels: ['???', '???'],
	          	        datasets: [{
	          	            label: '# of Votes',
	          	            data: [<%=woman%>,<%=man%>],
	          	            backgroundColor: [
	          	                'rgba(255, 99, 132, 0.2)',
	          	                'rgba(54, 162, 235, 0.2)',
	          	                'rgba(255, 206, 86, 0.2)',
	          	                'rgba(75, 192, 192, 0.2)',
	          	                'rgba(153, 102, 255, 0.2)',
	          	                'rgba(255, 159, 64, 0.2)'
	          	            ],
	          	            borderColor: [
	          	                'rgba(255, 99, 132, 1)',
	          	                'rgba(54, 162, 235, 1)',
	          	                'rgba(255, 206, 86, 1)',
	          	                'rgba(75, 192, 192, 1)',
	          	                'rgba(153, 102, 255, 1)',
	          	                'rgba(255, 159, 64, 1)'
	          	            ],
	          	            borderWidth: 1
	          	        }]
	          	    },
	          	    options: {
	          	        scales: {
	          	            yAxes: [{
	          	                ticks: {
	          	                    beginAtZero: true
	          	                }
	          	            }]
	          	        }
	          	    }
	          	});
	          	
	          	
	          	var ctx = document.getElementById('InChart');
	          	var myChart = new Chart(ctx, {
	          	    type: 'bar',
	          	    data: {
	          	        labels: ['10???', '20???','30???', '40???','50???'],
	          	        datasets: [{
	          	            label: '# of Votes',
	          	            data: [<%=one%>, <%=two%>,<%=three%>, <%=four%>,<%=five%>],
	          	            backgroundColor: [
	          	                'rgba(255, 99, 132, 0.2)',
	          	                'rgba(54, 162, 235, 0.2)',
	          	                'rgba(255, 206, 86, 0.2)',
	          	                'rgba(75, 192, 192, 0.2)',
	          	                'rgba(153, 102, 255, 0.2)',
	          	                'rgba(255, 159, 64, 0.2)'
	          	            ],
	          	            borderColor: [
	          	                'rgba(255, 99, 132, 1)',
	          	                'rgba(54, 162, 235, 1)',
	          	                'rgba(255, 206, 86, 1)',
	          	                'rgba(75, 192, 192, 1)',
	          	                'rgba(153, 102, 255, 1)',
	          	                'rgba(255, 159, 64, 1)'
	          	            ],
	          	            borderWidth: 1
	          	        }]
	          	    },
	          	    options: {
	          	        scales: {
	          	            yAxes: [{
	          	                ticks: {
	          	                    beginAtZero: true
	          	                }
	          	            }]
	          	        }
	          	    }
	          	});
          </script>
            
            <section class="footer">
                <div class="wrapper" style="width: 1000px;margin: auto;">
                  <div style="display:flex;line-height: 79px; height: 60px;color: #888;">
                  <div style="margin-right:2%;">
                  <a href="index.jsp"><img src="images/logo.png" height="60px" ></a>
                  </div>
                   <a href="mainInfo1.jsp"><h4>????????????</h4></a>&nbsp;&nbsp;??
                   &nbsp;&nbsp;<a href="mainInfo2.jsp"><h4>????????????</h4></a>&nbsp;&nbsp;??
                   &nbsp;&nbsp;<a href="mainInfo3.jsp"><h4>??????/????????????</h4></a> &nbsp;&nbsp;??
                   &nbsp;&nbsp;<a href="manageLogin.jsp"><h4>????????? ?????????</h4></a>
                  </div>
                   <div style="margin-top:3%;">
                   <ul style="white-space:nowrap;">
                   <li style="list-style:none;"><span>??????</span>&nbsp;&nbsp;???????????? ????????? ????????? ????????? ????????? 91, 3???(????????? 3???)  <span>ARS</span>&nbsp;&nbsp;1544-6416</li>
                   <li style="list-style:none;"><span>????????????</span>&nbsp;&nbsp;????????? <span>???????????????????????????</span>&nbsp;&nbsp;????????? <span>?????????????????????</span>&nbsp;&nbsp;411-82-17852 &nbsp;<span>??????????????????????????? ??? 8???</span></li>
                   <li style="list-style:none;"><span>COPYRIGHT ?? MovieStoreJoongAng, Inc. All rights reserved</span></li>
                   </ul>
                   </div>
                  </div>
                </div>    
            </section>
            


        </body>
</html>