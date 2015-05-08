<%@page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@page import="kr.or.kosta.member.dao.MemberDao"%>
<%@page import="kr.or.kosta.member.dao.MemberDao"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="MediaCenter, Template, eCommerce">
        <meta name="robots" content="all">

        <title>MediaCenter - Responsive eCommerce Template</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
        
        <!-- Customizable CSS -->
        <link rel="stylesheet" href="/assets/css/main.css">
        <link rel="stylesheet" href="/assets/css/green.css">
        <link rel="stylesheet" href="/assets/css/owl.carousel.css">
        <link rel="stylesheet" href="/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="/assets/css/animate.min.css">

        <!-- Demo Purpose Only. Should be removed in production -->
        <link rel="stylesheet" href="/assets/css/config.css">

        <link href="/assets/css/green.css" rel="alternate stylesheet" title="Green color">
        <link href="/assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
        <link href="/assets/css/red.css" rel="alternate stylesheet" title="Red color">
        <link href="/assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
        <link href="/assets/css/navy.css" rel="alternate stylesheet" title="Navy color">
        <link href="/assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
        <!-- Demo Purpose Only. Should be removed in production : END -->

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/earlyaccess/nanumpenscript.css' rel='stylesheet' type='text/css'>
        
        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="/assets/css/font-awesome.min.css">
        
        <!-- Favicon -->
        <link rel="shortcut icon" href="/assets/images/favicon.ico">

        <!-- HTML5 elements and media queries Support for IE8 : HTML5 shim and Respond.js -->
        <!--[if lt IE 9]>
            <script src="/assets/js/html5shiv.js"></script>
            <script src="/assets/js/respond.min.js"></script>
        <![endif]-->

 
    </head>
    
 <script type="text/javascript" src="/js/ajax.js"></script>
<script>
	
<%DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
		MemberDao dao = (MemberDao) factory
					.getDao("kr.or.kosta.member.dao.JdbcMemberDao");
			//(post) 방식의 로그인 처리

			request.setCharacterEncoding("utf-8");%>
	window.onload = function() {
		//document.getElementById("id").focus();

		
		
		eventRegist();

	}

	/**
	 * 이벤트소스에 이벤트핸들러 등록
	 */
	function eventRegist() {
		document.regist.onsubmit = function() {
			return send(document.regist);
		};
		
		
		
		
	}
	
	

	/**
	 *  서버에 폼 데이터 전성
	 */

	function send(form) {
		//유효성 체크
		if (!formValidate(form)) {
			return false;
			//event.preventDefault();
		}
		return true;
	}

	/**
	 *  폼에대한 유효성 검증
	 */

	/* function notNull(form) {
		var id = form.id.value;
		var passwd = form.passwd.value;
		var repasswd = form.repasswd.value;
		var name = form.name.value;
		var email = form.email.value;
		var mobile1 = form.mobile1.value;
		var mobile2 = form.mobile2.value;
		var mobile3 = form.mobile3.value;

		if (id == null || id.length == 0 || passwd == null
				|| passwd.length == 0 || repasswd == null
				|| repasswd.length == 0 || name == null || name.length == 0
				|| email == null || email.length == 0 || mobile1 == null
				|| mobile1.length == 0 || mobile2 == null
				|| mobile2.length == 0 || mobile3 == null
				|| mobile3.length == 0) {
			return true;
		}

	} */

	// 폼에 대한 유효성 검사

	/* function formValidate(form) {
		var emailReg = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[\w]+)+$/;
		var idReg = /^[A-Za-z0-9+]{6,8}$/;
		var id = form.id.value;
		var email = form.email.value;
		var passwd = form.passwd.value;
		var repasswd = form.repasswd.value;

		//아이디 유효성
		if (!(id.match(idReg))) {
			alert("id 형식맞춰라");
			clearField(document.registform.id);
			document.registform.id.focus();
			return false;
		}
		//이메일 유효성
		if (!(email.match(emailReg))) {
			alert("email 형식맞춰라");
			document.registform.email.focus();
			return false;
		}
		//노 빈칸
		if (notNull(form)) {
			alert("필수입력 사항을 모두 입력해 주세요.");
			//document.getElementById("id").focus();

			return false;
		}
		//비밀번호 확인
		if (passwd != repasswd) {
			alert("비밀번호가 다릅니다.");
			clearField(document.registform.passwd);
			clearField(document.registform.repasswd);
			document.registform.passwd.focus();
			return false;
		}

		return true;
	} */
	// 클리어 필드

	function clearField(input) {
		input.value = "";
	}

	function setValue(msg) {
		document.registform.id.value = msg;
	}

	/**
	 *   서버에서 데이터 수신 콜백함수
	 **/
	function onMessage(xhr) {
		setMessage(xhr.responseText);
	}

	/**
	 *   수신메시지 출력
	 **/

	function setMessage(message) {
		var messageBox = document.getElementById("checkBox");
		if (messageBox) {
			messageBox.innerHTML = message;
		}
	}
	
	function onMessagepw(xhr) {
		setMessagepw(xhr.responseText);
	}

	/**
	 *   수신메시지 출력
	 **/

	function setMessagepw(message) {
		var messageBox = document.getElementById("passwdcheckBox");
		if (messageBox) {
			messageBox.innerHTML = message;
		}
	}
	
	
