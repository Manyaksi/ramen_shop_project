<%@ page contentType="text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<!-- 헤드부분 -->
    <head>
        <!-- 메타데이터 -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>	라면먹고갈래? - 대한민국 1등 라면 온라인 쇼핑</title>

        <!-- 부트스트랩 Core CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        
        
        <!-- 메인상단 큰배너에 관한 CSS -->
        <link rel="stylesheet" type="text/css"	href="../assets/js//amazingslider-1.css">
        
        
        <!-- 커스터마이징 CSS -->
        <link rel="stylesheet" href="../assets/css/main.css">
        <link rel="stylesheet" href="../assets/css/orange.css">
        <link rel="stylesheet" href="../assets/css/owl.carousel.css">
        <link rel="stylesheet" href="../assets/css/owl.transitions.css">
        <link rel="stylesheet" href="../assets/css/animate.min.css">

        <!-- CSS커스터마이징 부분 -->
        <link rel="stylesheet" href="../assets/css/config.css">

        
        <link href="../assets/css/red.css" rel="alternate stylesheet" title="Red color">
        <link href="../assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
        
        
        <!--  
        <link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
        <link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
        <link href="assets/css/navy.css" rel="alternate stylesheet" title="Navy color">
        <link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
        -->

        <!-- 웹폰트 -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/earlyaccess/nanumpenscript.css' rel='stylesheet' type='text/css'>
        
        <!-- 아이콘CSS -->
        <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
        
        <!-- favicon이라는 아이콘 -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">

        <script src="/assets/js/jquery-2.1.3.min.js"></script>
          <script type="text/javascript">
		$(function(){
			   $("#sign_in").submit(function(){
			      return validateCheck_signin();
			   });
			   
			   $("#regist").submit(function(){
			      return validateCheck_regist();
			   });
			   
			   $("#registid").keyup(function(){
				  var data = $("#registid").val();
				   $.ajax({
			            type : "get",
			            url : "/duplication.mall",
			            data : "id="+data,
			            dataType : "html",//text,xml, json
			            success : function(result) {
			               $("#message").html(result);
			            }
					});
				   
			   });
			});
			    
				  
		
		
			   
			
			
		
		function validateCheck_signin(){
			   var idForm = $("#id");
			   if((idForm.val()).length==0){
			      alert("아이디를 입력하세요");
			      idForm.focus();
			      return false;
			   }
			   var passwdForm = $("#passwd");
			   if((passwdForm.val()).length==0){
			      alert("비밀번호를 입력하세요");
			      passwdForm.focus();
			      return false;
			   }
			}
		
		function validateCheck_regist(){
			   var nameForm = $("#registname");
			   if((nameForm.val()).length==0){
			      alert("이름을 입력하세요");
			      nameForm.focus();
			      return false;
			   }
			   var idForm = $("#registid");
			   if((idForm.val()).length==0){
			      alert("아이디를 입력하세요");
			      idForm.focus();
			      return false;
			   }
			   var passwdForm = $("#registpasswd");
			   var repasswdForm = $("#registrepasswd");
			   if((passwdForm.val()).length==0 || (repasswdForm.val()).length==0){
			      alert("비밀번호를 입력하세요");
			      passwdForm.focus();
			      return false;
			   }
			   if(passwdForm.val() != repasswdForm.val()){
			      alert("비밀번호가 일치하지 않습니다.");
			      passwdForm.focus();
			      return false;
			   }
			   
			   var postcode1 = $("#sample6_postcode1");
			   var postcode2 = $("#sample6_postcode2");
			   var address1 = $("#sample6_address1");
			   var address1 = $("#sample6_address2");
			   if((postcode1.val()).length==0 || (postcode2.val()).length==0
					   || (address1.val()).length==0 || (address2.val()).length==0){
			      alert("주소를 입력하세요");
			      address1.focus();
			      return false;
			   }
			   
			   
			   var emailForm = $("#registemail");
			   if((emailForm.val()).length==0){
			      alert("이메일을 입력하세요");
			      emailForm.focus();
			      return false;
			   }
			   
			   
			   var phonenumberForm = $("#registphonenumber");
			   if((phonenumberForm.val()).length==0){
			      alert("비밀번호를 입력하세요");
			      phonenumberForm.focus();
			      return false;
			   }
			}
		</script>

    </head>
 <!-- 헤드끝 -->   
    
    
<body>
	<div class="wrapper">
  <%-- 상단타이틀 서치메뉴 시작 --%>
      <jsp:include page="../menu/top.jsp"/>
  <%-- 상단타이틀 서치메뉴 끝 --%>
  
  <%-- 상단메뉴 --%>
  	  <jsp:include page="../menu/navigation.jsp"/>
  <%-- 상단메뉴 끝--%>
  
  <%-- 상단네비게이션 --%>
  	  <jsp:include page="../menu/breadcrumb.jsp"/>
  <%-- 상단네비게이션 끝--%>
  
  
  <%-- 메인컨텐츠 --%>
 <main id="authentication" class="inner-bottom-md">
	<div class="container">
		<div class="row">
			
			<div class="col-md-5">
				<%-- 로그인모듈 시작--%>
				<jsp:include page="../authentication/sign_in.jsp"/>
				<%-- 로그인모듈  끝--%>
			</div><!-- /.col -->

			<div class="col-md-7">
				<%-- 회원가입 모듈 시작--%>
				<jsp:include page="../authentication/register.jsp"/>
				<%-- 회원가입 모듈 끝--%>
			</div><!-- /.col -->

		</div><!-- /.row -->
	</div><!-- /.container -->
</main><!-- /.authentication -->
  <%-- 메인컨텐츠 끝--%>

 

  <%-- 푸터 시작 --%>
      <jsp:include page="/menu/footer.jsp"/>
  <%-- 푸터 끝 --%>
	</div>
	
	
  <!-- 사용된 자바스크립트 모음... 뒤쪽에 두면 페이지 로딩이 좀더 빨라진다고하네요...  -->
<div>
		<script src="../assets/js/jquery-1.10.2.min.js"></script>
		<script src="../assets/js/jquery-migrate-1.2.1.js"></script>
		<script src="../assets/js/bootstrap.min.js"></script>
		<script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
		<script src="../assets/js/gmap3.min.js"></script>
		<script src="../assets/js/bootstrap-hover-dropdown.min.js"></script>
		<script src="../assets/js/owl.carousel.min.js"></script>
		<script src="../assets/js/css_browser_selector.min.js"></script>
		<script src="../assets/js/echo.min.js"></script>
		<script src="../assets/js/jquery.easing-1.3.min.js"></script>
		<script src="../assets/js/bootstrap-slider.min.js"></script>
		<script src="../assets/js/jquery.raty.min.js"></script>
		<script src="../assets/js/jquery.prettyPhoto.min.js"></script>
		<script src="../assets/js/jquery.customSelect.min.js"></script>
		<script src="../assets/js/wow.min.js"></script>
		<script src="../assets/js/scripts.js"></script>
		<script src="../assets/js//jquery.js"></script>
		<script src="../assets/js//amazingslider.js"></script>
		<script src="../assets/js//initslider-1.js"></script>
		<script src="http://w.sharethis.com/button/buttons.js"></script>
</div>		
<!-- 자바스크립트끝 -->		
	</body>
</html>