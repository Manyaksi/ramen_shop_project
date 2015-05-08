<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="top-bar animate-dropdown">
    <div class="container">
        <div class="col-xs-12 col-sm-6 no-margin" style="margin-left:20px;">
            <ul>
                <li><a href="/index.jsp">Home</a></li>
            </ul>
        </div><!-- /.col -->

        <div class="col-xs-12 col-sm-5 no-margin" style="margin-left:76px;">
            <ul class="right">
               <c:if test="${cookie.loginId != null }" var="varname" scope="request">
						
				<li>	<a href="/mypage/mypage.jsp"><b>${cookie.loginId.value}</b>님 라면먹고가세요! </a></li>
			    <li>	<a href="/logout.mall">로그아웃</a> </li>
				<li>	<a href="/mypage/mypage.mall">마이페이지</a></li>
				<li><a href="/cart/showcart.mall?id=${cookie.loginId.value }">장바구니</a></li>
					
				</c:if>		
					
                <c:if test="${empty cookie.loginId }" var="varname" scope="request">
				
				<li> <a href="/authentication/authentication.jsp">로그인</a> </li>
				<li> <a href="/mypage/mypage.mall">마이페이지</a> </li>
				</c:if>
                
                
            </ul>
        </div><!-- /.col -->
    </div><!-- /.container -->
</nav>