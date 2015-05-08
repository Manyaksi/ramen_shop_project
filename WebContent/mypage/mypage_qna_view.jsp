<%@ page contentType="text/html; charset=utf-8" %>


<div class="row" style="padding: 15px; border-bottom: 1px solid #ececec;">
          <div class="col-xs-2 text-center">작성자&nbsp;:&nbsp;${readqna.id }</div>
          <div class="col-xs-4 text-center" >작성날짜&nbsp;:&nbsp;${readqna.list_date }</div>
          <div class="col-xs-6 text-right">조회수&nbsp;:&nbsp;${readqna.hit_count }</div>
</div>
    

<div class="row" style=" padding:15px; border-bottom: 1px solid #ececec;">
<h3 style="padding-left:45px;">${readqna.list_title }</h3>
</div>

<div class="row text-center" style="padding:50px; border-bottom: 1px solid #ececec;">
${readqna.list_content }
</div>


<div class="row" style="padding:10px;">    
<div class="col-sm-2 text-center">
<label><a href="/mypage/qna.mall">목록보기</a></label>
</div>
<div class="col-sm-2 col-sm-offset-8 text-center">
<label><a href="/mypage/mypagerewrite.jsp?group_no=${readqna.group_no }&step_no=${readqna.step_no }&order_no=${readqna.order_no }">답글쓰기</a></label>
<label><a href="3">수정하기</a></label>
</div>
</div>

<div ></div>  
         
       	