</script>
 
<body>
    
    <div class="wrapper">
        <!-- ============================================================= TOP NAVIGATION ============================================================= -->




<!-- ============================================================= TOP NAVIGATION : END ============================================================= -->       <!-- ============================================================= HEADER ============================================================= -->
<header style="padding: 0px;">
    <div class="container no-padding" style="padding: 20px 0 0px 0;">
        
        <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
            <!-- ============================================================= LOGO ============================================================= -->
<div class="logo">
    <a href="index.html">
        <!--<img alt="logo" src="/assets/images/logo.svg" width="233" height="54"/>-->
        <!--<object id="sp" type="image/svg+xml" data="/assets/images/logo.svg" width="233" height="54"></object>-->
        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
     width="251.415px" height="88px" viewBox="0 0 251.415 88" enable-background="new 0 0 251.415 88" xml:space="preserve">
<text transform="matrix(0.7764 0.0364 -0.0459 0.9989 6.873 72.9424)" fill="#F15A24" style="font-family: 'Nanum Pen Script', serif;" font-size="91.8729">라면</text>
<g>
    <text transform="matrix(0.8191 0 0 1 116.9141 65.2285)" fill="#F15A24" style="font-family: 'Nanum Pen Script', serif;" font-size="58.2359">먹고갈래</text>
    <text transform="matrix(1.141 0 0 1 231.416 48.6094)" fill="#F15A24" style="font-family: 'Nanum Pen Script', serif;" font-size="41.8076">?</text>
</g>
</svg>

    </a>
</div><!-- /.logo -->
<!-- ============================================================= LOGO : END ============================================================= -->     </div><!-- /.logo-holder -->

        <div class="col-xs-12 col-sm-12 col-md-6 top-search-holder no-margin">
            <div class="contact-row">
    <div class="phone inline">

    </div>
    <div class="contact inline">
     
    </div>
</div><!-- /.contact-row -->
<!-- ============================================================= SEARCH AREA ============================================================= -->
<div class="search-area">
    <form>
        <div class="control-group">
            <input class="search-field" placeholder="Search for item" />

            <ul class="categories-filter animate-dropdown">
                <li class="dropdown">

                    <a class="dropdown-toggle"  data-toggle="dropdown" href="category-grid.html">all categories</a>

                    <ul class="dropdown-menu" role="menu" > 
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="category-grid.html">laptops</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="category-grid.html">tv & audio</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="category-grid.html">gadgets</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="category-grid.html">cameras</a></li>

                    </ul>
                </li>
            </ul>

            <a class="search-button" href="#" ></a>    

        </div>
    </form>
