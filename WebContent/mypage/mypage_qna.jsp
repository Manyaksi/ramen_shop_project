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
		<c:set var="length" value="0" />
      <c:forEach items="${qnaList }">
         <c:set var="length" value="${length + 1 }" />

      </c:forEach>

<tbody id="pagelist">
			<c:forEach items="${qnaList }" var="qnaList" varStatus="state">
				<tr>

					<td class="col-xs-1 text-center" scope="row">${length }</td>
					<td class="col-xs-2 text-center">${qnaList.id }</td>
					<c:choose>
						<c:when test="${qnaList.step_no > 0}">
							<td class="col-xs-6"><c:set var="level" value="${qnaList.step_no * 10}" /> <img
								src="/assets/images/level.gif"
								style="width: ${level }px; height: 10px;" /> <img
								src="/assets/images/re.gif" /> <a
								href="/mypage/qnaread.mall?list_number=${qnaList.list_number } ">${qnaList.list_title }</a>
							</td>
						</c:when>

						<c:otherwise>
							<td class="col-xs-6"><a
								href="/mypage/qnaread.mall?list_number=${qnaList.list_number } ">${qnaList.list_title }</a></td>
						</c:otherwise>
					</c:choose>

					<td class="col-xs-2 text-center">${qnaList.list_date }</td>
					<td class="col-xs-1 text-center">${qnaList.hit_count }</td>
				</tr>
				<c:set var="length" value="${length -1 }"/>
			</c:forEach>
			
			</tbody>
</table>


<form id="boardSearch" action="/boardsearch.mall" method="post">
	<div class="text-right">
		<input class="search-field" placeholder="insert here search value"
			name="searchValue" />
			 <select name="searchType">
			<option value="all" selected="selected">전체검색</option>
			<option value="list_title">제목</option>
			<option value="list_content">내용</option>
			<option value="id">아이디</option>
		</select>

		<button type="submit">검색</button>
		<a href="/mypage/mypage4.jsp">글쓰기</a>
	</div>
</form>
