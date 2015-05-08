<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>글쓰기</h2>
			 
		<form class="form-horizontal" id="write" action="/mypage/qnawrite.mall"method="post">

<div class="row" style="margin-top:30px;">
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control"
							placeholder="제목을 입력하세요" name="title" id="qnaTitle">
					</div>
				</div>
			<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">글 내용</label>
			<div class="col-sm-10">
         <textarea class="form-control" rows="15" placeholder="글 내용을 입력하세요" name="content" id="qnaContent"></textarea>
         </div>
         </div>
         
    </div>

<div class="row">    
<div class="col-sm-2 col-sm-offset-2 text-left">
<label><a href="/mypage/qna.mall">목록보기</a></label>
</div>
<div class="col-sm-2 col-sm-offset-6 text-right">
<label><button type="submit" class="le-button huge">작성하기</button></label>
</div>
</div>
         </form>

