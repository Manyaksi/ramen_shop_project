<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <section id="your-order" style="margin-bottom:200px;">
                <h2 class="border h1">주문내역</h2>
                <form>
                <c:forEach items="${carts }" var="carts" varStatus="state">
                    <div class="row no-margin order-item">
                        <div class="col-xs-12 col-sm-1 no-margin">
                        </div>

                        <div class="col-xs-12 col-sm-9 ">
                            <div class="title"><a href="#">${carts.product_name } </a></div>
                            <div class="brand">${carts.product_company }</div>
                        </div>

                        <div class="col-xs-12 col-sm-2 no-margin">
                            <div class="price">${carts.product_redprice*carts.shopping_count}원</div>
                        </div>
                    </div><!-- /.order-item -->

				</c:forEach>
                    
                </form>
            </section><!-- /#your-order -->