</div><!-- /.search-area -->
<!-- ============================================================= SEARCH AREA : END ============================================================= -->      </div><!-- /.top-search-holder -->

        <div class="col-xs-12 col-sm-12 col-md-3 top-cart-row no-margin">
            <div class="top-cart-row-container" style="margin-top: 11px;">
    <div class="wishlist-compare-holder">
        <div class="wishlist ">
            <a href="authentication.html"><i class="fa fa-heart                                                                                                                                              "></i> 회원가입 </a>
        </div>
        <div class="compare">
            <a href="authentication.html"><i class="fa fa-exchange"></i> 로그인  </a>
        </div>
    </div>

    <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->
    <div class="top-cart-holder dropdown animate-dropdown">
        
        <div class="basket">
            
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <div class="basket-item-count">
                    <span class="count">3</span>
                    <img src="/assets/images/icon-cart.png" alt="" />
                </div>

                <div class="total-price-basket"> 
                    <span class="lbl">장바구니</span>
                    <span class="total-price">
                        <span class="sign"></span><span class="value">3,480원</span>
                    </span>
                </div>
            </a>

            <ul class="dropdown-menu">
                <li>
                    <div class="basket-item">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 no-margin text-center">
                                <div class="thumb">
                                    <img alt="" src="/assets/images/products/j-01.jpg" />
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-8 no-margin">
                                <div class="title">올리브 짜파게티</div>
                                <div class="price">730원</div>
                            </div>
                        </div>
                        <a class="close-btn" href="#"></a>
                    </div>
                </li>

                <li>
                    <div class="basket-item">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 no-margin text-center">
                                <div class="thumb">
                                    <img alt="" src="/assets/images/products/b-01.png" />
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-8 no-margin">
                                <div class="title">불닭볶음면</div>
                                <div class="price">1,000원</div>
                            </div>
                        </div>
                        <a class="close-btn" href="#"></a>
                    </div>
                </li>

                <li>
                    <div class="basket-item">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 no-margin text-center">
                                <div class="thumb">
                                    <img alt="" src="/assets/images/products/ahn-01.png" />
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-8 no-margin">
                                <div class="title">안성탕면</div>
                                <div class="price">900원</div>
                            </div>
                        </div>
                        <a class="close-btn" href="#"></a>
                    </div>
                </li>

                <li>
                    <div class="basket-item">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 no-margin text-center">
                                <div class="thumb">
                                    <img alt="" src="/assets/images/products/s-01.png" />
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-8 no-margin">
                                <div class="title">신라면</div>
                                <div class="price">850원</div>
                            </div>
                        </div>
                        <a class="close-btn" href="#"></a>
                    </div>
                </li>


                <li class="checkout">
                    <div class="basket-item">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <a href="cart.html" class="le-button inverse">장바구니보기</a>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <a href="checkout.html" class="le-button">주문하</a>
                            </div>
                        </div>
                    </div>
                </li>

            </ul>
        </div><!-- /.basket -->
    </div><!-- /.top-cart-holder -->
</div><!-- /.top-cart-row-container -->
<!-- ============================================================= SHOPPING CART DROPDOWN : END ============================================================= -->       </div><!-- /.top-cart-row -->

    </div><!-- /.container -->
    
    
    <!-- ========================================= NAVIGATION ========================================= -->
