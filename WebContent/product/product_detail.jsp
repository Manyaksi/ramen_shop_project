<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- <script>
	
	window.onload = function() {
		
		eventRegist();

	}

	/**
	 * 이벤트소스에 이벤트핸들러 등록
	 */
	function eventRegist() {
		document.review.onsubmit = function() {
			//location.href("");
			return send(document.review);
		};
	}
	/**
	 *  서버에 폼 데이터 전성
	 */
	function send(form) {
		//유효성 체크
		if (!formValidate(form)) {
			return false;
			//event.preventDefault();
		}
		return true;
	}




	
</script>
 -->



<!-- ========================================= SINGLE PRODUCT TAB ========================================= -->
	<section id="single-product-tab">
	    <div class="container">
	        <div class="tab-holder">
	            
	            <ul class="nav nav-tabs simple" >
	                <li class="active"><a href="#description" data-toggle="tab">제품소개</a></li>
	                <li><a href="#reviews" data-toggle="tab">제품후기</a></li>
	            </ul><!-- /.nav-tabs -->
	
	            <div class="tab-content">
	                <div class="tab-pane active" id="description">
	                    <p><b>면</b> : 소맥분(미국산, 호주산) , 팜유(말레이시아산) , 감자전분 , 변성전분 , 미강풍미액 , 난각칼슘 , 정제염 , 면류첨가알칼리제(산도조절제) , 혼합제제(산도조절제) , 올리고녹차풍미액 , 비타민B2</p>
	
	                    <p><b>스프류</b> : 분말짜장 , 정백당 , 분말카라멜2호(카라멜색소, 물엿분말) , 짜장베이스 , 짜장베이스분말 , 볶음조미소맥분 , 분말카라멜 3호(카라멜색소,물엿분말,효소처리스테비아) , 야채오일분말 , 볶음조미옥수수분 , 볶음조미감자분 , 조미짜장분말 , 물엿분말 , 육수맛조미베이스 , 5-리보뉴클레오티드이나트륨 , 정제염 , 대두단백 , 건양배추 , 튀김감자다이스 , 건양파 , 건당근스프류 : 분말짜장 , 정백당 , 분말카라멜2호(카라멜색소, 물엿분말) , 짜장베이스 , 짜장베이스분말 , 볶음조미소맥분 , 분말카라멜 3호(카라멜색소,물엿분말,효소처리스테비아) , 야채오일분말 , 볶음조미옥수수분 , 볶음조미감자분 , 조미짜장분말 , 물엿분말 , 육수맛조미베이스 , 5-리보뉴클레오티드이나트륨 , 정제염 , 대두단백 , 건양배추 , 튀김감자다이스 , 건양파 , 건당근</p>
	
	                  
	                </div><!-- /.tab-pane #description -->
	
	               
	
	                <div class="tab-pane" id="reviews">
	                    <div class="comments">
	                        <div class="comment-item">
	                            <div class="row no-margin">
	                            
	                            <c:forEach items="${reviewList }" var="reviewList" varStatus="state">
	                                <div class="col-lg-1 col-xs-12 col-sm-2 no-margin">
	                                    <div class="avatar">
	                                        <img alt="avatar" src="/assets/images/default-avatar.jpg">
	                                    </div><!-- /.avatar -->
	                                </div><!-- /.col -->
	
									
	                                <div class="col-xs-12 col-lg-11 col-sm-10 no-margin">
	                                    <div class="comment-body">
	                                        <div class="meta-info">
	                                            <div class="author inline">
	                                                <a href="#" class="bold">${reviewList.id }</a>
	                                            </div>
	                                            <div class="star-holder inline">
	                                                <div class="star" data-score=${reviewList.review_satisfy } ></div>
	                                            </div>
	                                            <div class="date inline pull-right">
	                                                12.07.2013
	                                            </div>
	                                        </div><!-- /.meta-info -->
	                                        <p class="comment-text">
	                                            ${reviewList.review_content}
	                                        </p><!-- /.comment-text -->
	                                    </div><!-- /.comment-body -->
	
	                                </div><!-- /.col -->
	                                </c:forEach>
	
	                            </div><!-- /.row -->
	                        </div><!-- /.comment-item -->
	
	                        
	
	                        </div><!-- /.comment-item -->
	                    </div><!-- /.comments -->
	
	                    <div class="add-review row">
	                        <div class="col-sm-8 col-xs-12">
	                            <div class="new-review-form">
	                                <h2>제품후기 작성</h2>
	                                <form id="contact-form" class="contact-form" method="post" 
	                                name = "review" action="/board/review.mall">
	                                    <div class="row field-row">
	                                        <div class="col-xs-12 col-sm-6">
	                                            <label>아이디*</label>
	                                            <c:if test="${cookie.loginId != null }" var="varname" scope="request">
	                                            <input class="le-input" value=${cookie.loginId.value } disabled="disabled">
	                                            </c:if>
	                                            <c:if test="${cookie.loginId == null }" var="varname" scope="request">
	                                            <input class="le-input" value="로그인 후 입력 가능합니다." disabled="disabled">
	                                            </c:if>
	                                            <input type="hidden" name="id" value=${cookie.loginId.value }>
	                                            <input type="hidden" name="product_number" value=${detail.product_number }>
	                                            
	                                        </div>
	                                       
	                                    </div><!-- /.field-row -->
	                                    
	                                    <div class="field-row star-row">
	                                        <label>평점</label>
	                                        <div class="star-holder">
	                                            <div class="star big" data-score="1">
	                                            </div>
		                                        </div>
	                                    </div><!-- /.field-row -->
	
	                                    <div class="field-row">
	                                        <label>후기내용 </label>
	                                        <textarea rows="8" class="le-input" name="content" id="reviewcontent" maxlength="400"></textarea>
	                                    </div><!-- /.field-row -->
	                                    <span id="message">0/200</span>
	
	                                    <div class="buttons-holder">
	                                        <button type="submit" class="le-button huge">후기작성</button>
	                                    </div><!-- /.buttons-holder -->
	                                </form><!-- /.contact-form -->
	                            </div><!-- /.new-review-form -->
	                        </div><!-- /.col -->
	                    </div><!-- /.add-review -->
	
	                </div><!-- /.tab-pane #reviews -->
	            </div><!-- /.tab-content -->
	
	        </div><!-- /.tab-holder -->
	    </div><!-- /.container -->
	</section><!-- /#single-product-tab -->
<!-- ========================================= SINGLE PRODUCT TAB : END ========================================= -->