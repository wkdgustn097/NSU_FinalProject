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
	String no = request.getParameter("no");
%>
<script>
var c = confirm("예매를 취소하시겠습니까? 환불은 포인트로 추가됩니다.");
if(c == true) {
   location.href='myPageDeleteSnackReserveAction.jsp?no=<%=no%>';
} else {
	location.href='myPageHome.jsp';
}
</script>
</body>
</html>