<nav id="top-megamenu-nav" class="megamenu-vertical animate-dropdown">
    <div class="container">
        <div class="yamm navbar">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mc-horizontal-menu-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div><!-- /.navbar-header -->
            <div class="collapse navbar-collapse" id="mc-horizontal-menu-collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">매운라면</a>
                        <ul class="dropdown-menu">
                            <li><div class="yamm-content">
    <div class="row">
       <div class="col-xs-12 col-sm-4">
            <h2>Laptops &amp; Notebooks</h2>
            <ul>
                <li><a href="#">Power Supplies Power</a></li>
                <li><a href="#">Power Supply Testers Sound </a></li>
                <li><a href="#">Sound Cards (Internal)</a></li>
                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                <li><a href="#">Other</a></li>
            </ul>
        </div><!-- /.col -->

        <div class="col-xs-12 col-sm-4">
            <h2>Computers &amp; Laptops</h2>
            <ul>
                <li><a href="#">Computer Cases &amp; Accessories</a></li>
                <li><a href="#">CPUs, Processors</a></li>
                <li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
                <li><a href="#">Graphics, Video Cards</a></li>
                <li><a href="#">Interface, Add-On Cards</a></li>
                <li><a href="#">Laptop Replacement Parts</a></li>
                <li><a href="#">Memory (RAM)</a></li>
                <li><a href="#">Motherboards</a></li>
                <li><a href="#">Motherboard &amp; CPU Combos</a></li>
                <li><a href="#">Motherboard Components &amp; Accs</a></li>
            </ul>
        </div><!-- /.col -->

        <div class="col-xs-12 col-sm-4">
            <h2>Dekstop Parts</h2>
            <ul>
                <li><a href="#">Power Supplies Power</a></li>
                <li><a href="#">Power Supply Testers Sound</a></li>
                <li><a href="#">Sound Cards (Internal)</a></li>
                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                <li><a href="#">Other</a></li>
            </ul>
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.yamm-content --></li>
                        </ul>
                    </li>
                            
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">매콤얼큰</a>
                        <ul class="dropdown-menu">
                            <li><div class="yamm-content">
    <div class="row">
       <div class="col-xs-12 col-sm-4">
            <h2>Laptops &amp; Notebooks</h2>
            <ul>
                <li><a href="#">Power Supplies Power</a></li>
                <li><a href="#">Power Supply Testers Sound </a></li>
                <li><a href="#">Sound Cards (Internal)</a></li>
                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                <li><a href="#">Other</a></li>
            </ul>
        </div><!-- /.col -->

        <div class="col-xs-12 col-sm-4">
            <h2>Computers &amp; Laptops</h2>
            <ul>
                <li><a href="#">Computer Cases &amp; Accessories</a></li>
                <li><a href="#">CPUs, Processors</a></li>
                <li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
                <li><a href="#">Graphics, Video Cards</a></li>
                <li><a href="#">Interface, Add-On Cards</a></li>
                <li><a href="#">Laptop Replacement Parts</a></li>
                <li><a href="#">Memory (RAM)</a></li>
                <li><a href="#">Motherboards</a></li>
                <li><a href="#">Motherboard &amp; CPU Combos</a></li>
                <li><a href="#">Motherboard Components &amp; Accs</a></li>
            </ul>
        </div><!-- /.col -->

        <div class="col-xs-12 col-sm-4">
            <h2>Dekstop Parts</h2>
            <ul>
                <li><a href="#">Power Supplies Power</a></li>
                <li><a href="#">Power Supply Testers Sound</a></li>
                <li><a href="#">Sound Cards (Internal)</a></li>
                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                <li><a href="#">Other</a></li>
            </ul>
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.yamm-content --></li>
                        </ul>
                    </li>
                            
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">순한라면</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Computer Cases &amp; Accessories</a></li>
                            <li><a href="#">CPUs, Processors</a></li>
                            <li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
                            <li><a href="#">Graphics, Video Cards</a></li>
                            <li><a href="#">Interface, Add-On Cards</a></li>
                            <li><a href="#">Laptop Replacement Parts</a></li>
                            <li><a href="#">Memory (RAM)</a></li>
                            <li><a href="#">Motherboards</a></li>
                            <li><a href="#">Motherboard &amp; CPU Combos</a></li>
                        </ul>
                    </li>
                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">하얀라면</a>
                        <ul class="dropdown-menu">
                            <li><div class="yamm-content">
    <div class="row">
       <div class="col-xs-12 col-sm-4">
            <h2>Laptops &amp; 하얀라면</h2>
            <ul>
                <li><a href="#">Power Supplies Power</a></li>
                <li><a href="#">Power Supply Testers Sound </a></li>
                <li><a href="#">Sound Cards (Internal)</a></li>
                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                <li><a href="#">Other</a></li>
            </ul>
        </div><!-- /.col -->

        <div class="col-xs-12 col-sm-4">
            <h2>Computers &amp; Laptops</h2>
            <ul>
                <li><a href="#">Computer Cases &amp; Accessories</a></li>
                <li><a href="#">CPUs, Processors</a></li>
                <li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
                <li><a href="#">Graphics, Video Cards</a></li>
                <li><a href="#">Interface, Add-On Cards</a></li>
                <li><a href="#">Laptop Replacement Parts</a></li>
                <li><a href="#">Memory (RAM)</a></li>
                <li><a href="#">Motherboards</a></li>
                <li><a href="#">Motherboard &amp; CPU Combos</a></li>
                <li><a href="#">Motherboard Components &amp; Accs</a></li>
            </ul>
        </div><!-- /.col -->

        <div class="col-xs-12 col-sm-4">
            <h2>Dekstop Parts</h2>
            <ul>
                <li><a href="#">Power Supplies Power</a></li>
                <li><a href="#">Power Supply Testers Sound</a></li>
                <li><a href="#">Sound Cards (Internal)</a></li>
                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                <li><a href="#">Other</a></li>
            </ul>
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.yamm-content --></li>
                        </ul>
                    </li>
                    
                    
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">짜장라면</a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                       <div class="col-xs-12 col-sm-3">
                                            <h2>Laptops &amp; Notebooks</h2>
                                            <ul>
                                                <li><a href="#">Power Supplies Power</a></li>
                                                <li><a href="#">Power Supply Testers Sound </a></li>
                                                <li><a href="#">Sound Cards (Internal)</a></li>
                                                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                                                <li><a href="#">Other</a></li>
                                            </ul>
                                        </div><!-- /.col -->

                                        <div class="col-xs-12 col-sm-3">
                                            <h2>Computers &amp; Laptops</h2>
                                            <ul>
                                                <li><a href="#">Computer Cases &amp; Accessories</a></li>
                                                <li><a href="#">CPUs, Processors</a></li>
                                                <li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
                                                <li><a href="#">Graphics, Video Cards</a></li>
                                                <li><a href="#">Interface, Add-On Cards</a></li>
                                                <li><a href="#">Laptop Replacement Parts</a></li>
                                                <li><a href="#">Memory (RAM)</a></li>
                                                <li><a href="#">Motherboards</a></li>
                                                <li><a href="#">Motherboard &amp; CPU Combos</a></li>
                                                <li><a href="#">Motherboard Components &amp; Accs</a></li>
                                            </ul>
                                        </div><!-- /.col -->

                                        <div class="col-xs-12 col-sm-3">
                                            <h2>Desktop Parts</h2>
                                            <ul>
                                                <li><a href="#">Power Supplies Power</a></li>
                                                <li><a href="#">Power Supply Testers Sound</a></li>
                                                <li><a href="#">Sound Cards (Internal)</a></li>
                                                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                                                <li><a href="#">Other</a></li>
                                            </ul>
                                        </div><!-- /.col -->

                                        <div class="col-xs-12 col-sm-3">
                                            <h2>Laptops &amp; Notebooks</h2>
                                            <ul>
                                                <li><a href="#">Power Supplies Power</a></li>
                                                <li><a href="#">Power Supply Testers Sound </a></li>
                                                <li><a href="#">Sound Cards (Internal)</a></li>
                                                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                                                <li><a href="#">Other</a></li>
                                            </ul>
                                        </div><!-- /.col -->
                                    </div><!-- /.row -->
                                </div><!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li><!-- /.yamm-fw -->
                    
                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">여름라면</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Motherboard Components &amp; Accs</a></li>
                            <li><a href="#">Power Supplies Power</a></li>
                            <li><a href="#">Power Supply TestersSound </a></li>
                            <li><a href="#">Sound Cards (Internal)</a></li>
                            <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                            <li><a href="#">Other</a></li>
                        </ul>
                    </li>
                    
                    
                    <li class="dropdown hidden-md">
                        <a href="#" class="dropdown-toggle" data-hover="dropdown">특가상품</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Laptops &amp; Notebooks</a></li>
                            <li><a href="#">RTV</a></li>
                            <li><a href="#">TV &amp; Audio</a></li>
                            <li><a href="#">Gadgets</a></li>
                            <li><a href="#">Cameras</a></li>
                        </ul>
                    </li>

                    <li class="dropdown hidden-md">
                        <a href="#" class="dropdown-toggle" data-hover="dropdown">밥과 반찬들</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Laptops &amp; Notebooks</a></li>
                            <li><a href="#">RTV</a></li>
                            <li><a href="#">TV &amp; Audio</a></li>
                            <li><a href="#">Gadgets</a></li>
                            <li><a href="#">Cameras</a></li>
                        </ul>
                    </li>
                    
                    <li class="dropdown navbar-right hidden-md">
                        <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">조리용품</a>
                        <ul class="dropdown-menu">
                            <li><div class="yamm-content">
    <div class="row">
       <div class="col-xs-12 col-sm-4">
            <h2>Laptops &amp; Notebooks</h2>
            <ul>
                <li><a href="#">Power Supplies Power</a></li>
                <li><a href="#">Power Supply Testers Sound </a></li>
                <li><a href="#">Sound Cards (Internal)</a></li>
                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                <li><a href="#">Other</a></li>
            </ul>
        </div><!-- /.col -->

        <div class="col-xs-12 col-sm-4">
            <h2>Computers &amp; Laptops</h2>
            <ul>
                <li><a href="#">Computer Cases &amp; Accessories</a></li>
                <li><a href="#">CPUs, Processors</a></li>
                <li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
                <li><a href="#">Graphics, Video Cards</a></li>
                <li><a href="#">Interface, Add-On Cards</a></li>
                <li><a href="#">Laptop Replacement Parts</a></li>
                <li><a href="#">Memory (RAM)</a></li>
                <li><a href="#">Motherboards</a></li>
                <li><a href="#">Motherboard &amp; CPU Combos</a></li>
                <li><a href="#">Motherboard Components &amp; Accs</a></li>
            </ul>
        </div><!-- /.col -->

        <div class="col-xs-12 col-sm-4">
            <h2>Dekstop Parts</h2>
            <ul>
                <li><a href="#">Power Supplies Power</a></li>
                <li><a href="#">Power Supply Testers Sound</a></li>
                <li><a href="#">Sound Cards (Internal)</a></li>
                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                <li><a href="#">Other</a></li>
            </ul>
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.yamm-content --></li>
                        </ul>
                    </li>
                </ul><!-- /.navbar-nav -->
            </div><!-- /.navbar-collapse -->
        </div><!-- /.navbar -->
    </div><!-- /.container -->
