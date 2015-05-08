<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="widget cart-summary">
                <h1 class="border">장바구니</h1>
                <div class="body">
                    <ul class="tabled-data no-border inverse-bold">
                        <li>
                            <label>주문금액</label>
               
                            <c:set var="sum" value="0"/> 
                            <c:forEach items="${carts }" var="carts" varStatus="state">
                            <c:set var="sum" value="${sum + carts.product_redprice*carts.shopping_count }"/>
                            </c:forEach>
                            <div class="value pull-right">${sum }원</div>
                        </li>
                        <li>
                            <label>배송비</label>
                            <div class="value pull-right">무료배송</div>
                        </li>
                    </ul>
                    <ul id="total-price" class="tabled-data inverse-bold no-border">
                        <li>
                            <label>결제예정금액</label>
                            <div class="value pull-right">${sum }원</div>
                        </li>
                    </ul>
                    <div class="buttons-holder">
                        <a class="le-button big" href="/checkout/requestorder.mall" >주문하기</a>
                        <a class="simple-link block" href="/product/productlist.mall" >계속쇼핑하기</a>
                    </div>
                </div>
            </div><!-- /.widget -->