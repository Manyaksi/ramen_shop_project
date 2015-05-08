<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

   <section id="gaming">
    <div class="grid-list-products">
        <div style="margin-left:10px;"><h2 class="section-title">라면종류</h2></div>
        
        <div class="control-bar">
            <div id="popularity-sort" class="le-select" >
                <select data-placeholder="정렬">
                    <option value="1">인기순</option>
                    <option value="2">판매순</option>
                    <option value="3">출시순</option>
                </select>
            </div>
            
        
           <!--  <div class="grid-list-buttons">
                <ul>
                    <li class="grid-list-button-item active"><a data-toggle="tab" href="#grid-view"><i class="fa fa-th-large"></i> 격자로 보기</a></li>
                    <li class="grid-list-button-item "><a data-toggle="tab" href="#list-view"><i class="fa fa-th-list"></i> 목록으로 보기</a></li>
                </ul>
            </div>
        </div><!-- /.control-bar -->
                                
        <div class="tab-content">
            <div id="grid-view" class="products-grid fade tab-pane in active">
                
                <div class="product-grid-holder">
                        
                        <div id="pagelist">
                        <c:forEach items="${typelist }" var="typelist" varStatus="state">
                        <div class="col-xs-12 col-sm-4 no-margin product-item-holder hover">
                            <div class="product-item">
                                <div class="image">
                                    <img width="300px" height="300px" src="/assets/images/product/${typelist.product_photo}">
                                </div>
                                <div class="body">
                                    <div class="title">
                                        <a href="/product/view_product.mall?product_number=${typelist.product_number}">${typelist.product_name}</a>
                                    </div>
                                    <div class="brand">${typelist.product_company}</div>
                                </div>
                                <div class="prices">
                                    <div class="price-prev">${typelist.product_orgprice}원</div>
                                    <div class="price-current pull-right">${typelist.product_redprice}원</div>
                                </div>
                            </div><!-- /.product-item -->
                        </div><!-- /.product-item-holder -->
                        </c:forEach>
                        </div>

                      
                </div><!-- /.product-grid-holder -->
                
            </div><!-- /.products-grid #grid-view -->

    </div><!-- /.grid-list-products -->

</section><!-- /#gaming -->  

