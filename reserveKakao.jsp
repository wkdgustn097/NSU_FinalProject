<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
	PrintWriter script = response.getWriter();
	String id= (String)session.getAttribute("sid");
	if(id==null){
		id="Guest";
	}
	if(id.equals("Guest")){
		
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스입니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}



	/* String movieTitle=request.getParameter("movieTitle");
	int adult = Integer.parseInt(request.getParameter("adult"));
	int student = Integer.parseInt(request.getParameter("student"));
	int baby = Integer.parseInt(request.getParameter("baby"));
	String movieDate=request.getParameter("movieDate");
	String movieTime=request.getParameter("movieTime");
	int people = adult+student+baby;
	String img = request.getParameter("img"); */
	int price2 =Integer.parseInt(request.getParameter("price"));
	int price1 = 0;

	int price=1;
	if(price2!=0){
		price1 = (int)(price2*0.05);
		price= price2-price1;
	}
	 
	
	/* String movieDateTime =movieDate+" "+movieTime;
	
	String seat = request.getParameter("seat");
	int point = Integer.parseInt(request.getParameter("point2"));
	int coupon = Integer.parseInt(request.getParameter("coupon2"));
	int price = price1 - 5000*coupon - point; */
	
	%>
	<script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp34345381'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'movieStore 결제',
            amount : <%=price%>,
            <%-- buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>', --%>
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
               /*  location.href='index.jsp'; */
              
               window.close();
              
               opener.reserveSnack.submit();
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                window.close();
                
            }
        });
        
    });
    </script>
 
</body>
</html>