</nav>
</nav><!-- /.megamenu-vertical -->
<!-- ========================================= NAVIGATION : END ========================================= -->
    <div class="animate-dropdown"><!-- ========================================= BREADCRUMB ========================================= -->
<div id="breadcrumb-alt">
    <div class="container">
        <div class="breadcrumb-nav-holder minimal">
            <ul>
                <li class="dropdown breadcrumb-item">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        홈
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Computer Cases &amp; Accessories</a></li>
                        <li><a href="#">CPUs, Processors</a></li>
                        <li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
                        <li><a href="#">Graphics, Video Cards</a></li>
                        <li><a href="#">Interface, Add-On Cards</a></li>
                        <li><a href="#">Laptop Replacement Parts</a></li>
                        <li><a href="#">Memory (RAM)</a></li>
                        <li><a href="#">Motherboards</a></li>
                        <li><a href="#">Motherboard &amp; CPU Combos</a></li>
                        <li><a href="#">Motherboard Components</a></li>
                    </ul>
                </li><!-- /.breadcrumb-item -->
                


                <li class="breadcrumb-item current">
                    <a href="#">로그인</a>
                </li><!-- /.breadcrumb-item -->
            </ul><!-- /.breadcrumb-nav-holder -->
        </div>
    </div><!-- /.container -->
