<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ============================================================= HEADER ============================================================= -->
<header id="header">
    <div class="container no-padding">
        
        <div class="col-xs-12 col-sm-12 col-md-3  logo-holder" style="margin-left: 2%;">
            <!-- ============================================================= LOGO ============================================================= -->
<div class="logo">
    <a href="/index.jsp">
        <!--<img alt="logo" src="assets/images/logo.svg" width="233" height="54"/>-->
        <!--<object id="sp" type="image/svg+xml" data="assets/images/logo.svg" width="233" height="54"></object>-->
        <svg class="logo" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
     width="240px" height="88px" viewBox="0 0 251.415 88" enable-background="new 0 0 251.415 88" xml:space="preserve">
<text class="logo" transform="matrix(0.7764 0.0364 -0.0459 0.9989 6.873 72.9424)"  style="font-family: 'Nanum Pen Script', serif;" font-size="91.8729">라면</text>
<g>
    <text class="logo"  transform="matrix(0.8191 0 0 1 116.9141 65.2285)"  style="font-family: 'Nanum Pen Script', serif;" font-size="58.2359">먹고갈래</text>
    <text  class="logo" transform="matrix(1.141 0 0 1 231.416 48.6094)"  style="font-family: 'Nanum Pen Script', serif;" font-size="41.8076">?</text>
</g>
</svg>

    </a>
</div><!-- /.logo -->
</div>
<!-- ============================================================= LOGO : END ============================================================= -->    

        <div class="col-xs-12 col-sm-12 col-md-6 top-search-holder no-margin">
   
<div class="search-area">
    
    	  <form id="search" action="/search.mall" method="post">
        <div class="control-group">
            <input class="search-field" placeholder="당신이 원하는 모든라면을 검색해보세요!" name="searchValue"  />
		  <select name="searchType">
					<option value="all" selected="selected">전체검색</option>
					<option value="product_name">제품이름</option>
					<option value="product_company">제조사</option>
				</select>
           

			
			<button type="submit" class="search-button"></button> 
               

        </div>
    </form>
    
    
  
</div><!-- /.search-area -->
</div>
<!-- ============================================================= SEARCH AREA : END ============================================================= -->  

<div class="col-md-2">
<div style="float:right">
<img height="93px" src="/assets/images/top_right_banner/top_right.gif"></div>


    </div>
    </div>
</header>