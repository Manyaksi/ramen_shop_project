<%@ page contentType="text/html; charset=utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- 헤드부분 -->
<head>
<!-- 메타데이터 -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>라면먹고갈래? - 대한민국 1등 라면 온라인 쇼핑</title>

<!-- 부트스트랩 Core CSS -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">


<!-- 메인상단 큰배너에 관한 CSS -->
<link rel="stylesheet" type="text/css"
	href="/assets/js//amazingslider-1.css">


<!-- 커스터마이징 CSS -->
<link rel="stylesheet" href="/assets/css/main.css">
<link id="mainstyle" rel="stylesheet" href="/assets/css/orange.css">
<link rel="stylesheet" href="/assets/css/owl.carousel.css">
<link rel="stylesheet" href="/assets/css/owl.transitions.css">
<link rel="stylesheet" href="/assets/css/animate.min.css">

<!-- CSS커스터마이징 부분 -->
<link rel="stylesheet" href="/assets/css/config.css">


<!--  
        <link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
        <link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
        <link href="assets/css/navy.css" rel="alternate stylesheet" title="Navy color">
        <link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
        -->

<!-- 웹폰트 -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/earlyaccess/nanumpenscript.css'
	rel='stylesheet' type='text/css'>

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
		<jsp:include page="/menu/top.jsp" />
		<%-- 상단타이틀 서치메뉴 끝 --%>

		<%-- 상단메뉴 --%>
		<jsp:include page="/menu/navigation.jsp" />
		<%-- 상단메뉴 끝--%>

		<%-- 상단네비게이션 --%>
		<jsp:include page="/menu/breadcrumb.jsp" />
		<%-- 상단네비게이션 끝--%>


		<%-- 메인컨텐츠 --%>
		<div class="container">

			<!-- ========================================= 사이드바 ========================================= -->
			<div class="col-xs-12 col-sm-1 no-margin sidebar narrow">


				<!-- ========================================= 카테고리 트리 ========================================= -->
				<jsp:include page="/menu/category.jsp" />
				<!-- ========================================= 카테고리 트리 : END ========================================= -->

			</div>
			<!-- ========================================= 사이드바 : END ========================================= -->


			<!-- ========================================= 상품목록 영역 ========================================= -->

			<div class="col-xs-12 col-sm-11 no-margin wide sidebar">

				<!-- ========================================= 상품배너 ========================================= -->
				<!--   <jsp:include page="/product/banner.jsp"/> -->
				<!-- ========================================= 상품배너 : END===================================== -->

				<!-- ========================================= 상품리스트 ========================================= -->

				<jsp:include page="/product/product_list.jsp" />

				<!-- ========================================= 상품목록 영역 : END ========================================= -->
			</div>
		</div>
		<%-- 메인컨텐츠 끝--%>



		<%-- 푸터 시작 --%>
		<jsp:include page="/menu/footer.jsp" />
		<%-- 푸터 끝 --%>
	</div>


	<!-- 사용된 자바스크립트 모음... 뒤쪽에 두면 페이지 로딩이 좀더 빨라진다고하네요...  -->
	<div>
		<script src="/assets/js/jquery-2.1.3.js"></script>
		<script src="/assets/js/Product_jPaginate.js"></script>
		<script>
			$(document).ready(function() {
				$("#pagelist").jPaginate();
			});
		</script>
		<script src="/assets/js/jquery-migrate-1.2.1.js"></script>
		<script src="/assets/js/bootstrap.min.js"></script>
		<script
			src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
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
		<script src="/assets/js/amazingslider.js"></script>
		<script src="/assets/js/initslider-1.js"></script>
		<script src="http://w.sharethis.com/button/buttons.js"></script>

		<script>
		$(document).ready(function(){
    		var url = $(location).attr('search');
    		var red = '?division=red';
    		var red_pack = '?division=red_pack';
    		var red_cup = '?division=red_cup';
    		var spicy = '?division=spicy';
    		var spicy_pack = '?division=spicy_pack';
    		var spicy_cup = '?division=spicy_cup';
    		var mild = '?division=mild';
    		var mild_pack = '?division=mild_pack';
    		var mild_cup = '?division=mild_cup';
    		var white = '?division=white';
    		var white_pack = '?division=white_pack';
    		var white_cup = '?division=white_cup';
    		var black = '?division=black';
    		var black_cup = '?division=black_cup';
    		var black_pack = '?division=black_pack';
    		var summer = '?division=summer';
    		var summer_cup = '?division=summer_cup';
    		var summer_pack = '?division=summer_pack';
    		var rice = '?division=rice';
    		var cooking = '?division=cooking';
    		
    		switch(url){
    		case red:  $("link#mainstyle").attr("href", "/assets/css/red.css");
    		 		   $('h2.section-title').html("매운라면");
    		break;
    		
    		case red_pack:  $("link#mainstyle").attr("href", "/assets/css/red.css");
    					$('h2.section-title').html("매운라면");
    		break;
    		
    		case red_cup:  $("link#mainstyle").attr("href", "/assets/css/red.css");
    				$('h2.section-title').html("매운라면");
    		break;
    		
    		case spicy: $("link#mainstyle").attr("href", "/assets/css/orange.css");
    				$('h2.section-title').html("매콤얼큰");
    		break;
    		
    		case spicy_cup: $("link#mainstyle").attr("href", "/assets/css/orange.css");
    				$('h2.section-title').html("매콤얼큰");
    		break;
    		
    		case spicy_pack: $("link#mainstyle").attr("href", "/assets/css/orange.css");
    				$('h2.section-title').html("매콤얼큰");
    		break;
    		
    		case mild: $("link#mainstyle").attr("href", "/assets/css/yellow.css");
    				$('h2.section-title').html("순한라면");
        	break;
        	
    		case mild_pack: $("link#mainstyle").attr("href", "/assets/css/yellow.css");
    				$('h2.section-title').html("순한라면");
        	break;
        	
    		case mild_cup: $("link#mainstyle").attr("href", "/assets/css/yellow.css");
    				$('h2.section-title').html("순한라면");
        	break;
        	
    		case white:	$("link#mainstyle").attr("href", "/assets/css/white.css");
    				$('h2.section-title').html("하얀라면");
            break;
            
    		case white_cup:	$("link#mainstyle").attr("href", "/assets/css/white.css");
    						$('h2.section-title').html("하얀라면");
            break;
            
    		case white_pack: $("link#mainstyle").attr("href", "/assets/css/white.css");
    						$('h2.section-title').html("하얀라면");
            break;
    		
    		case black: $("link#mainstyle").attr("href", "/assets/css/black.css");
    					$('h2.section-title').html("짜장라면");
            break;
    		
    		case black_pack: $("link#mainstyle").attr("href", "/assets/css/black.css");
    						$('h2.section-title').html("짜장라면");
            break;
    
    		case black_cup: $("link#mainstyle").attr("href", "/assets/css/black.css");
    				$('h2.section-title').html("짜장라면");
            break;
    	
    		case summer:
    				$("link#mainstyle").attr("href", "/assets/css/blue.css");
   			 		$('h2.section-title').html("여름라면");
            break;
   
    		case summer_cup:
   		     		$("link#mainstyle").attr("href", "/assets/css/blue.css");
    	    		$('h2.section-title').html("여름라면");
                break;
  
    		case summer_pack:
	        		$("link#mainstyle").attr("href", "/assets/css/blue.css");
	   	     		$('h2.section-title').html("여름라면");
                break;

    		case rice:
    				$("link#mainstyle").attr("href", "/assets/css/green.css");
 			   		$('h2.section-title').html("밥과반찬들");
            break;
    
    		case cooking:
    				$("link#mainstyle").attr("href", "/assets/css/navy.css");
   			 		$('h2.section-title').html("조리용품");
            break;
			}
    	});
		</script>

	</div>
	<!-- 자바스크립트끝 -->
</body>
</html>

