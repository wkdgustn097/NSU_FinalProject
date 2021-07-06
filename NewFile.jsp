<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/NewFile.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="/common/js/common.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <script type="text/javascript" src="/_module/js/common.js"></script>
  <div class="hsall">
      <div class="header">
       <div class="nav_area">
            <div class="sc_nav">
                 <ul class="sc_g_left">
                     <li></li>
                 </ul>
                 <ul class="sc_g_right">
                     <li>
                         <a href="#">마이페이지</a>
                     </li>
                     <li>
                         <a href="#">장바구니</a>
                     </li>
                     <li>
                         <a href="#">고객센터</a>
                     </li>
                 </ul>
           </div>
           <div class="m_nav">
                <h1 class="logo">
                     <a href="index.jsp">yes영화
                    </a>
                </h1>
                <div class="m_gnb_area">
                     <ul class="m_gnb_list">
                         <li class>
                             <a href="#">
                             <span>영화</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="#">현재 상영작</a>
                                 </li>
                                 <li>
                                     <a href="#">상영 예정작</a>
                                 </li>
                                 <li>
                                     <a href="#">무비 포스트</a>
                                 </li>                                                                  
                             </ul>
                         </li>
                         <li class>
                             <a href="#">
                             <span>예매</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="#">빠른 예매</a>
                                 </li>
                                 <li>
                                     <a href="#">상영 시간표</a>
                                 </li>
                                 <li>
                                     <a href="#">할인 안내</a>
                                 </li>                                                                  
                             </ul>                         
                         </li>
                         <li class>
                             <a href="#">
                             <span>이벤트</span>
                             </a>
                         </li>
                         <li class>
                             <a href="#">
                             <span>스토어</span>
                             </a>
                             <ul class="m_sub_gnb">
                                 <li>
                                     <a href="#">관람권</a>
                                 </li>
                                 <li>
                                     <a href="#">스낵/음료</a>
                                 </li>	                                                                 
                             </ul>                           
                         </li>
                     </ul>
                </div>
                <div class="aside_rnb eve_parent">
                     <ul class="as_rng_list">
                         <li>
                             <a href="#" class="as_btn btn_st btn_search_on eve_side_menu">검색</a>
                         </li>
                         <li>
                             <a href="#" class="as_btn btn_my eve_quick">로그인</a>
                         </li>
                         <li>
                             <a href="#" class="as_btn btn_quick_on eve_side_menu">회원가입</a>
                         </li>                                                  
                     </ul>
                </div>
                
                <button class="menu_b"></button>
                
           </div>
      </div>
      
      <div class="all_menu">
      <button class="close_b"></button>
      <ul>
      <li>
          <a href="#KDA" class="eng">영화</a>
          <ul class="sub_m" style="display: block;">
            <li><a href="/KDA/about.html" class="eng">현재 상영작</a></li>
            <li><a href="/KDA/ceo.html" class="eng">상영 예정작</a></li>
            <li><a href="/KDA/location.html" class="eng">무비 포스트</a></li>
          </ul>
      </li>
      <li>
          <a href="#business" class="eng">예매</a>
          <ul class="sub_m">
            <li><a href="/business/ngo.html" class="eng">빠른 예매</a></li>
            <li><a href="/business/commercial.html" class="eng">상영 시간표</a></li>
            <li><a href="/business/commercial.html" class="eng">할인 안내</a></li>
          </ul>
      </li>
      <li>
          <a href="#vision" class="eng">이벤트</a>
      </li>
      <li>
          <a href="#recruitment" class="eng">스낵/음료</a>
          <ul class="sub_m">
            <li><a href="/recruitment/talent.html" class="eng">관람권</a></li>
            <li><a href="/recruitment/opportunity.html" class="eng">스낵/음료</a></li>
          </ul>
      </li>
      <li>
          <a href="/contact/form.html" class="eng">검색</a>
      </li>
      <li>
          <a href="/contact/form.html" class="eng">로그인</a>
      </li>
      <li>
          <a href="/contact/form.html" class="eng">회원가입</a>
      </li>      
  </ul>
</div>

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
  </div>
   
  <div class="section">
  
  </div>
  
  <div class="footer">
  
  </div>

</body>
</html>