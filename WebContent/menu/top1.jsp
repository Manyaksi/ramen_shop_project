<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ============================================================= HEADER ============================================================= -->
<header>
    <div class="container no-padding">
        
        <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
            <!-- ============================================================= LOGO ============================================================= -->
<div class="logo">
    <a href="/index.jsp">
        <!--<img alt="logo" src="/assets/images/logo.svg" width="233" height="54"/>-->
        <!--<object id="sp" type="image/svg+xml" data="/assets/images/logo.svg" width="233" height="54"></object>-->
        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
     width="240px" height="88px" viewBox="0 0 251.415 88" enable-background="new 0 0 251.415 88" xml:space="preserve">
<text transform="matrix(0.7764 0.0364 -0.0459 0.9989 6.873 72.9424)"  style="font-family: 'Nanum Pen Script', serif;" font-size="91.8729">라면</text>
<g>
    <text transform="matrix(0.8191 0 0 1 116.9141 65.2285)" style="font-family: 'Nanum Pen Script', serif;" font-size="58.2359">먹고갈래</text>
    <text transform="matrix(1.141 0 0 1 231.416 48.6094)" style="font-family: 'Nanum Pen Script', serif;" font-size="41.8076">?</text>
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

                    <a class="dropdown-toggle"  data-toggle="dropdown" href="/category-grid.html">all categories</a>

                    <ul class="dropdown-menu" role="menu" > 
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="/category-grid.html">laptops</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="/category-grid.html">tv & audio</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="/category-grid.html">gadgets</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="/category-grid.html">cameras</a></li>

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
    
    
    <c:if test="${cookie.loginId != null }" var="varname" scope="request">
    
    	${cookie.loginId.value } 님 로그인 중..
        <div class="compare">
            <a href="/authentication.html"><i class="fa fa-home"></i>마이페이지</a>
        </div>
    </c:if>
    
    <c:if test="${empty cookie.loginId }" var="varname" scope="request">
    <div class="wishlist ">
            <a href="/authentication.jsp"><i class="fa fa-sign-in"></i>로그인</a>
        </div>
        <div class="compare">
            <a href="/authentication.html"><i class="fa fa-home"></i>마이페이지</a>
        </div>
    
    </c:if>

   
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
                        <span class="sign">$</span><span class="value">3219,00</span>
                    </span>
                </div>
            </a>

            <ul class="dropdown-menu">
                <li>
                    <div class="basket-item">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 no-margin text-center">
                                <div class="thumb">
                                    <img alt="" src="/assets/images/products/product-small-01.jpg" />
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-8 no-margin">
                                <div class="title">Blueberry</div>
                                <div class="price">$270.00</div>
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
                                    <img alt="" src="/assets/images/products/product-small-01.jpg" />
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-8 no-margin">
                                <div class="title">Blueberry</div>
                                <div class="price">$270.00</div>
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
                                    <img alt="" src="/assets/images/products/product-small-01.jpg" />
                                </div>
                            </div>
                            <div class="col-xs-8 col-sm-8 no-margin">
                                <div class="title">Blueberry</div>
                                <div class="price">$270.00</div>
                            </div>
                        </div>
                        <a class="close-btn" href="#"></a>
                    </div>
                </li>


                <li class="checkout">
                    <div class="basket-item">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <a href="/cart.html" class="le-button inverse">View cart</a>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <a href="/checkout.html" class="le-button">Checkout</a>
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
</header>