</div><!-- /#breadcrumb-alt -->
<!-- ========================================= BREADCRUMB : END ========================================= --></div>
</header>
<!-- ============================================================= HEADER : END ============================================================= -->		<!-- ========================================= MAIN ========================================= -->
<main id="authentication" class="inner-bottom-md">
	<div class="container">
		<div class="row">
			
			<div class="col-md-5">
				<section class="section sign-in inner-right-xs">
					<h2 class="bordered">로그인</h2>
					<p>라면.. 먹고갈래요? 당신을 위한 라면이 준비되어 있어요:)</p>

                    <!--
					<div class="social-auth-buttons">
						<div class="row">
							
                            <div class="col-md-6">
								<button class="btn-block btn-lg btn btn-facebook"><i class="fa fa-facebook"></i> 페이스북 로그인</button>
							</div>
							<div class="col-md-6">
								<button class="btn-block btn-lg btn btn-twitter"><i class="fa fa-twitter"></i>
                                트위터 로그인</button>
							</div>
                       
						</div>
					</div>
                     -->

					<form role="form" class="login-form cf-style-1 form-group-lg">
						<div class="field-row ">
                            <label>아이디</label>
                            <input type="text" class="le-input ">
                        </div><!-- /.field-row -->

                        <div class="field-row">
                            <label>비밀번호</label>
                            <input type="text" class="le-input">
                        </div><!-- /.field-row --> 	

                        <div class="field-row clearfix">
                            <!--
                        	<span class="pull-left">
                        		<label class="content-color"><input type="checkbox" class="le-checbox auto-width inline"> <span class="bold">Remember me</span></label>
                        	</span>
                        -->
                        	<span class="pull-left">
                        		<a href="#" class="content-color ">회원정보를 잊으셨나요?</a>
                        	</span>
                        </div>

                        <div class="buttons-holder">
                            <button type="submit" class="le-button huge">로그인하기</button>
                        </div><!-- /.buttons-holder -->
					</form><!-- /.cf-style-1 -->

                    <div style="margin-top: 70px;">
                        <h2 class="semi-bold">'라면먹고갈래?' 가입하시면</h2>

                    <ul class="list-unstyled list-benefits">
                        <li><i class="fa fa-check primary-color"></i> 다양한 라면 정보를 얻을 수 있습니다</li>
                        <li><i class="fa fa-check primary-color"></i> 주문과 관련된 서비스를 이용할 수 있습니다</li>
                        <li><i class="fa fa-check primary-color"></i> 신제품에 대한 정보를 주기적으로 얻을 수 있습니다</li>
                    </ul>

                    </div>

				</section><!-- /.sign-in -->
			</div><!-- /.col -->

			<div class="col-md-7">
				<section class="section register inner-left-xs">
					<h2 class="bordered">회원가입하기</h2>
					<p>'라면먹고갈래?' 회원으로 가입하시고 즐거운 라면 쇼핑하세요!</p>

					<form role="form" class="register-form cf-style-1" name="regist"
					action="/member/registAction.mall" method="post">
						<div class="field-row">
                            <label>이름</label>
                            <input type="text" class="le-input" name="name">
                        </div><!-- /.field-row -->

                                                <div class="field-row">
                            <label>아이디</label>
                            <input type="text" class="le-input" name="id">
                        </div><!-- /.field-row -->

                                                <div class="field-row">
                            <label>비밀번호</label>
                            <input type="password" class="le-input" name="passwd">
                        </div><!-- /.field-row -->

                                                <div class="field-row">
                            <label>비밀번호확인</label>
                            <input type="password" class="le-input" name="repasswd">
                        </div><!-- /.field-row -->

                        <div class="field-row">
                            <label>생년월일</label>
                            <input type="text" class="le-input" name="birth">
                        </div><!-- /.field-row -->

                          <!-- <div class="field-row">
                            <label>주소, 우편번호</label>
                            <input type="text" class="le-input" name="address">
                        </div>/.field-row -->
                        
                        <input type="text" id="sample6_postcode1" name="postcode1"> -
