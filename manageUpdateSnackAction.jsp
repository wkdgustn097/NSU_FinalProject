<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	

//프로젝트내에 만들어질 폴더를 저장할 이름 변수선언
String realfolder="";
//실제 만들어질 폴더명을 설정
String savefolder = "/images";
//한글설정
String encType="utf-8";
//저장될 파일 사이즈를 설정
int maxSize=1024*1024*5;//5mega

//파일이 저장될 경로값을 읽어오는 객체
ServletContext context = getServletContext();
realfolder = request.getSession().getServletContext().getRealPath("/");
String savePath = realfolder + "movieAfterImages";

try{
	//클라이언트로부터 넘어온 데이터를 저장해주는 객체
	MultipartRequest multi= new MultipartRequest(request,savePath,maxSize,encType,
			new DefaultFileRenamePolicy());//파일이름 변경을 자동으로 해주는 클래스
			
	int snack_no =Integer.parseInt(multi.getParameter("snack_no"));		
	
	String snackName = multi.getParameter("snackName");	
	String snackImg=multi.getOriginalFileName("snackImg");
	String snackInfo= multi.getParameter("snackInfo");
	String snackCtg = multi.getParameter("snackCtg");
	int price = Integer.parseInt(multi.getParameter("snackPrice"));
	
	
	String dburl="jdbc:mysql://localhost:3306/movieStore";
	String dbid="root";
	String dbpassword="1234";
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection con=DriverManager.getConnection(dburl,dbid,dbpassword);
	String sql="update snack set snackName=?,snackImg=?, snackInfo=?, snackCtg=?, price=? where snack_no=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, snackName);
	pstmt.setString(2, snackImg);
	pstmt.setString(3, snackInfo);
	pstmt.setString(4, snackCtg);
	pstmt.setInt(5, price);
	pstmt.setInt(6, snack_no);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
	%>
		<script>
			alert('수정이 완료 되었습니다.');
			location.href='manageSnack.jsp';
		</script>
	<% 
	
}catch(Exception e){
	e.printStackTrace();
}

	
	


	
	
%>	
</body>
</html>