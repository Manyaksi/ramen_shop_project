<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<!-- 헤드부분 -->
    <head>
      <script src="/assets/js/jquery-2.1.3.min.js"></script>
      <script type="text/javascript">
      $(document).ready(function(){
    	    <%-- 쿠키값을 읽어와 ID/PW 체크 --%>
    	    if( $.cookie(cookieIdKeyStr)!="" && $.cookie(cookieIdKeyStr)!=null ) {
    	        $("#cb_idSave").attr("checked", "checked");
    	        $("#textMemberId").val($.cookie(cookieIdKeyStr));
    	    }
    	    if( $.cookie(cookiePwKeyStr)!="" && $.cookie(cookiePwKeyStr)!=null ) {
    	        $("#cb_pwSave").attr("checked", "checked");
    	        $("#textMemberPw").val($.cookie(cookiePwKeyStr));
    	    }
    	});
      </script>
        <!-- 메타데이터 -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>	라면먹고갈래? - 대한민국 1등 라면 온라인 쇼핑</title>

        <!-- 부트스트랩 Core CSS -->
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
        
        
        <!-- 메인상단 큰배너에 관한 CSS -->
        <link rel="stylesheet" type="text/css"	href="/assets/js/amazingslider-1.css">
        
        
        <!-- 커스터마이징 CSS -->
        <link rel="stylesheet" href="/assets/css/main.css">
        <link rel="stylesheet" href="/assets/css/orange.css">
        <link rel="stylesheet" href="/assets/css/owl.carousel.css">
        <link rel="stylesheet" href="/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="/assets/css/animate.min.css">

        <!-- CSS커스터마이징 부분 -->
        <link rel="stylesheet" href="/assets/css/config.css">

        
        <link href="/assets/css/red.css" rel="alternate stylesheet" title="Red color">
        <link href="/assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
        
        
        <!--  
        <link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
        <link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
        <link href="assets/css/navy.css" rel="alternate stylesheet" title="Navy color">
        <link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
        -->

        <!-- 웹폰트 -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/earlyaccess/nanumpenscript.css' rel='stylesheet' type='text/css'>
        
        <!-- 아이콘CSS -->
        <link rel="stylesheet" href="/assets/css/font-awesome.min.css">
        
        <!-- favicon이라는 아이콘 -->
        <link rel="shortcut icon" href="/assets/images/favicon.ico">

        <!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
        <!--[if lt IE 9]>
            <script src="assets/js/html5shiv.js"></script>
            <script src="assets/js/respond.min.js"></script>
        <![endif]-->

    </head>
 <!-- 헤드끝 -->   
    
    
<body>
	<div class="wrapper">
	<%-- 상단바 시작 --%>
		<jsp:include page="/menu/topbar.jsp" />
		<%-- 상단바 끝 --%>
  <%-- 상단타이틀 서치메뉴 시작 --%>
      <jsp:include page="/menu/top.jsp"/>
  <%-- 상단타이틀 서치메뉴 끝 --%>
  
  <%-- 상단메뉴 --%>
  	  <jsp:include page="/menu/navigation.jsp"/>
  <%-- 상단메뉴 끝--%>
  
  <%-- 상단네비게이션 --%>
  	  <jsp:include page="/menu/breadcrumb.jsp"/>
  <%-- 상단네비게이션 끝--%>
  
  
  <%-- 메인컨텐츠 --%>

  <section id="cart-page">

    <div class="container">
        <!-- ========================================= 장바구니 리스트 (왼쪽) ========================================= -->
        <div class="col-xs-12 col-md-9 items-holder no-margin">
	<jsp:include page="/cart/cart_list.jsp"/>
        </div>
        <!-- ========================================= 장바구니 리스트 (왼쪽) ========================================= -->

        <!-- ========================================= 장바구니 SIDEBAR(오른쪽) ========================================= -->

        <div class="col-xs-12 col-md-3 no-margin sidebar ">
        <jsp:include page="/cart/sidebar.jsp"/>    

        <jsp:include page="/cart/coupon.jsp"/>      
        </div><!-- /.sidebar -->

        <!-- =========================================장바구니 SIDEBAR(오른쪽) : END ========================================= -->
    </div>
</section>	
  
  
  <%-- 메인컨텐츠 끝--%>
  

 

  <%-- 푸터 시작 --%>
      <jsp:include page="/menu/footer.jsp"/>
  <%-- 푸터 끝 --%>
	</div>
	
	
  <!-- 사용된 자바스크립트 모음... 뒤쪽에 두면 페이지 로딩이 좀더 빨라진다고하네요...  -->
<div>
		<script src="/assets/js/jquery-1.10.2.min.js"></script>
		<script src="/assets/js/jquery-migrate-1.2.1.js"></script>
		<script src="/assets/js/bootstrap.min.js"></script>
		<script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
		<script src="/assets/js/gmap3.min.js"></script>
		<script src="/assets/js/bootstrap-hover-dropdown.min.js"></script>
		<script src="/assets/js/owl.carousel.min.js"></script>
		<script src="/assets/js/css_browser_selector.min.js"></script>
		<script src="/assets/js/echo.min.js"></script>
		<script src="/assets/js/jquery.easing-1.3.min.js"></script>
		<script src="/assets/js/bootstrap-slider.min.js"></script>
		<script src="/assets/js/jquery.raty.min.js"></script>
		<script src="/assets/js/jquery.prettyPhoto.min.js"></script>
		<script src="/assets/js/jquery.customSelect.min.js"></script>
		<script src="/assets/js/wow.min.js"></script>
		<script src="/assets/js/scripts.js"></script>
		<script src="/assets/js//jquery.js"></script>
		<script src="/assets/js//amazingslider.js"></script>
		<script src="/assets/js//initslider-1.js"></script>
		<script src="http://w.sharethis.com/button/buttons.js"></script>
</div>		
<!-- 자바스크립트끝 -->		
	</body>
</html>