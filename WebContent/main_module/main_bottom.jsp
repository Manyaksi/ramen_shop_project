<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="products-tab" class="wow fadeInUp">
    <div class="container">
        <div class="tab-holder">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" >
          		  <li class="active"><a href="#top-sales" data-toggle="tab">베스트상품</a></li>
                  <li><a href="#new-arrivals" data-toggle="tab">신상품</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
             <div class="tab-pane active" id="top-sales">
                    <div class="product-grid-holder">

						<c:forEach items="${mainlist }" var="mainlist" varStatus="state">

                        <div class="col-sm-4 col-md-3 no-margin product-item-holder hover">
                            <div class="product-item">
                                <div class="image">
                                    <img width="300px;" src="/assets/images/product/${mainlist.product_photo}" data-echo="/assets/images/product/${mainlist.product_photo}" />
                                </div>
                                <div class="body">
                                    <div class="label-discount clear"></div>
                                    <div class="title">
                                        <a href="/product/view_product.mall?product_number=${mainlist.product_number}">${mainlist.product_name}
                                            </a>
                                    </div>
                                    <div class="brand">${mainlist.product_company }</div>
                                </div>
                                <div class="prices">
                                    <div class="price-prev"> ${mainlist.product_orgprice }원</div>
                                    <div class="price-current pull-right">${mainlist.product_redprice }원</div>
                                </div>
                                
                            </div>
                        </div>
                        
                        </c:forEach>

                        
                        

                    </div>
                    <div class="loadmore-holder text-center">
                        <a class="btn-loadmore" href="#">
                            <i class="fa fa-plus"></i>
                            load more products</a>
                    </div> 
                </div>
             
                <div class="tab-pane" id="new-arrivals">
                    <div class="product-grid-holder">
                        
                       <c:forEach items="${newlist }" var="newlist" varStatus="state">

                        <div class="col-sm-4 col-md-3 no-margin product-item-holder hover">
                            <div class="product-item">
                                <div class="image">
                                    <img width="300px" height="300px" alt="" src="/assets/images/product/${newlist.product_photo}" data-echo="/assets/images/product/${newlist.product_photo}" />
                                </div>
                                <div class="body">
                                    <div class="label-discount clear"></div>
                                    <div class="title">
                                        <a href="single-product.html">${newlist.product_name}
                                            </a>
                                    </div>
                                    <div class="brand">${newlist.product_company }</div>
                                </div>
                                <div class="prices">
                                    <div class="price-prev">${newlist.product_orgprice }원</div>
                                    <div class="price-current pull-right">${newlist.product_redprice }원</div>
                                </div>
                            </div>
                        </div>
                        
                        </c:forEach>

                    </div>
                    <div class="loadmore-holder text-center">
                        <a class="btn-loadmore" href="#">
                            <i class="fa fa-plus"></i>
                            load more products</a>
                    </div> 

                </div>

               
            </div>
        </div>
    </div>
</div>