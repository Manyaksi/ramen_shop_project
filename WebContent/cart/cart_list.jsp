<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/assets/js/jquery-2.1.3.min.js"></script>


<c:set var="allsum" value="0"/>
<c:forEach items="${carts }" var="carts" varStatus="state">
<div class="row no-margin cart-item">
	<div class="col-xs-12 col-sm-2 no-margin">
		<a href="#" class="thumb-holder"> 
			<img class="lazy" alt="" src="/assets/images/products/j-01.jpg" />
		</a>
	</div>

	<div class="col-xs-12 col-sm-5 ">
		<div class="title">
			<a href="#">${carts.product_name }</a>
		</div>
		<div class="brand">${carts.product_company }</div>
	</div>

	<div class="col-xs-12 col-sm-3 no-margin">
		<div class="quantity">
			<div class="le-quantity">
				<form  action="/product/updatecart.mall" method="get">
				<c:set var="allsum" value="${allsum+carts.product_redprice*carts.shopping_count}"/>

				<input type="hidden" name="product_number" value="${carts.product_number }">
				<input type="hidden" name="id" value="${cookie.loginId.value }">
				<div class="row">
				<div class="col-xs-12">
					<a class="minus" href="#reduce"></a> <input name="quantity"
						readonly="readonly" type="text" value="${carts.shopping_count }" /> <a class="plus"
						href="#add"></a>
						</div>
						<div class="col-xs-12"><button class="le-button" type="submit">수정</button></div>
				</div>		
						
				</form>
			</div>
		</div>
	</div>

	<div class="col-xs-12 col-sm-2 no-margin">
		<div class="price">${carts.product_redprice*carts.shopping_count}</div>
		<a class="close-btn" href="/product/deletecart.mall?product_number=${carts.product_number }&id=${cookie.loginId.value }"></a>
	</div>
</div>
<!-- /.cart-item -->
</c:forEach>

