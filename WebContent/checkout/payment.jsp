<%@ page contentType="text/html; charset=utf-8" %>
<div id="payment-method-options" style="margin:0px;">
				<h2 class="border h1" style="margin-bottom: 20px;">결제방식</h2>
                    <div class="payment-method-option">
                        <input class="le-radio" type="radio" name="group2" value="Direct" id="paymethod"><i class="fake-box"></i>
                        <div class="radio-label bold ">실시간 계좌이체<br>
                        </div>
                    </div><!-- /.payment-method-option -->
                    
                    <div class="payment-method-option">
                        <input class="le-radio" type="radio" name="group2" value="cheque" id="paymethod" checked=""><i class="fake-box" ></i>
                        <div class="radio-label bold ">신용, 체크카드 결제</div>
                    </div><!-- /.payment-method-option -->
                    
                    <div class="payment-method-option">
                        <input class="le-radio" type="radio" name="group2" value="paypal" id="paymethod"><i class="fake-box"></i>
                        <div class="radio-label bold ">휴대폰 안전 결제</div>
                    </div><!-- /.payment-method-option -->
            </div><!-- /#payment-method-options -->