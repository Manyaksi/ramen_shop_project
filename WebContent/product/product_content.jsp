<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="single-product">
    <div class="container">

         <div class="no-margin col-xs-12 col-sm-6 col-md-5 gallery-holder">
    <div class="product-item-holder size-big single-product-gallery small-gallery">

        <div id="owl-single-product">
            <div class="single-product-gallery-item" id="slide1">
                <a data-rel="prettyphoto" href="images/products/product-gallery-01.jpg">
                    <img class="img-responsive" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/product/${detail.product_photo}" />
                </a>
            </div><!-- /.single-product-gallery-item -->

            <div class="single-product-gallery-item" id="slide2">
                <a data-rel="prettyphoto" href="images/products/product-gallery-01.jpg">
                    <img class="img-responsive" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/product-gallery-01.jpg" />
                </a>
            </div><!-- /.single-product-gallery-item -->

            <div class="single-product-gallery-item" id="slide3">
                <a data-rel="prettyphoto" href="images/products/product-gallery-01.jpg">
                    <img class="img-responsive" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/product-gallery-01.jpg" />
                </a>
            </div><!-- /.single-product-gallery-item -->
        </div><!-- /.single-product-slider -->


        <div class="single-product-gallery-thumbs gallery-thumbs">

            <div id="owl-single-product-thumbnails">
                <a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="0" href="#slide1">
                    <img width="67" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/gallery-thumb-01.jpg" />
                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="1" href="#slide2">
                    <img width="67" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/gallery-thumb-01.jpg" />
                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide3">
                    <img width="67" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/gallery-thumb-01.jpg" />
                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="0" href="#slide1">
                    <img width="67" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/gallery-thumb-01.jpg" />
                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="1" href="#slide2">
                    <img width="67" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/gallery-thumb-01.jpg" />
                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide3">
                    <img width="67" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/gallery-thumb-01.jpg" />
                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="0" href="#slide1">
                    <img width="67" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/gallery-thumb-01.jpg" />
                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="1" href="#slide2">
                    <img width="67" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/gallery-thumb-01.jpg" />
                </a>

                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide3">
                    <img width="67" alt="" src="/assets/images/blank.gif" data-echo="/assets/images/products/gallery-thumb-01.jpg" />
                </a>
            </div><!-- /#owl-single-product-thumbnails -->

            <div class="nav-holder left hidden-xs">
                <a class="prev-btn slider-prev" data-target="#owl-single-product-thumbnails" href="#prev"></a>
            </div><!-- /.nav-holder -->
            
            <div class="nav-holder right hidden-xs">
                <a class="next-btn slider-next" data-target="#owl-single-product-thumbnails" href="#next"></a>
            </div><!-- /.nav-holder -->

        </div><!-- /.gallery-thumbs -->

    </div><!-- /.single-product-gallery -->
</div><!-- /.gallery-holder -->        
        <div class="no-margin col-xs-12 col-sm-7 body-holder">
    <div class="body">
        <div class="star-holder inline"><div class="star" data-score="4"></div></div>
        <div class="availability"><label>Availability:</label><span class="available">  in stock</span></div>

        <div class="title"><a href="#">${detail.product_name}</a></div>
        <div class="brand">${detail.product_company}</div>

        
        <div class="excerpt">
            <p>${detail.product_explain}</p>
        </div>
        
        <div class="prices">
            <div class="price-current">${detail.product_redprice}원</div>
            <div class="price-prev">${detail.product_orgprice}원</div>
        </div>

         <form action="/product/addcart.mall" method="get" id="addcart">
        <input type="hidden" name="product_number" value="${detail.product_number }" id="product_number">
          <input type="hidden" name="id" value="${cookie.loginId.value }">
        <div class="qnt-holder">
            
            <div class="le-quantity">
               
                    <a class="minus" href="#reduce"></a>
                    <input type="text" name="shopping_count" readonly="readonly" value="1" >
                    <a class="plus" href="#add"></a>
                    
                    
           
           
                    
            </div>
            <!-- <a id="addto-cart" href="/cart/cart.mall" class="le-button huge">장바구니에 넣기</a> -->
            <button type="submit" id="addto-cart" class="le-button huge">장바구니에 넣기</button>
            <span id="message"></span>
        </div><!-- /.qnt-holder -->
        </form>
        </div><!-- /.qnt-holder -->
    </div><!-- /.body -->

</div><!-- /.body-holder -->
    </div><!-- /.container -->
</div><!-- /.single-product -->