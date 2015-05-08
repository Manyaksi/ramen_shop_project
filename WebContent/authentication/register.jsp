<%@page import="kr.or.kosta.member.dao.MemberDao"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@ page contentType="text/html; charset=utf-8" %>

 <script type="text/javascript" src="/js/ajax.js"></script>




<section class="section register inner-left-xs">
					<h2 class="bordered">회원가입하기</h2>
					<p>'라면먹고갈래?' 회원으로 가입하시고 즐거운 라면 쇼핑하세요!</p>

					<form role="form" class="register-form cf-style-1" name="regist" id="regist"
					action="/authentication/register.mall" method="post">
						<div class="field-row">
                            <label>이름</label>
                            <input type="text" class="le-input" name="name" id="registname">
                        </div><!-- /.field-row -->

                                                <div class="field-row">
                            <label>아이디</label><span id="message">6글자 이상 입력하세요</span>
                            <input type="text" class="le-input" name="id" id="registid">
                        </div><!-- /.field-row -->

                                                <div class="field-row">
                            <label>비밀번호</label>
                            
                            
                            <input type="password" class="le-input" name="passwd" id="registpasswd">
                        </div><!-- /.field-row -->

                                                <div class="field-row">
                            <label>비밀번호확인</label>
                            <input type="password" class="le-input" name="repasswd" id="registrepasswd">
                        </div><!-- /.field-row -->

                        <div class="field-row" style="margin-bottom: 80px;">
                        
                        
                            <label>생년월일</label>
                            
                            
                            <script>

                            function date_populate(dayfield, monthfield, yearfield){
                                var today=new Date();
                                var dayfield=document.getElementById(dayfield)
                                var monthfield=document.getElementById(monthfield)
                                var yearfield=document.getElementById(yearfield)
                                for (var i=0; i<31; i++)
                                    dayfield.options[i]=new Option(i+1, i+1)
                                dayfield.options[today.getDate()]=new Option(today.getDate(), today.getDate(), true, true) //select today's day
                                for (var m=0; m<12; m++)
                                    monthfield.options[m]=new Option(m, m)
                                monthfield.options[today.getMonth()]=new Option(today.getMonth(), today.getMonth(), true, true) //select today's month
                                var thisyear=today.getFullYear()
                                for (var y=0; y<100; y++){
                                    yearfield.options[y]=new Option(thisyear, thisyear)
                                    thisyear-=1
                                }
                                yearfield.options[0]=new Option(today.getFullYear(), today.getFullYear(), true, true) //select today's year
                            }

                            </script>
                         
                         <div class="col-xs-4"><SELECT class="le-input" id ="year" name = "yyyy" id="yyyy"></SELECT></div>
                         <div class="col-xs-4"><SELECT class="le-input" id ="month" name = "mm" id="mm"></SELECT></div>
                         <div class="col-xs-4">    <SELECT class="le-input" id ="date" name = "dd" id="dd"></SELECT></div>
                         
                         
             
                
                
                 <script type="text/javascript">date_populate("date", "month", "year");</script>  
                
                        </div><!-- /.field-row -->

				
		<div class="field-row">
				
				<label>우편번호</label>
				
			<div class="row">
				<div class="col-xs-4">
					<input type="text" class="le-input" id="sample6_postcode1"
						name="postcode1">


				</div>
				<div class="col-xs-4">
					<input type="text" class="le-input" id="sample6_postcode2"
						name="postcode2">
				</div>
				<div class="col-xs-4">
					<input type="button" class="le-button"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				</div>
			</div>
		</div>
				
		
		<div class="field-row" >
		<label>주소</label>
				<input type="text" class="le-input" id="sample6_address"
					placeholder="주소" name="address">
					</div>
					
		<div class="field-row">			
				<input type="text" class="le-input" id="sample6_address2"
					placeholder="상세주소" name="detail">

		</div>

		<div class="field-row">
                            <label>이메일</label>
                            <input type="text" class="le-input" name="email" id="registemail">
                        </div><!-- /.field-row -->

                         <div class="field-row">
                            <label>휴대폰번호</label>
                            <input type="text" class="le-input" name="phonenumber" id="registphonenumber">
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