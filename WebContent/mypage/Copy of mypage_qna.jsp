<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>Q&A 게시판</h2>
<table class="table table-hover" style="margin-top: 30px;">

	<thead>
		<tr>
			<th class="col-xs-1 text-center">글번호</th>
			<th class="col-xs-2 text-center">글쓴이</th>
			<th class="col-xs-6 text-center">제목</th>
			<th class="col-xs-2 text-center">등록일</th>
			<th class="col-xs-1 text-center">조회수</th>
		</tr>
	</thead>
</table>

<div id="content2">
<table class="table table-hover">
			<c:forEach items="${qnaList }" var="qnaList" varStatus="state">
				<tr>

					<th class="text-center" scope="row">${state.count }</th>
					<td class="text-center">${qnaList.id }</td>
					<c:choose>
						<c:when test="${qnaList.step_no > 0}">
							<td><c:set var="level" value="${qnaList.step_no * 10}" /> <img
								src="/assets/images/level.gif"
								style="width: ${level }px; height: 10px;" /> <img
								src="/assets/images/re.gif" /> <a
								href="/mypage/qnaread.mall?list_number=${qnaList.list_number } ">${qnaList.list_title }</a>
							</td>
						</c:when>

						<c:otherwise>
							<td><a
								href="/mypage/qnaread.mall?list_number=${qnaList.list_number } ">${qnaList.list_title }</a></td>
						</c:otherwise>
					</c:choose>

					<td class="text-center">${qnaList.list_date }</td>
					<td class="text-center">${qnaList.hit_count }</td>
				</tr>
			</c:forEach>
</table>
</div>


<div class="text-right">
	<a href="/mypage/mypage4.jsp">글쓰기</a>

</div>

<script src="/assets/js/jquery.js"></script>
<script src="/assets/js/jPaginate.js"></script>
<script>
$(document).ready(function(){
    $("#content2").jPaginate();                       
});
</script>
