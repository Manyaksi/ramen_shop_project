<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <h2 class="bordered">주문내역</h2>
 <p>주문하신 내역을 확인할 수 있습니다.</p>

          <div class="table-responsive" style="margin-top:50px;">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="col-xs-2 text-center">주문일자</th>
                  <th class="col-xs-1 text-center">주문번호</th>
                  <th class="col-xs-1 text-center">항목번호</th>
                  <th class="col-xs-1 text-center">수 량</th>
                  <th class="col-xs-4 text-center">상품이름</th>
                  <th class="col-xs-3 text-center">결제금액</th>
                </tr>
              </thead>
              <tbody>
	                
	                 <c:forEach items="${orderlist }" var="orderlist" varStatus="state">
	                <tr>
	                  <td class="text-center">${orderlist.orderitem_date }</td>
	                  <td class="text-center">${orderlist.order_number }</td>
	                  <td class="text-center">${orderlist.orderitem_number }</td>
	                  <td class="text-center">${orderlist.shopping_count }</td>
	                  <td class="text-center">${orderlist.product_name }</td>
	                  <td class="text-center">${orderlist.orderitem_price * orderlist.shopping_count }</td>
	                </tr>
	                </c:forEach>
	               
	               
	               
               
              </tbody>
            </table>
          </div>