<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
var c = confirm("정말로 회원 탈퇴를 하시겠습니까?");
if(c == true) {
   location.href='myUserDeleteAction.jsp';
} else {
	location.href='myPageHome.jsp';
}
</script>
</body>
</html>