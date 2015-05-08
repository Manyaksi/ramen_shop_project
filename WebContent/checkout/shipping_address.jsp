<%@ page contentType="text/html; charset=utf-8"%>
<div class="billing-address">
	<h2 class="border h1">배송받을 주소</h2>
		<div class="row field-row">
			<div class="col-xs-12 col-sm-4">
				<label>* 받으시는 분</label> <input type="text" name="s_name" id="s_name" class="le-input"
					value="${member.name }">
			</div>

			<div class="col-xs-12 col-sm-6 col-sm-offset-2">
				<label>* 휴대폰 번호</label> <input type="text" name="s_phonenumber" id="s_phonenumber" class="le-input" value="${member.phonenumber }">


			</div>
		</div>




		<div class="row field-row">

			<div class="col-xs-2">
				<label>* 배송지</label> <input type="text" class="le-input"
					id="s_postcode1" name="postcode1"
					value="${member.postcode1 }">


			</div>
			<div class="col-xs-2">
				<label>&nbsp;</label> <input type="text" class="le-input"
					id="s_postcode2" name="postcode2"
					value="${member.postcode2 }">
			</div>
			<div class="col-xs-3">
				<label>&nbsp;</label> <input type="button" class="le-button"
					onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			</div>
		</div>
		<div class="row field-row">
			<div class="col-xs-12 col-sm-6">
				<input type="text" name="s_address1" class="le-input placeholder" id="s_address"
					data-placeholder="주소" value="${member.address_1 }">
			</div>
			<div class="col-xs-12 col-sm-6">
				<input type="text" name="s_address2" class="le-input placeholder" id="s_address2"
					data-placeholder="상세주소" value="${member.address_2 }">
			</div>
		</div>
		<!-- /.field-row -->


		<div class="row field-row">
			<div class="col-xs-12 col-sm-12">
				<label>배송메시지</label> <input type="text" name="s_message" class="le-input" id="s_message">
				<ul>
					<li style="margin-top: 10px;">* 부재시 연락가능한 전화번호 또는 상품수령이 가능한
						장소를 남겨주세요.</li>
				</ul>

			</div>
		</div>
		<!-- /.field-row -->


</div>
<!-- /.shipping-address -->


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("s_postcode1").value = data.postcode1;
						document.getElementById("s_postcode2").value = data.postcode2;
						document.getElementById("s_address").value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("s_address2").focus();
					}
				}).open();
	}
</script>