<input type="text" id="sample6_postcode2" name="postcode2">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소" name="address">
<input type="text" id="sample6_address2" placeholder="상세주소" name="detail">

                          <div class="field-row">
                            <label>이메일</label>
                            <input type="text" class="le-input" name="email">
                        </div><!-- /.field-row -->

                         <div class="field-row">
                            <label>휴대폰번호</label>
                            <input type="text" class="le-input" name="phonenumber">
                        </div><!-- /.field-row -->


						

                        <div class="buttons-holder">
                            <button type="submit" class="le-button huge">회원가입</button>
                        </div><!-- /.buttons-holder -->
					</form>


				</section><!-- /.register -->

			</div><!-- /.col -->

		</div><!-- /.row -->
	</div><!-- /.container -->
</main><!-- /.authentication -->
<!-- ========================================= MAIN : END ========================================= -->		    <!-- ============================================================= FOOTER ============================================================= -->
<footer id="footer" class="color-bg">
    

    <div class="copyright-bar">
        <div class="container">
            <div class="col-xs-12 col-sm-6 no-margin">
                <div class="copyright">
                    &copy; <a href="index.html" >라면먹고갈래?</a> - all rights reserved
                </div><!-- /.copyright -->
            </div>
            <div class="col-xs-12 col-sm-6 no-margin">
                <div class="payment-methods ">
                    <ul>
                        <li><img alt="" src="/assets/images/payments/payment-visa.png"></li>
                        <li><img alt="" src="/assets/images/payments/payment-master.png"></li>
                        <li><img alt="" src="/assets/images/payments/payment-paypal.png"></li>
                        <li><img alt="" src="/assets/images/payments/payment-skrill.png"></li>
                    </ul>
                </div><!-- /.payment-methods -->
            </div>
        </div><!-- /.container -->
    </div><!-- /.copyright-bar -->

