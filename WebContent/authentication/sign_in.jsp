<%@ page contentType="text/html; charset=utf-8" %>





<section class="section sign-in inner-right-xs">
	<h2 class="bordered">로그인</h2>
	<p>라면.. 먹고갈래요? 당신을 위한 라면이 준비되어 있어요:)</p>

	<!--
					<div class="social-auth-buttons">
						<div class="row">
							
                            <div class="col-md-6">
								<button class="btn-block btn-lg btn btn-facebook"><i class="fa fa-facebook"></i> 페이스북 로그인</button>
							</div>
							<div class="col-md-6">
								<button class="btn-block btn-lg btn btn-twitter"><i class="fa fa-twitter"></i>
                                트위터 로그인</button>
							</div>
                       
						</div>
					</div>
                     -->

	<form class="login-form cf-style-1 form-group-lg" id="sign_in"
	action="/authentication/sign_in.mall"  method="post">
		<div class="field-row ">
			<label>아이디</label> <input type="text" class="le-input " name="id" id="id">
		</div>
		<!-- /.field-row -->

		<div class="field-row">
			<label>비밀번호</label> <input type="password" class="le-input" name="passwd" id="passwd">
		</div>
		<!-- /.field-row -->

		<div class="field-row clearfix">
			<!--
                        	<span class="pull-left">
                        		<label class="content-color"><input type="checkbox" class="le-checbox auto-width inline"> <span class="bold">Remember me</span></label>
                        	</span>
                        -->
			<span class="pull-left"> <a href="#" class="content-color ">회원정보를
					잊으셨나요?</a>
			</span>
		</div>

		<div class="buttons-holder">
			 <button type="submit" class="le-button huge">로그인하기</button>
		</div>
		<!-- /.buttons-holder -->
	</form>
	<!-- /.cf-style-1 -->

	<div style="margin-top: 70px;">
		<h2 class="semi-bold">'라면먹고갈래?' 가입하시면</h2>

		<ul class="list-unstyled list-benefits">
			<li><i class="fa fa-check primary-color"></i> 다양한 라면 정보를 얻을 수
				있습니다</li>
			<li><i class="fa fa-check primary-color"></i> 주문과 관련된 서비스를 이용할 수
				있습니다</li>
			<li><i class="fa fa-check primary-color"></i> 신제품에 대한 정보를 주기적으로
				얻을 수 있습니다</li>
		</ul>

	</div>

</section>
<!-- /.sign-in -->