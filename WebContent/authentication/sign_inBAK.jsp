<%@ page contentType="text/html; charset=utf-8" %>

<script>
	

	window.onload = function() {
		//document.getElementById("id").focus();

		
		
		eventRegist();

	}

	/**
	 * 이벤트소스에 이벤트핸들러 등록
	 */
	function eventRegist() {
		document.login.onsubmit = function() {
			//location.href("");
			return send(document.login);
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


	// 클리어 필드

	function clearField(input) {
		input.value = "";
	}

	function setValue(msg) {
		document.registform.id.value = msg;
	}

	/**
	 *   서버에서 데이터 수신 콜백함수
	 **/
	function onMessage(xhr) {
		setMessage(xhr.responseText);
	}

	/**
	 *   수신메시지 출력
	 **/

	function setMessage(message) {
		var messageBox = document.getElementById("checkBox");
		if (messageBox) {
			messageBox.innerHTML = message;
		}
	}
	
	function onMessagepw(xhr) {
		setMessagepw(xhr.responseText);
	}

	/**
	 *   수신메시지 출력
	 **/

	function setMessagepw(message) {
		var messageBox = document.getElementById("passwdcheckBox");
		if (messageBox) {
			messageBox.innerHTML = message;
		}
	}
	
	
</script>

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

	<form role="form" class="login-form cf-style-1 form-group-lg" name="sign_in"
	action="/authentication/sign_in.mall"  method="post">
		<div class="field-row ">
			<label>아이디</label> <input type="text" class="le-input " name="id">
		</div>
		<!-- /.field-row -->

		<div class="field-row">
			<label>비밀번호</label> <input type="text" class="le-input" name="passwd">
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