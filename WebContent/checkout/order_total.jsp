<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="subtotal-holder">
	<ul class="tabled-data inverse-bold no-border">
	
	<h2 class="border h1" style="margin-bottom: 20px;">최종결제</h2>
		
		<li>
			<label>상품 총합</label>
			  <c:set var="sum" value="0"/> 
	    <c:forEach items="${carts }" var="carts" varStatus="state">
	    <c:set var="sum" value="${sum + carts.product_redprice*carts.shopping_count }"/>
    </c:forEach>
			<div class="value" style="float:right;">${sum }원</div>
		</li>
		
		<li>
			<label>배송방법</label>
			<div style="float:right;"  class="value">
				<div  class="radio-group">

					<input style="margin-top:10px; float:right;" class="le-radio" type="radio" name="group1" value="delivery" id="delimethod"><i
						class="fake-box">
					</i>
				<div class="radio-label bold">택배배송</div>
				
					<input class="le-radio" type="radio" name="group1"
						value="personal" checked="" id="delimethod"><i class="fake-box"></i>

				<div class="radio-label">직접찾아가기</div>
				
				</div>
			</div>
		</li>
	</ul>
	<!-- /.tabled-data -->

	<ul id="total-field" class="tabled-data inverse-bold ">
		<li><label>결제금액</label>
			<div style="float:right; font-size: 30px;"  class="value">${sum }원</div></li>
			<input type="hidden" name="sumprice" id="extendedprice" value="${sum }"/>
			
	</ul>
	<!-- /.tabled-data -->

</div>