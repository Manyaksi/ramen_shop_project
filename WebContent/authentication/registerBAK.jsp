<%@page import="kr.or.kosta.member.dao.MemberDao"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@ page contentType="text/html; charset=utf-8" %>

 <script type="text/javascript" src="/js/ajax.js"></script>
<script>
	
<%DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
		MemberDao dao = (MemberDao) factory
					.getDao("kr.or.kosta.member.dao.JdbcMemberDao");
			//(post) 방식의 로그인 처리

			request.setCharacterEncoding("utf-8");%>
	window.onload = function() {
		//document.getElementById("id").focus();

		
		
		eventRegist();

	}

	/**
	 * 이벤트소스에 이벤트핸들러 등록
	 */
	function eventRegist() {
		document.regist.onsubmit = function() {
			//location.href("");
			return send(document.regist);
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

	/**
	 *  폼에대한 유효성 검증
	 */

	/* function notNull(form) {
		var id = form.id.value;
		var passwd = form.passwd.value;
		var repasswd = form.repasswd.value;
		var name = form.name.value;
		var email = form.email.value;
		var mobile1 = form.mobile1.value;
		var mobile2 = form.mobile2.value;
		var mobile3 = form.mobile3.value;

		if (id == null || id.length == 0 || passwd == null
				|| passwd.length == 0 || repasswd == null
				|| repasswd.length == 0 || name == null || name.length == 0
				|| email == null || email.length == 0 || mobile1 == null
				|| mobile1.length == 0 || mobile2 == null
				|| mobile2.length == 0 || mobile3 == null
				|| mobile3.length == 0) {
			return true;
		}

	} */

	// 폼에 대한 유효성 검사

	/* function formValidate(form) {
		var emailReg = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[\w]+)+$/;
		var idReg = /^[A-Za-z0-9+]{6,8}$/;
		var id = form.id.value;
		var email = form.email.value;
		var passwd = form.passwd.value;
		var repasswd = form.repasswd.value;

		//아이디 유효성
		if (!(id.match(idReg))) {
			alert("id 형식맞춰라");
			clearField(document.registform.id);
			document.registform.id.focus();
			return false;
		}
		//이메일 유효성
		if (!(email.match(emailReg))) {
			alert("email 형식맞춰라");
			document.registform.email.focus();
			return false;
		}
		//노 빈칸
		if (notNull(form)) {
			alert("필수입력 사항을 모두 입력해 주세요.");
			//document.getElementById("id").focus();

			return false;
		}
		//비밀번호 확인
		if (passwd != repasswd) {
			alert("비밀번호가 다릅니다.");
			clearField(document.registform.passwd);
			clearField(document.registform.repasswd);
			document.registform.passwd.focus();
			return false;
		}

		return true;
	} */
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



<section class="section register inner-left-xs">
					<h2 class="bordered">회원가입하기</h2>
					<p>'라면먹고갈래?' 회원으로 가입하시고 즐거운 라면 쇼핑하세요!</p>

					<form role="form" class="register-form cf-style-1" name="regist"
					action="/authentication/register.mall" method="post">
						<div class="field-row">
                            <label>이름</label>
                            <input type="text" class="le-input" name="name">
                        </div><!-- /.field-row -->

                                                <div class="field-row">
                            <label>아이디</label>
                            <input type="text" class="le-input" name="id">
                        </div><!-- /.field-row -->

                                                <div class="field-row">
                            <label>비밀번호</label>
                            <input type="password" class="le-input" name="passwd">
                        </div><!-- /.field-row -->

                                                <div class="field-row">
                            <label>비밀번호확인</label>
                            <input type="password" class="le-input" name="repasswd">
                        </div><!-- /.field-row -->

                        <div class="field-row">
                            <label>생년월일</label>
                            <input type="text" class="le-input" name="birth">
                        </div><!-- /.field-row -->

                          <!-- <div class="field-row">
                            <label>주소, 우편번호</label>
                            <input type="text" class="le-input" name="address">
                        </div>/.field-row -->
                        
                        <input type="text" id="sample6_postcode1" name="postcode1"> -
<input type="text" id="sample6_postcode2" name="postcode2">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소" name="address">
<input type="text" id="sample6_address2" placeholder="상세주소" name="detail">

                          <div class="field-row">
                            <label>이메일</label>
                            <input type="text" class="le-input" name="email">
                        </div><!-- /.field-row -->

                         <div class="field-row">
                            <label>휴대폰번호</label>
                            <input type="text" class="le-input" name="phonenumber">
                        </div><!-- /.field-row -->


						

                        <div class="buttons-holder">
                            <button type="submit" class="le-button huge">회원가입</button>
                        </div><!-- /.buttons-holder -->
					</form>
					
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_postcode1").value = data.postcode1;
                document.getElementById("sample6_postcode2").value = data.postcode2;
                document.getElementById("sample6_address").value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_address2").focus();
            }
        }).open();
    }
</script>


				</section><!-- /.register -->