</footer><!-- /#footer -->
<!-- ============================================================= FOOTER : END ============================================================= -->   </div><!-- /.wrapper -->

    <!-- For demo purposes – can be removed on production -->
    
    <div class="config open">
        <div class="config-options">
            <h4>Pages</h4>
            <ul class="list-unstyled animate-dropdown">
                <li class="dropdown">
                    <button class="dropdown-toggle btn le-button btn-block" data-toggle="dropdown">View Pages</button>
                    <ul class="dropdown-menu">
                                                <li><a href="index.html">Home</a></li>
                                                <li><a href="index-2.html">Home Alt</a></li>
                                                <li><a href="category-grid.html">Category - Grid/List</a></li>
                                                <li><a href="category-grid-2.html">Category 2 - Grid/List</a></li>
                                                <li><a href="single-product.html">Single Product</a></li>
                                                <li><a href="single-product-sidebar.html">Single Product with Sidebar</a></li>
                                                <li><a href="cart.html">Shopping Cart</a></li>
                                                <li><a href="checkout.html">Checkout</a></li>
                                                <li><a href="about.html">About Us</a></li>
                                                <li><a href="contact.html">Contact Us</a></li>
                                                <li><a href="blog.html">Blog</a></li>
                                                <li><a href="blog-fullwidth.html">Blog Full Width</a></li>
                                                <li><a href="blog-post.html">Blog Post</a></li>
                                                <li><a href="faq.html">FAQ</a></li>
                                                <li><a href="terms.html">Terms & Conditions</a></li>
                                                <li><a href="authentication.html">Login/Register</a></li>
                                            </ul>   
                </li>
            </ul>
            <h4>Header Styles</h4>
            <ul class="list-unstyled">
                <li><a href="index.html1">Header 1</a></li>
                <li><a href="index.html">Header 2</a></li>
            </ul>
            <h4>Colors</h4>
            <ul class="list-unstyled">
                <li><a class="changecolor green-text" href="#" title="Green color">Green</a></li>
                <li><a class="changecolor blue-text" href="#" title="Blue color">Blue</a></li>
                <li><a class="changecolor red-text" href="#" title="Red color">Red</a></li>
                <li><a class="changecolor orange-text" href="#" title="Orange color">Orange</a></li>
                <li><a class="changecolor navy-text" href="#" title="Navy color">Navy</a></li>
                <li><a class="changecolor dark-green-text" href="#" title="Darkgreen color">Dark Green</a></li>
            </ul>
        </div>
        <a class="show-theme-options" href="#"><i class="fa fa-wrench"></i></a>
    </div>
    <!-- For demo purposes – can be removed on production : End -->

    <!-- JavaScripts placed at the end of the document so the pages load faster -->
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

    <!-- For demo purposes – can be removed on production -->
    
    <script src="switchstylesheet/switchstylesheet.js"></script>
    
    <script>
        $(document).ready(function(){ 
            $(".changecolor").switchstylesheet( { seperator:"color"} );
            $('.show-theme-options').click(function(){
                $(this).parent().toggleClass('open');
                return false;
            });
        });

        $(window).bind("load", function() {
           $('.show-theme-options').delay(2000).trigger('click');
        });
    </script>
    <!-- For demo purposes – can be removed on production : End -->

    <script src="http://w.sharethis.com/button/buttons.js"></script>
    
    

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_postcode1").value = data.postcode1;
                document.getElementById("sample6_postcode2").value = data.postcode2;
                document.getElementById("sample6_address").value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_address2").focus();
            }
        }).open();
    }
</script>

</body>
</html>