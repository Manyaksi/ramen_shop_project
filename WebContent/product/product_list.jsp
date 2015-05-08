<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   <section id="gaming">
    <div class="grid-list-products">
        <div style="margin-left:10px;"><h2 class="section-title">매운라면</h2></div>
        
        <div class="control-bar">
            <div id="popularity-sort" class="le-select" >
                <select data-placeholder="정렬">
                    <option value="1">인기순</option>
                    <option value="2">판매순</option>
                    <option value="3">출시순</option>
                </select>
            </div>
            
        
            <div class="grid-list-buttons">
                <ul>
                    <li class="grid-list-button-item active"><a data-toggle="tab" href="#grid-view"><i class="fa fa-th-large"></i> 격자로 보기</a></li>
                    <li class="grid-list-button-item "><a data-toggle="tab" href="#list-view"><i class="fa fa-th-list"></i> 목록으로 보기</a></li>
                </ul>
            </div>
        </div><!-- /.control-bar -->
                                
        <div class="tab-content">
            <div id="grid-view" class="products-grid fade tab-pane in active">
                
                <div class="product-grid-holder">
                    <div class="row no-margin">
                        
                        
                        <c:forEach items="${typelist }" var="typelist" varStatus="state">
                        <div class="col-xs-12 col-sm-4 no-margin product-item-holder hover">
                            <div class="product-item">
                                <div class="ribbon red"><span>sale</span></div> 
                                <div class="image">
                                    <img width="300" height="300" src="/assets/images/blank.gif" data-echo="/assets/images/product/${typelist.product_photo} "/>
                                </div>
                                <div class="body">
                                    <div class="label-discount green"><fmt:formatNumber value="${(typelist.product_orgprice-typelist.product_redprice)/typelist.product_orgprice }" type="percent" />   % sale</div>
                                    <div class="title">
                                        <a href="/product/view_product.mall?product_number=${typelist.product_number}">${typelist.product_name}</a>
                                    </div>
                                    <div class="brand">${typelist.product_company}</div>
                                </div>
                                <div class="prices">
                                    <div class="price-prev">${typelist.product_orgprice}</div>
                                    <div class="price-current pull-right">${typelist.product_redprice}</div>
                                </div>
                               
                            </div><!-- /.product-item -->
                        </div><!-- /.product-item-holder -->
                        
                        </c:forEach>

                      
                    </div><!-- /.row -->
                </div><!-- /.product-grid-holder -->
                
                <div class="pagination-holder">
                    <div class="row">
                        
                        <div class="col-xs-12 col-sm-6 text-left">
                            <ul class="pagination ">
                                <li class="current"><a  href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">next</a></li>
                            </ul>
                        </div>

                        <div class="col-xs-12 col-sm-6">
                            <div class="result-counter">
                                Showing <span>1-9</span> of <span>11</span> results
                            </div>
                        </div>

                    </div><!-- /.row -->
                </div><!-- /.pagination-holder -->
            </div><!-- /.products-grid #grid-view -->

            <div id="list-view" class="products-grid fade tab-pane ">
                <div class="products-list">
                    
                    <div class="product-item product-item-holder">
                        <div class="ribbon red"><span>sale</span></div> 
                        <div class="ribbon blue"><span>new!</span></div>
                        <div class="row">
                            <div class="no-margin col-xs-12 col-sm-4 image-holder">
                                <div class="image">
                                    <img alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/product-01.jpg" />
                                </div>
                            </div><!-- /.image-holder -->
                            <div class="no-margin col-xs-12 col-sm-5 body-holder">
                                <div class="body">
                                    <div class="label-discount green">-50% sale</div>
                                    <div class="title">
                                        <a href="single-product.html">VAIO Fit Laptop - Windows 8 SVF14322CXW</a>
                                    </div>
                                    <div class="brand">sony</div>
                                    <div class="excerpt">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis euismod erat sit amet porta. Etiam venenatis ac diam ac tristique. Morbi accumsan consectetur odio ut tincidunt.</p>
                                    </div>
                                    <div class="addto-compare">
                                        <a class="btn-add-to-compare" href="#">add to compare list</a>
                                    </div>
                                </div>
                            </div><!-- /.body-holder -->
                            <div class="no-margin col-xs-12 col-sm-3 price-area">
                                <div class="right-clmn">
                                    <div class="price-current">$1199.00</div>
                                    <div class="price-prev">$1399.00</div>
                                    <div class="availability"><label>availability:</label><span class="available">  in stock</span></div>
                                    <a class="le-button" href="#">add to cart</a>
                                    <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                                </div>
                            </div><!-- /.price-area -->
                        </div><!-- /.row -->
                    </div><!-- /.product-item -->


                    <div class="product-item product-item-holder">
                        <div class="ribbon green"><span>bestseller</span></div>
                        <div class="row">
                            <div class="no-margin col-xs-12 col-sm-4 image-holder">
                                <div class="image">
                                    <img alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/product-02.jpg" />
                                </div>
                            </div><!-- /.image-holder -->
                            <div class="no-margin col-xs-12 col-sm-5 body-holder">
                                <div class="body">
                                    <div class="label-discount clear"></div>
                                    <div class="title">
                                        <a href="single-product.html">VAIO Fit Laptop - Windows 8 SVF14322CXW</a>
                                    </div>
                                    <div class="brand">sony</div>
                                    <div class="excerpt">
                                        <div class="star-holder">
                                            <div class="star" data-score="4"></div>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis euismod erat sit amet porta. Etiam venenatis ac diam ac tristique. Morbi accumsan consectetur odio ut tincidunt.</p>
                                    </div>
                                    <div class="addto-compare">
                                        <a class="btn-add-to-compare" href="#">add to compare list</a>
                                    </div>
                                </div>
                            </div><!-- /.body-holder -->
                            <div class="no-margin col-xs-12 col-sm-3 price-area">
                                <div class="right-clmn">
                                    <div class="price-current">$1199.00</div>
                                    <div class="price-prev">$1399.00</div>
                                    <div class="availability"><label>availability:</label><span class="not-available">out of stock</span></div>
                                    <a class="le-button disabled" href="#">add to cart</a>
                                    <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                                </div>
                            </div><!-- /.price-area -->
                        </div><!-- /.row -->
                    </div><!-- /.product-item -->


                    <div class="product-item product-item-holder">
                        <div class="ribbon red"><span>sell</span></div> 
                        <div class="row">
                            <div class="no-margin col-xs-12 col-sm-4 image-holder">
                                <div class="image">
                                    <img alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/product-03.jpg" />
                                </div>
                            </div><!-- /.image-holder -->
                            <div class="no-margin col-xs-12 col-sm-5 body-holder">
                                <div class="body">
                                    <div class="label-discount clear"></div>
                                    <div class="title">
                                        <a href="single-product.html">VAIO Fit Laptop - Windows 8 SVF14322CXW</a>
                                    </div>
                                    <div class="brand">sony</div>
                                    <div class="excerpt">
                                        <div class="star-holder">
                                            <div class="star" data-score="2"></div>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis euismod erat sit amet porta. Etiam venenatis ac diam ac tristique. Morbi accumsan consectetur odio ut tincidunt. </p>
                                    </div>
                                    <div class="addto-compare">
                                        <a class="btn-add-to-compare" href="#">add to compare list</a>
                                    </div>
                                </div>
                            </div><!-- /.body-holder -->
                            <div class="no-margin col-xs-12 col-sm-3 price-area">
                                <div class="right-clmn">
                                    <div class="price-current">$1199.00</div>
                                    <div class="price-prev">$1399.00</div>
                                    <div class="availability"><label>availability:</label><span class="available">in stock</span></div>
                                    <a class="le-button" href="#">add to cart</a>
                                    <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                                </div>
                            </div><!-- /.price-area -->
                        </div><!-- /.row -->
                    </div><!-- /.product-item -->

                    <div class="product-item product-item-holder">
                        <div class="row">
                            <div class="no-margin col-xs-12 col-sm-4 image-holder">
                                <div class="image">
                                    <img alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/product-04.jpg" />
                                </div>
                            </div><!-- /.image-holder -->
                            <div class="no-margin col-xs-12 col-sm-5 body-holder">
                                <div class="body">
                                    <div class="label-discount green">-50% sale</div>
                                    <div class="title">
                                        <a href="single-product.html">VAIO Fit Laptop - Windows 8 SVF14322CXW</a>
                                    </div>
                                    <div class="brand">sony</div>
                                    <div class="excerpt">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis euismod erat sit amet porta. Etiam venenatis ac diam ac tristique. Morbi accumsan consectetur odio ut tincidunt. </p>
                                    </div>
                                    <div class="addto-compare">
                                        <a class="btn-add-to-compare" href="#">add to compare list</a>
                                    </div>
                                </div>
                            </div><!-- /.body-holder -->
                            <div class="no-margin col-xs-12 col-sm-3 price-area">
                                <div class="right-clmn">
                                    <div class="price-current">$1199.00</div>
                                    <div class="price-prev">$1399.00</div>
                                    <div class="availability"><label>availability:</label><span class="available">  in stock</span></div>
                                    <a class="le-button" href="#">add to cart</a>
                                    <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                                </div>
                            </div><!-- /.price-area -->
                        </div><!-- /.row -->
                    </div><!-- /.product-item -->

                    <div class="product-item product-item-holder">
                        <div class="ribbon green"><span>bestseller</span></div> 
                        <div class="row">
                            <div class="no-margin col-xs-12 col-sm-4 image-holder">
                                <div class="image">
                                    <img alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/product-05.jpg" />
                                </div>
                            </div><!-- /.image-holder -->
                            <div class="no-margin col-xs-12 col-sm-5 body-holder">
                                <div class="body">
                                    <div class="label-discount clear"></div>
                                    <div class="title">
                                        <a href="single-product.html">VAIO Fit Laptop - Windows 8 SVF14322CXW</a>
                                    </div>
                                    <div class="brand">sony</div>
                                    <div class="excerpt">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis euismod erat sit amet porta. Etiam venenatis ac diam ac tristique. Morbi accumsan consectetur odio ut tincidunt.</p>
                                    </div>
                                    <div class="addto-compare">
                                        <a class="btn-add-to-compare" href="#">add to compare list</a>
                                    </div>
                                </div>
                            </div><!-- /.body-holder -->
                            <div class="no-margin col-xs-12 col-sm-3 price-area">
                                <div class="right-clmn">
                                    <div class="price-current">$1199.00</div>
                                    <div class="price-prev">$1399.00</div>
                                    <div class="availability"><label>availability:</label><span class="available">  in stock</span></div>
                                    <a class="le-button" href="#">add to cart</a>
                                    <a class="btn-add-to-wishlist" href="#">add to wishlist</a>
                                </div>
                            </div><!-- /.price-area -->
                        </div><!-- /.row -->
                    </div><!-- /.product-item -->

                </div><!-- /.products-list -->

                <div class="pagination-holder">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 text-left">
                            <ul class="pagination">
                                <li class="current"><a  href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">next</a></li>
                            </ul><!-- /.pagination -->
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="result-counter">
                                Showing <span>1-9</span> of <span>11</span> results
                            </div><!-- /.result-counter -->
                        </div>
                    </div><!-- /.row -->
                </div><!-- /.pagination-holder -->

            </div><!-- /.products-grid #list-view -->

        </div><!-- /.tab-content -->
    </div><!-- /.grid-list-products -->

</section><!-- /#gaming -->                        