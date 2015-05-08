<%@ page contentType="text/html; charset=utf-8" %>

					<h2 class="bordered">회원정보수정</h2>
					<p>회원정보수정 페이지 입니다.</p>

					<form role="form" class="register-form cf-style-1" id="modify"
					action="/mypage/modifymember.mall" method="post">
						<div class="col-xs-12">
						<label>이름</label>
                            <input type="text" class="le-input" name="name" value=${member.name } disabled="disabled" id="name">
                            <input type="hidden" name= "name" value=${member.name }>
						
						</div>
						
						<div class="col-xs-12">
						<label>아이디</label>
                            <input type="text" class="le-input" name="id" value=${member.id } disabled="disabled" id="id">
                             <input type="hidden" name= "id" value=${member.id }>
						
						</div>
                            


                                             
                                                
                                                <div class="col-xs-4" >
                                                
                                                 <label>비밀번호</label>
                            
                            
                            <input type="password" class="le-input" name="passwd" id="passwd">
                                                </div>
                                                
                                                <div class="col-xs-4">
                                                <label>비밀번호확인</label>
                            <input type="password" class="le-input" name="repasswd" id="repasswd">
                                                
                                                </div>
                                                
                           
                     

				<div class="col-xs-12"><label>주소, 우편번호</label></div>
				
				<div class="col-xs-4">
				<input type="text" class="le-input" id="sample6_postcode1" name="postcode1" value=${member.postcode1 }>
				</div>
				
				<div class="col-xs-4">
					<input type="text" class="le-input" id="sample6_postcode2" name="postcode2" value=${member.postcode2 }>
				</div>
				
				<div class="col-xs-4">
					<input type="button" class="le-button"onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		        </div> 
                
				
		
		<div class="col-xs-12">
				<input type="text" class="le-input" id="sample6_address"
					 name="address" value="${member.address_1 }">
		<input type="text" class="le-input" id="sample6_address2"
					placeholder="상세주소" name="detail" value=${member.address_2 }></div>
		
		<div class="col-xs-12">
                            <label>이메일</label>
                            <input type="text" class="le-input" name="email" value=${member.email }>
                        </div>

                         <div class="col-xs-12">
                            <label>휴대폰번호</label>
                            <input type="text" class="le-input" name="phonenumber" value=${member.phonenumber }>
                        </div><!-- /.field-row -->
		

		<div class="col-xs-12 text-center" style="margin-top:50px;">
                        <div class="buttons-holder">
                            <button type="submit" class="le-button huge">수정하기</button>
                        </div><!-- /.buttons-holder -->
                        </div>
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


 







