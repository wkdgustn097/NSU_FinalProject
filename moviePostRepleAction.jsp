<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
        	
        	request.setCharacterEncoding("utf-8");
        	String id= (String)session.getAttribute("sid");
        	if(id==null){
        		id="Guest";
        	}
        	
        	if(id.equals("Guest")){
       %>
       			<script>
       				alert('로그인이 필요한 서비스 입니다.');
       				window.close();
       				opener.location.href='login.jsp';
       			</script>
       <% 		
        	}else{
        	
        	String dburl="jdbc:mysql://localhost:3306/movieStore";
        	String dbid="root";
        	String dbpassword="1234";
        	Class.forName("org.gjt.mm.mysql.Driver");
    		Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
    		
    		String moviePost_no = request.getParameter("moviePost_no");
    		String repleContent = request.getParameter("repleContent");
    		if(repleContent.equals("")||repleContent==null){
    	%>		
    		<script>
    			alert('내용을 입력해주세요.');
    			history.back();
    		</script>
    	<% 
    		}else{
    			String sql1 = "select now()";
    			PreparedStatement pstmt1 = con.prepareStatement(sql1);
    			ResultSet rs1 = pstmt1.executeQuery();
    			rs1.next();
    			String now = rs1.getString(1);
    			
    			String sql = "insert into moviepostReple values(null,?,?,?,?)";
    			PreparedStatement pstmt = con.prepareStatement(sql);
    			pstmt.setString(1, moviePost_no);
    			pstmt.setString(2, id);
    			pstmt.setString(3, repleContent);
    			pstmt.setString(4, now);
    			pstmt.executeUpdate();
    	%>		
    			<script>
    				alert('등록이 완료되었습니다.')
    				location.href=document.referrer;
    			</script>
    	<% 
    			
    		}
        	}
        %>
</body>
</html>