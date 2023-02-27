<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 
	 	<title>한쓰째즈LP까폐</title>
	</head>
	<style>
	a, td, th, table, li, a {font-family: 'Noto Sans KR', sans-serif;}
	
  	table{
 		border-collapse: collapse;
 		width: 1300px;    
 		margin : auto;
 		margin-top : 30px;
 		text-align: center;
  	}
  	td, th{
  		border-bottom: 1px solid #ddd;
  		height: 50px;
  	}
  	th{
  		font-size : 19px;
  	}
  	thead{
  		font-weight: 800;
  	}
  	
  	.banner-Image{
  		width: 1300px;
  		height: 500px;
  		margin: auto;
  	}
	
	.bno_wrap{
		width: 10%;
	}
	
	.name_wrap{
		width: 45%;
	}
	
	.writer_wrap{
	 	width: 15%;
	}
	
	.regdate_wrap{
		width: 20%;
	}
	
	.view_wrap{
		width: 10%;
	}
	
	.replyCount, .role_Text{
		color: red;
		font-weight: 700;
	}
	
	.file_Image{
		margin-bottom: -6px;
	}
	
	.pagination{
	
	}
	
	.pagination li{
		list-style: none; 
		display:inline-block;
	}
	
	.search_table {
  	display: flex;
  	justify-content: center;
  	align-items: center;
  	padding-top: 30px;
	}
	
	.input-group {
  		display: flex;
  		align-items: center;
	}

	.search_table .type_selecter {
  		width: 100px;
  		height: 30px;
	}

	.search_table .search_input {
  		width: 200px;
  		height: 30px;
	}

	.search_table .search_button {
  		width: 100px;
  		height: 30px;
	}
	
	.pagination {
  		display: flex;
  		justify-content: center;
  		align-items: center;
  		padding: 10px;
  		font-size: 17px;
  		font-weight: bold;
	}

	.pagination li {
  		padding: 0 10px;
	}

	.pagination a {
  		text-decoration: none;
  		color: black;
	}
	
	</style>
	<body>
		<div class="container">

			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
			<div id="banner">
				<div class="banner-Image">
					<img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F3f92e3db-49c0-41f1-8417-b655111a1de6%2F%25EC%2595%2588%25EB%2585%2595%25ED%2595%2598%25EC%2584%25B8%25EC%259A%2594_%25EC%2598%25A4%25EB%258A%2598%25EB%258F%2584_%25EC%25A6%2590%25EA%25B1%25B0%25EC%259A%25B4_%25ED%2595%2598%25EB%25A3%25A8_%25EB%25B3%25B4%25EB%2582%25B4%25EC%2584%25B8%25EC%259A%2594.png?table=block&id=5debbf5f-ca18-4f89-b2de-1cb8b5b0e41c&spaceId=2b7cc640-ccde-444e-b34a-e4adcd1367c6&width=1900&userId=916f94dc-5593-4f96-af20-76df5f60b522&cache=v2" width="1300" height="500">
				</div>
			</div>
			
			<section id="container" class="table_parent">
				<form role="form" method="get">
					<table class="table_list">
						<thead>
							<tr>
								<th class="bno_wrap">번호</th>
								<th class="name_wrap">제목</th>
								<th class="writer_wrap">작성자</th>
								<th class="regdate_wrap">등록일</th>
								<th class="view_wrap">조회수</th>
							</tr>
						</thead>
						
						<c:forEach items="${list}" var = "list">
							<tr class = "table_items">
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
									<c:out value="${list.title}"/>
									</a>
									<span class="replyCount"> [${controller.getReplyCount(list.bno)}] </span>
									<c:if test = "${controller.getHasFile(list) == true}">
										<img class="file_Image" src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F18c17374-7195-44c7-9817-5a244c460326%2F4856668.png?table=block&id=5c837d47-7778-4ff4-ba2f-543b5dea6018&spaceId=2b7cc640-ccde-444e-b34a-e4adcd1367c6&width=2000&userId=916f94dc-5593-4f96-af20-76df5f60b522&cache=v2" width="24" height="24">
									</c:if>
								</td>
								<td>
									<c:out value="${list.writer}" />
									<c:if test= "${controller.getWriterRole(list.writer) == 'MANAGER'}">
										<span class="role_Text">[관리자]</span>
									</c:if>
								</td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${list.hit}" /></td>
							</tr>
						</c:forEach>
						
					</table>
					<div class="search_table">
							<select name="searchType" class="type_selecter">
								<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
						 
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="search_input"/>
								<button id="searchBtn" type="button" class="search_button">검색</button> 	
						</div>
						 
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });   
						</script>
					</div>
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
				</form>
			</section>
		</div>
	</body>
</html>